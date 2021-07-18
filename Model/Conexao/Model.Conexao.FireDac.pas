unit Model.Conexao.FireDac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Data.DB,
  Model.Conexao.Interfaces;

type
  TModelConexaoFireDac = class(TInterfacedObject, IModelConexao)
  private
    FConexao: TFDConnection;

    function GetConexao: TCustomConnection;
  public
    destructor Destroy; override;

    class function Criar: IModelConexao;
  end;

var
  ModelConexaoFireDac: IModelConexao;

implementation

uses
  Model.Conexao.Conectar.Fabrica;

{ TModelConexaoFireDac }

class function TModelConexaoFireDac.Criar: IModelConexao;
begin
  Result := Self.Create;
end;

destructor TModelConexaoFireDac.Destroy;
begin
  if Assigned(FConexao) then
    FConexao.Free;

  inherited;
end;

function TModelConexaoFireDac.GetConexao: TCustomConnection;
begin
  if not Assigned(FConexao) then
  begin
    TModelConexaoConectarFabrica.Conexao.Conectar(FConexao);
    Result := FConexao;
  end
  else
    Result := FConexao;
end;

end.
