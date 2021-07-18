unit Model.Query.Fabrica;

interface

uses
  Model.Query.Interfaces,
  Model.Query.Fabrica.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Fabrica;

type
  TModelQueryFabrica = class(TInterfacedObject, IModelQueryFabrica)
  private
    FQuery: IModelQuery;

    function Query: IModelQuery;
  public
    class function Criar: IModelQueryFabrica;
  end;

implementation

uses
  Model.Query.FireDac;

{ TModelQueryFabrica }

class function TModelQueryFabrica.Criar: IModelQueryFabrica;
begin
  Result := Self.Create;
end;

function TModelQueryFabrica.Query: IModelQuery;
begin
  if not Assigned(FQuery) then
    FQuery := TModelQueryFireDac.Criar(TModelConexaoFabrica2.Conexao);

  Result := FQuery;
end;

end.
