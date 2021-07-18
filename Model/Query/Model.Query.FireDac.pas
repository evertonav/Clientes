unit Model.Query.FireDac;

interface

uses
  FireDAC.Comp.Client,
  Data.DB,
  Model.Query.Interfaces,
  Model.Conexao.Interfaces;

type
  TModelQueryFireDac = class(TInterfacedObject, IModelQuery)
  private
    FConexao: IModelConexao;
    FQuery: TFDQuery;

    function AdicionarSQL(const pSql: string): IModelQuery;
    function GetQuery: TDataSet;
  public
    constructor Create(Conexao: IModelConexao);
    destructor Destroy; override;

    class function Criar(Conexao: IModelConexao): IModelQuery;
  end;

implementation

uses
  Model.Conexao.FireDac;

{ TModelQueryFireDac }

function TModelQueryFireDac.AdicionarSQL(const pSql: string): IModelQuery;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(pSql);

  Result := Self;
end;

constructor TModelQueryFireDac.Create(Conexao: IModelConexao);
begin
  if not Assigned(Conexao) then
    FConexao := TModelConexaoFireDac.Criar
  else
    FConexao := Conexao;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConexao.GetConexao);
end;

class function TModelQueryFireDac.Criar(Conexao: IModelConexao): IModelQuery;
begin
  Result := Self.Create(Conexao);
end;

destructor TModelQueryFireDac.Destroy;
begin
  if Assigned(FQuery) then
    FQuery.Free;

  inherited;
end;

function TModelQueryFireDac.GetQuery: TDataSet;
begin
  Result := FQuery;
end;

end.
