unit Model.Conexao.Conectar.Fabrica;

interface

uses
  FireDAC.Comp.Client,
  Model.Conexao.Conectar.FireDAC.Firebird,
  Model.Conexao.Conectar.Interfaces;

type
  TModelConexaoConectarFabrica = class
  private

  public
    class function Conexao: IModelConexaoConectar<TFDConnection>;
  end;

implementation

{ TModelConexaoConectarFabrica }

class function TModelConexaoConectarFabrica.Conexao: IModelConexaoConectar<TFDConnection>;
begin
  Result := TModelConexaoFiredacConectarFireBird.Criar;
end;

end.
