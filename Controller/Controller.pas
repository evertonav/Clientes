unit Controller;

interface


uses
  Model.DAO.Cliente.Fabrica.Interfaces,
  Controller.Interfaces,
  Model.DAO.Cliente.Pesquisar.Fabrica,
  Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FDAOClienteFabrica: IModelDAOClienteFabrica;
    FPesquisarCliente: IModelDAOClientePesquisarFabrica;

    function ClientesFabrica: IModelDAOClienteFabrica;
    function PesquisarClientesFabrica: IModelDAOClientePesquisarFabrica;
  public
    class function Criar: IController;
  end;

implementation

{ TController }

uses Model.DAO.Cliente.Fabrica;

function TController.ClientesFabrica: IModelDAOClienteFabrica;
begin
  if not Assigned(FDAOClienteFabrica) then
    FDAOClienteFabrica := TModelDAOClienteFabrica.Criar;

  Result := FDAOClienteFabrica;
end;

class function TController.Criar: IController;
begin
  Result := Self.Create;
end;

function TController.PesquisarClientesFabrica: IModelDAOClientePesquisarFabrica;
begin
  if not Assigned(FPesquisarCliente) then
    FPesquisarCliente := TModelDAOClientePesquisarFabrica.Criar;

  Result := FPesquisarCliente;
end;

end.
