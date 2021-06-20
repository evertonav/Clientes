unit Model.DAO.Cliente.Pesquisar.Nome;

interface

uses
  Data.DB,
  Model.DAO.Cliente.Pesquisar.Interfaces,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOClientePesquisarNome = class(TInterfacedObject,
                                        IModelDAOClientePesquisar)
  private
    FNome: string;

    function Parametro(pValor: string): IModelDAOClientePesquisar;
    function Pesquisar: TList<TDadosCliente>;
    function GerarDadosRelatorio: TDataSet;
  public
    class function Criar: IModelDAOClientePesquisar;
  end;

implementation

uses
  Model.DAO.Cliente.GetDados.Fabrica;

{ TModelDAOClientePesquisarNome }

class function TModelDAOClientePesquisarNome.Criar: IModelDAOClientePesquisar;
begin
  Result := Self.Create;
end;

function TModelDAOClientePesquisarNome.GerarDadosRelatorio: TDataSet;
begin
  Result := TModelDAOClienteGetDadosFabrica
              .Criar
              .DadosCliente
              .GetDadosClienteNomeRelatorio(FNome);
end;

function TModelDAOClientePesquisarNome.Parametro(
  pValor: string): IModelDAOClientePesquisar;
begin
  FNome := pValor;
  Result := Self;
end;

function TModelDAOClientePesquisarNome.Pesquisar: TList<TDadosCliente>;
begin
  Result := TModelDAOClienteGetDadosFabrica
              .Criar
              .DadosCliente
              .GetDadosClienteNome(FNome);
end;

end.
