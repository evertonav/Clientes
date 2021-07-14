unit Controller;

interface


uses
  Model.DAO.Cadastro.Fabrica.Interfaces,
  Controller.Interfaces,
  Model.DAO.Pesquisar.Cliente.Fabrica,
  Model.DAO.Pesquisar.Cliente.Fabrica.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FDAOClienteFabrica: IModelDAOCadastroFabrica;
    FPesquisarCliente: IModelDAOPesquisarClienteFabrica;

    function ClientesFabrica: IModelDAOCadastroFabrica;
    function PesquisarClientesFabrica: IModelDAOPesquisarClienteFabrica;
  public
    class function Criar: IController;
  end;

implementation

{ TController }

uses
  Model.DAO.Cadastro.Fabrica;

function TController.ClientesFabrica: IModelDAOCadastroFabrica;
begin
  if not Assigned(FDAOClienteFabrica) then
    FDAOClienteFabrica := TModelDAOCadastroFabrica.Criar;

  Result := FDAOClienteFabrica;
end;

class function TController.Criar: IController;
begin
  Result := Self.Create;
end;

function TController.PesquisarClientesFabrica: IModelDAOPesquisarClienteFabrica;
begin
  if not Assigned(FPesquisarCliente) then
    FPesquisarCliente := TModelDAOPesquisarClienteFabrica.Criar;

  Result := FPesquisarCliente;
end;

end.
