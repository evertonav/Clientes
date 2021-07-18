unit Model.DAO.GetDados.Cliente.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados,
  Model.Query.Fabrica.Interfaces;

type
  IModelDAOGetDadosCliente = interface
    ['{4F4125BC-C718-4447-8813-96EBF0C157B7}']
    function GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
    function GetDadosClienteCPFRelatorio(const pCPF: string): IModelQueryFabrica;
    function GetDadosClienteNome(const pNome: string): TList<TDadosCliente>;
    function GetDadosClienteNomeRelatorio(const pNome: string): IModelQueryFabrica;
  end;

implementation

end.
