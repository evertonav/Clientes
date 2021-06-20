unit Model.DAO.Cliente.Pesquisar.Fabrica;

interface

uses
  Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces,
  Model.DAO.Cliente.Pesquisar.Interfaces,
  Model.DAO.Cliente.Pesquisar.CPF,
  Model.DAO.Cliente.Pesquisar.Nome;

type
  TModelDAOClientePesquisarFabrica= class(TInterfacedObject,
                                          IModelDAOClientePesquisarFabrica)
  private
    FPesquisarClienteCPF: IModelDAOClientePesquisar;
    FPesquisarClienteNome: IModelDAOClientePesquisar;

    function PesquisarClienteCPF: IModelDAOClientePesquisar;
    function PesquisarClienteNome: IModelDAOClientePesquisar;
  public
    class function Criar: IModelDAOClientePesquisarFabrica;
  end;

implementation

{ TModelDAOClientePesquisarFabrica }

class function TModelDAOClientePesquisarFabrica.Criar: IModelDAOClientePesquisarFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOClientePesquisarFabrica.PesquisarClienteCPF: IModelDAOClientePesquisar;
begin
  if not Assigned(FPesquisarClienteCPF) then
    FPesquisarClienteCPF := TModelDAOClientePesquisarCPF.Criar;

  Result := FPesquisarClienteCPF;
end;

function TModelDAOClientePesquisarFabrica.PesquisarClienteNome: IModelDAOClientePesquisar;
begin
  if not Assigned(FPesquisarClienteNome) then
    FPesquisarClienteNome := TModelDAOClientePesquisarNome.Criar;

  Result := FPesquisarClienteNome;
end;

end.
