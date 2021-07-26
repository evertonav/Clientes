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
  Model.DAO.Eventos.DataSet.Interfaces,
  Model.DAO.Eventos.DataSet,
  Model.Query.Interfaces;

type
  TModelDAOCadastro = class(TInterfacedObject, IModelDAOCadastro)
  private
    FQuery: TDataSet;
    FModelQuery: IModelQuery;
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
  System.SysUtils,
  Model.Conexao.Fabrica,
  Model.Query.Fabrica;

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
  //FQuery := FModelQuery.AdicionarParametro(FQuery, pNomeParametro, pValor).GetQuery;

  Result := Self;
end;

function TModelDAOCadastro.AdicionarSQL(const pSQL: string): IModelDAOCadastro;
begin
  FQuery := FModelQuery.AdicionarSQL(pSQL).GetQuery;

  Result := Self;
end;

constructor TModelDAOCadastro.Create(pDataSource: TDataSource);
begin
  FModelQuery := TModelQueryFabrica.Criar.Query;
  FQuery := FModelQuery.GetQuery;
  pDataSource.DataSet := FQuery;
end;

class function TModelDAOCadastro.Criar(pDataSource: TDataSource): IModelDAOCadastro;
begin
  Result := Self.Create(pDataSource);
end;

destructor TModelDAOCadastro.Destroy;
begin

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
