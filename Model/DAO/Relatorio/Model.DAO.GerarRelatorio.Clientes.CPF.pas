unit Model.DAO.GerarRelatorio.Clientes.CPF;

interface

uses
  Model.DAO.GerarRelatorio.Interfaces,
  Model.Query.Fabrica.Interfaces;

type
  TModelDAOGerarRelatorioClientesCPF = class(TInterfacedObject,
                                             IModelDAOGerarRelatorio)
  private
    FCPF: string;

    function Parametro(const pValor: string): IModelDAOGerarRelatorio; virtual;
    function Gerar: IModelQueryFabrica; virtual;
  public
    class function Criar: IModelDAOGerarRelatorio;
  end;

implementation

uses
  Model.DAO.GetDados.Cliente;


{ TModelDAOGerarRelatorioClientesCPF }

class function TModelDAOGerarRelatorioClientesCPF.Criar: IModelDAOGerarRelatorio;
begin
  Result := Self.Create;
end;

function TModelDAOGerarRelatorioClientesCPF.Gerar: IModelQueryFabrica;
begin
  Result := TModelDAOGetDadosCliente
              .Criar
              .GetDadosClienteCPFRelatorio(FCPF);
end;

function TModelDAOGerarRelatorioClientesCPF.Parametro(
  const pValor: string): IModelDAOGerarRelatorio;
begin
  FCPF := pValor;

  Result := Self;
end;

end.
