unit Model.DAO.Cliente.Interfaces;

interface

uses
  Model.Eventos.Preencher.Interfaces;

type
  IModelDAOCliente = interface
    ['{1CD8A5C6-48C5-45CB-A4C6-627953A4C53D}']
    function Codigo(pValor: Integer): IModelDAOCliente;
    function Eventos: IModelEventosPreencher;
    function Fechar: IModelDAOCliente;
    function Abrir: IModelDAOCliente;
  end;

implementation

end.
