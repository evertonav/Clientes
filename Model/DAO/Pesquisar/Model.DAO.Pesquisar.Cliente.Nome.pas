unit Model.DAO.Pesquisar.Cliente.Nome;

interface

uses
  Data.DB,
  Model.DAO.Pesquisar.Cliente.Interfaces,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOPesquisarClienteNome = class(TInterfacedObject,
                                        IModelDAOPesquisarCliente)
  private
    FNome: string;

    function Parametro(pValor: string): IModelDAOPesquisarCliente;
    function Pesquisar: TList<TDadosCliente>;
    function GerarDadosRelatorio: TDataSet;
  public
    class function Criar: IModelDAOPesquisarCliente;
  end;

implementation

uses
  Model.DAO.Cliente.GetDados.FireDAC;

{ TModelDAOPesquisarClienteNome }

class function TModelDAOPesquisarClienteNome.Criar: IModelDAOPesquisarCliente;
begin
  Result := Self.Create;
end;

function TModelDAOPesquisarClienteNome.GerarDadosRelatorio: TDataSet;
begin
  Result := TModelDAOClienteGetDados
              .Criar
              .GetDadosClienteNomeRelatorio(FNome);
end;

function TModelDAOPesquisarClienteNome.Parametro(
  pValor: string): IModelDAOPesquisarCliente;
begin
  FNome := pValor;
  Result := Self;
end;

function TModelDAOPesquisarClienteNome.Pesquisar: TList<TDadosCliente>;
begin
  Result := TModelDAOClienteGetDados
              .Criar
              .GetDadosClienteNome(FNome);
end;

end.