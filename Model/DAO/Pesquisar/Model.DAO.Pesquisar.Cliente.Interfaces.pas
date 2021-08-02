unit Model.DAO.Pesquisar.Cliente.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados,
  Model.Query.Fabrica.Interfaces;

type
  IModelDAOPesquisarCliente = interface
    ['{C42F0698-7D26-4CE6-87FB-3D61F3B2BBCD}']
    function Parametro(pValor: string): IModelDAOPesquisarCliente;
    function Pesquisar: TList<TDadosCliente>;
  end;

implementation

end.
