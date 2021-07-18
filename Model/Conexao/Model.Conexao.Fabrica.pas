unit Model.Conexao.Fabrica;

interface

uses
  Model.Conexao.FireDac,
  Model.Conexao.Interfaces,
  FireDAC.Comp.Client;

type
  TModelConexaoFabrica = class
  public
    class function Conexao: TFDConnection; overload;
  end;

  TModelConexaoFabrica2 = class
    class function Conexao: IModelConexao;
  end;

implementation

{ TModelConexaoFabrica }

class function TModelConexaoFabrica.Conexao: TFDConnection;
begin
  if not Assigned(ModelConexaoFireDac) then
    ModelConexaoFireDac := TModelConexaoFireDac.Criar;

  Result := TFDConnection(ModelConexaoFireDac.GetConexao);
end;

{ TModelConexaoFabrica2 }

class function TModelConexaoFabrica2.Conexao: IModelConexao;
begin
  if not Assigned(ModelConexaoFireDac) then
    ModelConexaoFireDac := TModelConexaoFireDac.Criar;

  Result := ModelConexaoFireDac;
end;

end.
