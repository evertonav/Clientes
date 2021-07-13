unit Model.DAO.Cliente.Fabrica.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Cadastro.View.Interfaces;

type
  IModelDAOClienteFabrica = interface
    function DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
    function Clientes: IModelDAOCadastroClienteView;
  end;


implementation

end.
