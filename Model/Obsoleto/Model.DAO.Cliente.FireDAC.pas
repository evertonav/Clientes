unit Model.DAO.Cliente.FireDAC;

interface

uses
  Data.DB,
  Model.Eventos.Fabrica.Interfaces,
  Model.Eventos.Preencher.Interfaces,
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  FireDAC.Stan.Def,
  FireDAC.Stan.Param,
  FireDAC.Dapt,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Model.DAO.Cliente.Interfaces;

type
  TModelDAOClienteFireDac = class(TInterfacedObject,
                             IModelDAOCliente)
  private
    FEventos: IModelEventosFabrica;
    FQuery: TFDQuery;
    FConexao: TFDConnection;
    FCodigo: Integer;

    procedure AntesAbrir;
    procedure DepoisAbrir;

    procedure AdicionarSQL;
    procedure PreencherEventosQuery;

    function GetProximoCodigoCliente: Integer;
    function CPFValido(const pCPF: string): Boolean;

    procedure NewRecorde(DataSet: TDataSet);
    procedure BeforePost(DataSet: TDataSet);

    function Codigo(pValor: Integer): IModelDAOCliente;
    function Eventos: IModelEventosPreencher;
    function Fechar: IModelDAOCliente;
    function Abrir: IModelDAOCliente;
  public
    constructor Create(pDataSource: TDataSource);
    destructor Destroy; override;
  end;

implementation

uses
  Model.Conexao.Conectar.Fabrica,
  System.SysUtils,
  Model.Eventos.Fabrica,
  System.Classes;

{ TModelDAOClienteFireDac }

function TModelDAOClienteFireDac.Abrir: IModelDAOCliente;
begin
  AntesAbrir;

  try
    FQuery.Open;
  except
    on E: Exception do
      raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
  end;

  DepoisAbrir;

  Result := Self;
end;

procedure TModelDAOClienteFireDac.AdicionarSQL;
const
  CONST_BUSCAR_CLIENTES = ' SELECT '
                        + '   CODIGO, '
                        + '   NOME, '
                        + '   CPF, '
                        + '   ENDERECO, '
                        + '   CIDADE, '
                        + '   ESTADO '
                        + ' FROM '
                        + '   CLIENTES ';
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(CONST_BUSCAR_CLIENTES);

  if FCodigo > 0 then
    FQuery.SQL.Add('WHERE CODIGO = ' + FCodigo.ToString);
end;

procedure TModelDAOClienteFireDac.AntesAbrir;
begin
  AdicionarSQL;
  PreencherEventosQuery;
end;

procedure TModelDAOClienteFireDac.BeforePost(DataSet: TDataSet);
begin
  if DataSet.State in dsEditModes then
  begin
    if DataSet.FieldByName('CPF').OldValue <> DataSet.FieldByName('CPF').NewValue then
    begin
      if not CPFValido(Trim(DataSet.FieldByName('CPF').AsString)) then
        raise Exception.Create('O CPF cadastrado já existe!');
    end;
  end;

  if (Trim(DataSet.FieldByName('CPF').AsString) <> EmptyStr)
  and (StrToFloatDef(DataSet.FieldByName('CPF').AsString, -1) = -1) then
    raise Exception.Create('Você deve preencher um CPF válido!');
end;

function TModelDAOClienteFireDac.Codigo(pValor: Integer): IModelDAOCliente;
begin
  FCodigo := pValor;

  Result := Self;
end;

function TModelDAOClienteFireDac.CPFValido(const pCPF: string): Boolean;
const
  CONST_GET_PROXIMO_CODIGO_CLIENTE = 'SELECT '
                                   + '  CPF '
                                   + 'FROM '
                                   + '  CLIENTES '
                                   + 'WHERE CPF = :CPF ';
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FQuery.Connection;

    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(CONST_GET_PROXIMO_CODIGO_CLIENTE);

    lQuery.Params.ParamByName('CPF').AsString := pCPF;

    lQuery.Open;

    Result := lQuery.IsEmpty;
  finally
    lQuery.Close;
    lQuery.Free;
  end;
end;

constructor TModelDAOClienteFireDac.Create(pDataSource: TDataSource);
begin
  TModelConexaoConectarFabrica.Conexao.Conectar(FConexao);

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  pDataSource.DataSet := FQuery;

  FEventos := TModelEventosFabrica.Criar;
end;

procedure TModelDAOClienteFireDac.DepoisAbrir;
begin
  TStringField(FQuery.FieldByName('CPF')).EditMask := '###.###.###-##;0';
  //TLargeintField(FQuery.FieldByName('CPF')).Alignment := TAlignment.taLeftJustify;
end;

destructor TModelDAOClienteFireDac.Destroy;
begin
  if Assigned(FQuery) then
    FQuery.Free;

  if Assigned(FConexao) then
    FConexao.Free;

  inherited;
end;

function TModelDAOClienteFireDac.Eventos: IModelEventosPreencher;
begin
  Result := FEventos.PreencherEventos;
end;

function TModelDAOClienteFireDac.Fechar: IModelDAOCliente;
begin
  FQuery.Close;

  Result := Self;
end;

function TModelDAOClienteFireDac.GetProximoCodigoCliente: Integer;
const
  CONST_GET_PROXIMO_CODIGO_CLIENTE = 'SELECT '
                                   + '  COALESCE(MAX(CODIGO), 0) + 1 '
                                   + 'FROM '
                                   + '  CLIENTES ';
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FQuery.Connection;

    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(CONST_GET_PROXIMO_CODIGO_CLIENTE);
    lQuery.Open;

    Result := lQuery.Fields[0].AsInteger;
  finally
    lQuery.Close;
    lQuery.Free;
  end;
end;

procedure TModelDAOClienteFireDac.NewRecorde(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGO').AsInteger := GetProximoCodigoCliente;
end;

procedure TModelDAOClienteFireDac.PreencherEventosQuery;
begin
  FQuery.BeforePost := BeforePost;
  FQuery.OnNewRecord := NewRecorde;
  FQuery.BeforeDelete := FEventos.GetEventos.AfterDelete;
end;

end.
