unit Model.Eventos.Fabrica.Interfaces;

interface

uses Model.Eventos.Get.Interfaces, Model.Eventos.Preencher.Interfaces;

type
 { IModelEventosFabrica = interface
    ['{CE45FDDE-B61A-44A2-AA13-7C64AB621441']
    function PreencherEventos: IModelEventosPreencher;
    function GetEventos: IModelEventosGet;
  end; `}

implementation

end.
