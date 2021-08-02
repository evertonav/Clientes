unit Model.DAO.GerarRelatorio.Interfaces;

interface

uses
  Model.Query.Fabrica.Interfaces;

type
  IModelDAOGerarRelatorio = interface
    ['{E3A74652-FCCB-4F14-8EC1-9F6F58537C5F}']
    function Parametro(const pValor: string): IModelDAOGerarRelatorio;
    function Gerar: IModelQueryFabrica;
  end;

implementation

end.
