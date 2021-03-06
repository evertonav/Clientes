unit Controller.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Cadastro.Fabrica.Interfaces,
  Model.DAO.Pesquisar.Cliente.Fabrica.Interfaces,
  Model.DAO.GerarRelatorio.Interfaces;

type
  IController = interface
    ['{900FA428-A316-4F9C-AE6D-67219B2E3C8A}']
    function ClientesFabrica: IModelDAOCadastroFabrica;
    function PesquisarClientesFabrica: IModelDAOPesquisarClienteFabrica;

    function GerarRelatorioClienteCPF: IModelDAOGerarRelatorio;
    function GerarRelatorioClienteNome: IModelDAOGerarRelatorio;
  end;

implementation

end.
