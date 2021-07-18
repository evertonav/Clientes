unit Model.Query.Fabrica.Interfaces;

interface

uses
  Model.Query.Interfaces,
  Model.Conexao.Interfaces;
type
  IModelQueryFabrica = interface
    ['{D698A379-9099-49E5-9CFC-A75551DC508F}']
    function Query: IModelQuery;
  end;

implementation

end.
