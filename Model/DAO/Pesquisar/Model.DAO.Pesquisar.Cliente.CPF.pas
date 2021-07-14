unit Model.DAO.Pesquisar.Cliente.CPF;

interface

uses
  Data.DB,
  Model.DAO.Pesquisar.Cliente.Interfaces,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOPesquisarClienteCPF = class(TInterfacedObject,
                                       IModelDAOPesquisarCliente)
  private
    FCPF: string;

    function Parametro(pValor: string): IModelDAOPesquisarCliente;
    function Pesquisar: TList<TDadosCliente>;
    function GerarDadosRelatorio: TDataSet;
  public
    class function Criar: IModelDAOPesquisarCliente;
  end;

implementation

uses
  Model.DAO.GetDados.Cliente;

{ TModelDAOPesquisarClienteCPF }

class function TModelDAOPesquisarClienteCPF.Criar: IModelDAOPesquisarCliente;
begin
  Result := Self.Create;
end;

function TModelDAOPesquisarClienteCPF.GerarDadosRelatorio: TDataSet;
begin
  Result := TModelDAOGetDadosCliente
              .Criar
              .GetDadosClienteCPFRelatorio(FCPF);
end;

function TModelDAOPesquisarClienteCPF.Parametro(
  pValor: string): IModelDAOPesquisarCliente;
begin
  FCPF := pValor;
  Result := Self;
end;

function TModelDAOPesquisarClienteCPF.Pesquisar: TList<TDadosCliente>;
begin
  Result := TModelDAOGetDadosCliente
              .Criar
              .GetDadosClienteCPF(FCPF);
end;

end.
