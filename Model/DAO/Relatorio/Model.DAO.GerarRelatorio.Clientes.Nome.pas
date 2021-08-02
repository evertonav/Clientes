unit Model.DAO.GerarRelatorio.Clientes.Nome;

interface

uses
  Model.DAO.GerarRelatorio.Interfaces,
  Model.Query.Fabrica.Interfaces;

type
  TModelDAOGerarRelatorioClientesNome = class(TInterfacedObject,
                                              IModelDAOGerarRelatorio)
  private
    FNome: string;

    function Parametro(const pValor: string): IModelDAOGerarRelatorio; virtual;
    function Gerar: IModelQueryFabrica; virtual;
  public
    class function Criar: IModelDAOGerarRelatorio;
  end;

implementation

uses
  Model.DAO.GetDados.Cliente;


{ TModelDAOGerarRelatorioClientesNome }

class function TModelDAOGerarRelatorioClientesNome.Criar: IModelDAOGerarRelatorio;
begin
  Result := Self.Create;
end;

function TModelDAOGerarRelatorioClientesNome.Gerar: IModelQueryFabrica;
begin
  Result := TModelDAOGetDadosCliente
              .Criar
              .GetDadosClienteNomeRelatorio(FNome);
end;

function TModelDAOGerarRelatorioClientesNome.Parametro(
  const pValor: string): IModelDAOGerarRelatorio;
begin
  FNome := pValor;

  Result := Self;
end;

end.
