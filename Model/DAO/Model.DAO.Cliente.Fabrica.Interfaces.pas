unit Model.DAO.Cliente.Fabrica.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Cliente.Interfaces;

type
  IModelDAOClienteFabrica = interface
    function DataSource(pValor: TDataSource): IModelDAOCliente;
    function Clientes: IModelDAOCliente;
  end;


implementation

end.
