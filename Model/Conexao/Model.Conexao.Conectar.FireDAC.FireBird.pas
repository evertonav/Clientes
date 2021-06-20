unit Model.Conexao.Conectar.FireDAC.FireBird;

interface

uses
  Model.Conexao.Conectar.Interfaces,
  FireDAC.Comp.Client;

type
  TModelConexaoFiredacConectarFireBird = class(TInterfacedObject,
                                               IModelConexaoConectar<TFDConnection>)
  private
    function Conectar(var pConexao: TFDConnection): IModelConexaoConectar<TFDConnection>;
  public
    class function Criar: IModelConexaoConectar<TFDConnection>;
  end;

implementation

uses
  System.SysUtils,
  Model.Conexao.DadosBanco;

{ TModelConexaoFiredacConectarFireBird }

function TModelConexaoFiredacConectarFireBird.Conectar(var pConexao: TFDConnection): IModelConexaoConectar<TFDConnection>;
begin
  if not Assigned(pConexao) then
    pConexao := TFDConnection.Create(nil);

  pConexao.Connected := False;
  try
    pConexao.Params.Values['DriverID'] := 'FB';
    pConexao.Params.Values['Database'] := TModelConexaoDadosBanco.Criar.CaminhoCompleto;
    pConexao.Params.Values['USER_NAME'] := 'SYSDBA';
    pConexao.Params.Values['Password'] := 'masterkey';
    pConexao.LoginPrompt := False;
    pConexao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
  end;

end;

class function TModelConexaoFiredacConectarFireBird.Criar: IModelConexaoConectar<TFDConnection>;
begin
  Result := Self.Create;
end;

end.
