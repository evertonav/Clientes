unit Model.DAO.Eventos.DataSet;

interface

uses
  Model.DAO.Eventos.DataSet.Interfaces,
  Data.DB;

type
  TModelDAOEventosDataSet = class(TInterfacedObject,
                                  IModelDAOEventosDataSet)
  private
    FBeforePost: TDataSetNotifyEvent;
    FAfterDelete: TDataSetNotifyEvent;
    FNewRecord: TDataSetNotifyEvent;

    function BeforePost(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function BeforePost: TDataSetNotifyEvent; overload;
    function AfterDelete(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function AfterDelete: TDataSetNotifyEvent; overload;
    function NewRecord(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet; overload;
    function NewRecord: TDataSetNotifyEvent; overload;
  public
    class function Criar: IModelDAOEventosDataSet;

    destructor Destroy; override;
  end;

implementation

{ TEventos }

function TModelDAOEventosDataSet.AfterDelete(
  pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet;
begin
  FAfterDelete := pValor;

  Result := Self;
end;

function TModelDAOEventosDataSet.AfterDelete: TDataSetNotifyEvent;
begin
  Result := FAfterDelete;
end;

function TModelDAOEventosDataSet.BeforePost: TDataSetNotifyEvent;
begin
  Result := FBeforePost;
end;

class function TModelDAOEventosDataSet.Criar: IModelDAOEventosDataSet;
begin
  Result := Self.Create;
end;

destructor TModelDAOEventosDataSet.Destroy;
begin

  inherited;
end;

function TModelDAOEventosDataSet.NewRecord: TDataSetNotifyEvent;
begin
  Result := FNewRecord;
end;

function TModelDAOEventosDataSet.NewRecord(
  pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet;
begin
  FNewRecord := pValor;

  Result := Self;
end;

function TModelDAOEventosDataSet.BeforePost(pValor: TDataSetNotifyEvent): IModelDAOEventosDataSet;
begin
  FBeforePost := pValor;

  Result := Self;
end;

end.
