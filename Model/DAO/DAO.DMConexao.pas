unit DAO.DMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG;

type
  TDMConexao = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FConexao: TFDConnection;
  public
    { Public declarations }
    function GetConexao: TFDConnection;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Model.Conexao.Conectar.Fabrica;

{$R *.dfm}

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  FConexao := TFDConnection.Create(nil);

  TModelConexaoConectarFabrica.Conexao.Conectar(FConexao);
end;

procedure TDMConexao.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FConexao) then
    FConexao.Free;
end;

function TDMConexao.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.
