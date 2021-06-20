unit Model.Eventos.Get.Interfaces;

interface

uses
  Data.DB;

type
  IModelEventosGet = interface
    ['{6DE62AA9-6439-42AB-AFF9-B73DEE62D017}']
    function BeforePost: TDataSetNotifyEvent;
    function AfterDelete: TDataSetNotifyEvent;
  end;

implementation

end.
