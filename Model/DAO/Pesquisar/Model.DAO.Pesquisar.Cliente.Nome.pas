unit Model.DAO.Pesquisar.Cliente.Nome;

interface

uses
  Data.DB,
  Model.DAO.Pesquisar.Cliente.Interfaces,
  System.Generics.Collections,
  Controller.TiposDados,
  Model.Query.Fabrica.Interfaces;

type
  TModelDAOPesquisarClienteNome = class(TInterfacedObject,
                                        IModelDAOPesquisarCliente)
  private
    FNome: string;

    function Parametro(pValor: string): IModelDAOPesquisarCliente;
    function Pesquisar: TList<TDadosCliente>;
  public
    class function Criar: IModelDAOPesquisarCliente;
  end;

implementation

uses
  Model.DAO.GetDados.Cliente;

{ TModelDAOPesquisarClienteNome }

class function TModelDAOPesquisarClienteNome.Criar: IModelDAOPesquisarCliente;
begin
  Result := Self.Create;
end;

function TModelDAOPesquisarClienteNome.Parametro(
  pValor: string): IModelDAOPesquisarCliente;
begin
  FNome := pValor;
  Result := Self;
end;

function TModelDAOPesquisarClienteNome.Pesquisar: TList<TDadosCliente>;
begin
  Result := TModelDAOGetDadosCliente
              .Criar
              .GetDadosClienteNome(FNome);
end;

end.
