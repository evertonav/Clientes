unit Model.Conexao.Conectar.Interfaces;

interface

type
  IModelConexaoConectar<T> = interface
    ['{28922178-2584-46EB-9B3D-EA72E1C540E0}']
    function Conectar(var pConexao: T): IModelConexaoConectar<T>;
  end;

implementation

end.
