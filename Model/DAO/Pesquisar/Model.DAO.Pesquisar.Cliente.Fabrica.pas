unit Model.DAO.Pesquisar.Cliente.Fabrica;

interface

uses
  Model.DAO.Pesquisar.Cliente.Fabrica.Interfaces,
  Model.DAO.Pesquisar.Cliente.Interfaces,
  Model.DAO.Pesquisar.Cliente.CPF,
  Model.DAO.Pesquisar.Cliente.Nome;

type
  TModelDAOPesquisarClienteFabrica = class(TInterfacedObject,
                                           IModelDAOPesquisarClienteFabrica)
  private
    FPesquisarClienteCPF: IModelDAOPesquisarCliente;
    FPesquisarClienteNome: IModelDAOPesquisarCliente;

    function PesquisarClienteCPF: IModelDAOPesquisarCliente;
    function PesquisarClienteNome: IModelDAOPesquisarCliente;
  public
    class function Criar: IModelDAOPesquisarClienteFabrica;
  end;

implementation

{ TModelDAOPesquisarClienteFabrica }

class function TModelDAOPesquisarClienteFabrica.Criar: IModelDAOPesquisarClienteFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOPesquisarClienteFabrica.PesquisarClienteCPF: IModelDAOPesquisarCliente;
begin
  if not Assigned(FPesquisarClienteCPF) then
    FPesquisarClienteCPF := TModelDAOPesquisarClienteCPF.Criar;

  Result := FPesquisarClienteCPF;
end;

function TModelDAOPesquisarClienteFabrica.PesquisarClienteNome: IModelDAOPesquisarCliente;
begin
  if not Assigned(FPesquisarClienteNome) then
    FPesquisarClienteNome := TModelDAOPesquisarClienteNome.Criar;

  Result := FPesquisarClienteNome;
end;

end.
