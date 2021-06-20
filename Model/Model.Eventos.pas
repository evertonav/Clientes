unit Model.Eventos;

interface

uses
  Model.Eventos.Preencher.Interfaces,
  Model.Eventos.Get.Interfaces,
  Data.DB;

type
  TModelEventos = class(TInterfacedObject,
                        IModelEventosPreencher,
                        IModelEventosGet)
  private
    FBeforePost: TDataSetNotifyEvent;
    FAfterDelete: TDataSetNotifyEvent;

    function BeforePost(pValor: TDataSetNotifyEvent): IModelEventosPreencher; overload;
    function BeforePost: TDataSetNotifyEvent; overload;
    function AfterDelete(pValor: TDataSetNotifyEvent): IModelEventosPreencher; overload;
    function AfterDelete: TDataSetNotifyEvent; overload;
  end;

implementation

{ TEventos }

function TModelEventos.AfterDelete(
  pValor: TDataSetNotifyEvent): IModelEventosPreencher;
begin
  FAfterDelete := pValor;

  Result := Self;
end;

function TModelEventos.AfterDelete: TDataSetNotifyEvent;
begin
  Result := FAfterDelete;
end;

function TModelEventos.BeforePost: TDataSetNotifyEvent;
begin
  FAfterDelete := FBeforePost;
end;

function TModelEventos.BeforePost(pValor: TDataSetNotifyEvent): IModelEventosPreencher;
begin
  FBeforePost := pValor;
end;

end.
