unit Model.Conexao.Fabrica;

interface

uses
  Model.Conexao.FireDac,
  Model.Conexao.Interfaces,
  FireDAC.Comp.Client;

type
  TModelConexaoFabrica = class
  public
    class function ConexaoFireDac: TFDConnection;
  end;

implementation

{ TModelConexaoFabrica }

class function TModelConexaoFabrica.ConexaoFireDac: TFDConnection;
begin
  if not Assigned(ModelConexaoFireDac) then
    ModelConexaoFireDac := TModelConexaoFireDac.Criar;

  Result := TFDConnection(ModelConexaoFireDac.GetConexao);
end;

end.
