unit Model.DAO.Eventos.DataSet.Interfaces;

interface

uses
  Data.DB;

type
  IModelDAOEventosDataSet = interface
    ['{D7F15A75-EA9F-4096-AA83-EC3A194D5FED}']
    function BeforePost(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function BeforePost: TDataSetNotifyEvent; overload;
    function AfterDelete(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function AfterDelete: TDataSetNotifyEvent; overload;
    function NewRecord(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function NewRecord: TDataSetNotifyEvent; overload;
  end;

implementation

end.
