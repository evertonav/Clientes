unit Model.DAO.Cliente.Pesquisar.CPF;

interface

uses
  Data.DB,
  Model.DAO.Cliente.Pesquisar.Interfaces,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOClientePesquisarCPF = class(TInterfacedObject,
                                       IModelDAOClientePesquisar)
  private
    FCPF: string;

    function Parametro(pValor: string): IModelDAOClientePesquisar;
    function Pesquisar: TList<TDadosCliente>;
    function GerarDadosRelatorio: TDataSet;
  public
    class function Criar: IModelDAOClientePesquisar;
  end;

implementation

uses
  Model.DAO.Cliente.GetDados.Fabrica;

{ TModelDAOClientePesquisarCPF }

class function TModelDAOClientePesquisarCPF.Criar: IModelDAOClientePesquisar;
begin
  Result := Self.Create;
end;

function TModelDAOClientePesquisarCPF.GerarDadosRelatorio: TDataSet;
begin
  Result := TModelDAOClienteGetDadosFabrica
              .Criar
              .DadosCliente
              .GetDadosClienteCPFRelatorio(FCPF);
end;

function TModelDAOClientePesquisarCPF.Parametro(
  pValor: string): IModelDAOClientePesquisar;
begin
  FCPF := pValor;
  Result := Self;
end;

function TModelDAOClientePesquisarCPF.Pesquisar: TList<TDadosCliente>;
begin
  Result := TModelDAOClienteGetDadosFabrica
              .Criar
              .DadosCliente
              .GetDadosClienteCPF(FCPF);
end;

end.
