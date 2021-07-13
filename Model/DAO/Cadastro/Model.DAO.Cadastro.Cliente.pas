unit Model.DAO.Cadastro.Cliente;

interface

uses
  Data.DB,
  Model.DAO.Cadastro,
  Model.DAO.Cadastro.Interfaces,
  Model.DAO.Eventos.DataSet.Interfaces,
  Model.DAO.Eventos.DataSet,
  Model.DAO.Cadastro.View.Interfaces;

type
  TModelDAOCadastroCliente = class(TModelDAOCadastro, IModelDAOCadastroClienteView)
  private
    FCodigo: Integer;
    FAfterDelete: TDataSetNotifyEvent;

    procedure NewRecorde(DataSet: TDataSet);
    procedure BeforePost(DataSet: TDataSet);
  public
    function Codigo(const pValor: Integer): IModelDAOCadastroClienteView;
    function SetAfterDelete(pValor: TDataSetNotifyEvent): IModelDAOCadastroClienteView;

    function Consultar: IModelDAOCadastro; override;
  end;

implementation

uses
  StrUtils, System.SysUtils, Model.DAO.Cliente.Informacao;

{ TModelDAOCadastroCliente }

procedure TModelDAOCadastroCliente.BeforePost(DataSet: TDataSet);
begin
  if DataSet.State in dsEditModes then
  begin
    if DataSet.FieldByName('CPF').OldValue <> DataSet.FieldByName('CPF').NewValue then
    begin
      if not TModelDAOClienteValidar.CPF(Trim(DataSet.FieldByName('CPF').AsString)) then
        raise Exception.Create('O CPF cadastrado já existe!');
    end;
  end;

  if (Trim(DataSet.FieldByName('CPF').AsString) <> EmptyStr)
  and (StrToFloatDef(DataSet.FieldByName('CPF').AsString, -1) = -1) then
    raise Exception.Create('Você deve preencher um CPF válido!');
end;

function TModelDAOCadastroCliente.Codigo(const pValor: Integer): IModelDAOCadastroClienteView;
begin
  FCodigo := pValor;

  Result := Self;
end;

function TModelDAOCadastroCliente.Consultar: IModelDAOCadastro;
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
  FecharDataSet;

  AdicionarSQL(CONST_BUSCAR_CLIENTES
              + IfThen(FCodigo > 0,
                       'WHERE CODIGO = ' + FCodigo.ToString));

  EventosDataSet.BeforePost(BeforePost);
  EventosDataSet.NewRecord(NewRecorde);

  if Assigned(FAfterDelete) then
    EventosDataSet.AfterDelete(FAfterDelete);

  AdicionarEventosDataSet;

  AbrirDataSet;

  AdicionarMascara('CPF',  '###.###.###-##;0');

  Result := Self;
end;

procedure TModelDAOCadastroCliente.NewRecorde(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGO').AsInteger := TModelDAOClienteGet.ProximoCodigoCliente;
end;

function TModelDAOCadastroCliente.SetAfterDelete(
  pValor: TDataSetNotifyEvent): IModelDAOCadastroClienteView;
begin
  FAfterDelete := pValor;

  Result := Self;
end;

end.
