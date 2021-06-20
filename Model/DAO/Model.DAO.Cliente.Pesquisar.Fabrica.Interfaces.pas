unit Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces;

interface

uses
  Model.DAO.Cliente.Pesquisar.Interfaces;

type
  IModelDAOClientePesquisarFabrica = interface
    ['{48E02F1F-9857-4DAF-A5A5-DF056A1D3BC1}']
    function PesquisarClienteCPF: IModelDAOClientePesquisar;
    function PesquisarClienteNome: IModelDAOClientePesquisar;
  end;

implementation

end.
