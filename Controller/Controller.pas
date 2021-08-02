unit Controller;

interface


uses
  Model.DAO.Cadastro.Fabrica.Interfaces,
  Controller.Interfaces,
  Model.DAO.Pesquisar.Cliente.Fabrica,
  Model.DAO.Pesquisar.Cliente.Fabrica.Interfaces,
  Model.DAO.GerarRelatorio.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FDAOClienteFabrica: IModelDAOCadastroFabrica;
    FPesquisarCliente: IModelDAOPesquisarClienteFabrica;
    FGerarRelatorioCPF: IModelDAOGerarRelatorio;
    FGerarRelatorioNome: IModelDAOGerarRelatorio;

    function ClientesFabrica: IModelDAOCadastroFabrica;
    function PesquisarClientesFabrica: IModelDAOPesquisarClienteFabrica;
    function GerarRelatorioClienteCPF: IModelDAOGerarRelatorio;
    function GerarRelatorioClienteNome: IModelDAOGerarRelatorio;
  public
    class function Criar: IController;
  end;

implementation

{ TController }

uses
  Model.DAO.Cadastro.Fabrica,
  Model.DAO.GerarRelatorio.Clientes.CPF,
  Model.DAO.GerarRelatorio.Clientes.Nome;

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

function TController.GerarRelatorioClienteCPF: IModelDAOGerarRelatorio;
begin
  if not Assigned(FGerarRelatorioCPF) then
    FGerarRelatorioCPF := TModelDAOGerarRelatorioClientesCPF.Criar;

  Result := FGerarRelatorioCPF;
end;

function TController.GerarRelatorioClienteNome: IModelDAOGerarRelatorio;
begin
  if not Assigned(FGerarRelatorioNome) then
    FGerarRelatorioNome := TModelDAOGerarRelatorioClientesNome.Criar;

  Result := FGerarRelatorioNome;
end;

function TController.PesquisarClientesFabrica: IModelDAOPesquisarClienteFabrica;
begin
  if not Assigned(FPesquisarCliente) then
    FPesquisarCliente := TModelDAOPesquisarClienteFabrica.Criar;

  Result := FPesquisarCliente;
end;

end.
