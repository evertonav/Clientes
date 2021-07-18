unit Model.Conexao.Interfaces;

interface

uses
  Data.DB;

type
  IModelConexao = interface
    ['{87891718-76F9-4363-B655-8AF5B654CC28}']
    function GetConexao: TCustomConnection;
  end;

implementation

end.
