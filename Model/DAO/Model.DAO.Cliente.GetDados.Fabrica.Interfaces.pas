unit Model.DAO.Cliente.GetDados.Fabrica.Interfaces;

interface

uses
  Model.DAO.Cliente.GetDados.Interfaces,
  Model.DAO.Cliente.GetDados.FireDAC;

type
  IModelDAOClienteGetDadosFabrica = interface
    ['{A056C1D4-56CF-4527-BE11-B81053BA77EB}']
    function DadosCliente: IModelDAOClienteGetDados;
  end;

implementation

end.
