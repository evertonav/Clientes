unit Model.Query.Interfaces;

interface

uses
  Data.DB,
  Model.DAO.Eventos.DataSet.Interfaces;

type
  IModelQuery = interface
    ['{A1667309-C453-49D5-B8E7-C98F334BE3D5}']
    function FecharDataSet: IModelQuery;

    function AdicionarSQL(const pSQL: string): IModelQuery;

    function AdicionarParametro(const pNomeParametro: string;
                                const pValor: Variant): IModelQuery;

    function AbrirDataSet: IModelQuery;

    function GetQuery: TDataSet;

    function EventosDataSet: IModelDAOEventosDataSet;
    function AdicionarEventosDataSet: IModelQuery;

    function AdicionarMascara(const pNomeCampo: string;
                              const pMascara: string): IModelQuery;

    function AdicionarMascaraDisplay(const pNomeCampo: string;
                                     const pMascara: string): IModelQuery;
  end;

implementation

end.
