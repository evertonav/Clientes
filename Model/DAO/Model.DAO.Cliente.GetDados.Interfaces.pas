unit Model.DAO.Cliente.GetDados.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados;

type
  IModelDAOClienteGetDados = interface
    ['{4F4125BC-C718-4447-8813-96EBF0C157B7}']
    function GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
    function GetDadosClienteCPFRelatorio(const pCPF: string): TDataSet;
    function GetDadosClienteNome(const pNome: string): TList<TDadosCliente>;
    function GetDadosClienteNomeRelatorio(const pNome: string): TDataSet;
  end;

implementation

end.
