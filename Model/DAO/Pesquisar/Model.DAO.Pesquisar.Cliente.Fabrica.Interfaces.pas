unit Model.DAO.Pesquisar.Cliente.Fabrica.Interfaces;

interface

uses
  Model.DAO.Pesquisar.Cliente.Interfaces;

type
  IModelDAOPesquisarClienteFabrica = interface
    ['{48E02F1F-9857-4DAF-A5A5-DF056A1D3BC1}']
    function PesquisarClienteCPF: IModelDAOPesquisarCliente;
    function PesquisarClienteNome: IModelDAOPesquisarCliente;
  end;

implementation

end.
