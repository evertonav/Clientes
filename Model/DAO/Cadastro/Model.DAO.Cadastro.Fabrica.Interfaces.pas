unit Model.DAO.Cadastro.Fabrica.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Cadastro.View.Interfaces;

type
  IModelDAOCadastroFabrica = interface
    function DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
    function Clientes: IModelDAOCadastroClienteView;
  end;


implementation

end.
