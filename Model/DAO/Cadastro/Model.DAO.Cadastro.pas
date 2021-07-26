unit Model.DAO.Cadastro;

interface

uses
  Model.DAO.Cadastro.Interfaces,
  Data.DB,
  Model.Query.Interfaces,
  Model.Query.Fabrica;

type
  TModelDAOCadastro = class(TInterfacedObject, IModelDAOCadastro)
  private
    FQuery: IModelQuery;
  protected
    function Query: IModelQuery;
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

constructor TModelDAOCadastro.Create(pDataSource: TDataSource);
begin
  FQuery := TModelQueryFabrica.Criar.Query;
  pDataSource.DataSet := FQuery.GetQuery;
end;

class function TModelDAOCadastro.Criar(pDataSource: TDataSource): IModelDAOCadastro;
begin
  Result := Self.Create(pDataSource);
end;

destructor TModelDAOCadastro.Destroy;
begin

  inherited;
end;

function TModelDAOCadastro.Query: IModelQuery;
begin
  Result := FQuery;
end;

end.
