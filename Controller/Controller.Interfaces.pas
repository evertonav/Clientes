unit Controller.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Cliente.Fabrica.Interfaces,
  Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces;

type
  IController = interface
    ['{900FA428-A316-4F9C-AE6D-67219B2E3C8A}']
    function ClientesFabrica: IModelDAOClienteFabrica;
    function PesquisarClientesFabrica: IModelDAOClientePesquisarFabrica;
  end;

implementation

end.
