unit Model.Eventos.Preencher.Interfaces;

interface

uses
  Data.DB;

type
  IModelEventosPreencher = interface
    ['{2BD06D34-3841-4B6A-95EA-F9708F473A02}']
    function BeforePost(pValor: TDataSetNotifyEvent): IModelEventosPreencher;
    function AfterDelete(pValor: TDataSetNotifyEvent): IModelEventosPreencher;
  end;

implementation

end.
