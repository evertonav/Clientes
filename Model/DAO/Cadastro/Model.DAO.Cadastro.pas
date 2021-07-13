unit Model.DAO.Cadastro;

interface

uses
  Model.DAO.Cadastro.Interfaces,
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  FireDAC.Stan.Def,
  FireDAC.Stan.Param,
  FireDAC.Dapt,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.PG,
  Data.DB,
  DAO.DMConexao,
  Model.DAO.Eventos.DataSet.Interfaces,
  Model.DAO.Eventos.DataSet;

type
  TTipoCampo = (tcInteger, tcString);

  TModelDAOCadastro = class(TInterfacedObject, IModelDAOCadastro)
  private
    FQuery: TFDQuery;
    FEventosDataSet: IModelDAOEventosDataSet;
  protected
    function FecharDataSet: IModelDAOCadastro;

    function AdicionarSQL(const pSQL: string): IModelDAOCadastro;

    function AdicionarParametro(const pNomeParametro: string;
                                const pValor: Variant): IModelDAOCadastro;

    function EventosDataSet: IModelDAOEventosDataSet;

    function AdicionarEventosDataSet: IModelDAOCadastro;

    function AbrirDataSet: IModelDAOCadastro;

    function AdicionarMascara(const pNomeCampo: string;
                              const pMascara: string): IModelDAOCadastro;

    function AdicionarMascaraDisplay(const pNomeCampo: string;
                                     const pMascara: string): IModelDAOCadastro;
  public
    function Consultar: IModelDAOCadastro; virtual; abstract;

    constructor Create(pDataSource: TDataSource);
    destructor Destroy; override;

    class function Criar(pDataSource: TDataSource): IModelDAOCadastro; virtual;
  end;

implementation

uses
  System.SysUtils;

{ TModelDAOCadastro }

function TModelDAOCadastro.AbrirDataSet: IModelDAOCadastro;
begin
  FQuery.Open;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarEventosDataSet: IModelDAOCadastro;
begin
  if Assigned(FEventosDataSet.BeforePost) then
    FQuery.BeforePost := FEventosDataSet.BeforePost;

  if Assigned(FEventosDataSet.NewRecord) then
    FQuery.OnNewRecord := FEventosDataSet.NewRecord;

  if Assigned(FEventosDataSet.AfterDelete) then
    FQuery.AfterDelete := FEventosDataSet.AfterDelete;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarMascara(const pNomeCampo: string;
 const pMascara: string): IModelDAOCadastro;
begin
  TField(FQuery.FieldByName(pNomeCampo)).EditMask := pMascara;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarMascaraDisplay(const pNomeCampo,
  pMascara: string): IModelDAOCadastro;
begin
  TNumericField(FQuery.FieldByName(pNomeCampo)).DisplayFormat := pMascara;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarParametro(const pNomeParametro: string;
  const pValor: Variant): IModelDAOCadastro;
begin
  FQuery.Params.ParamByName(pNomeParametro).Value := pValor;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarSQL(const pSQL: string): IModelDAOCadastro;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(pSQL);

  Result := Self;
end;

constructor TModelDAOCadastro.Create(pDataSource: TDataSource);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DMConexao.GetConexao;
  pDataSource.DataSet := FQuery;
end;

class function TModelDAOCadastro.Criar(pDataSource: TDataSource): IModelDAOCadastro;
begin
  Result := Self.Create(pDataSource);
end;

destructor TModelDAOCadastro.Destroy;
begin
  if Assigned(FQuery) then
    FQuery.Free;

  inherited;
end;

function TModelDAOCadastro.EventosDataSet: IModelDAOEventosDataSet;
begin
  if not Assigned(FEventosDataSet) then
    FEventosDataSet := TModelDAOEventosDataSet.Criar;

  Result := FEventosDataSet;
end;

function TModelDAOCadastro.FecharDataSet: IModelDAOCadastro;
begin
  FQuery.Close;

  Result := Self;
end;

end.
