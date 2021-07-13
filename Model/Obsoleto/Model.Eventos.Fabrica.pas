unit Model.Eventos.Fabrica;

interface

uses
  Model.Eventos.Get.Interfaces,
  Model.Eventos.Fabrica.Interfaces,
  Model.Eventos.Preencher.Interfaces,
  Model.Eventos;

type
  TModelEventosFabrica = class(TInterfacedObject, IModelEventosFabrica)
  private
    FEventos: TModelEventos;

    function PreencherEventos: IModelEventosPreencher;
    function GetEventos: IModelEventosGet;
  public
    class function Criar: IModelEventosFabrica;
  end;

implementation

{ TEventosFabrica }

class function TModelEventosFabrica.Criar: IModelEventosFabrica;
begin
  Result := Self.Create;
end;

function TModelEventosFabrica.GetEventos: IModelEventosGet;
begin
  if not Assigned(FEventos) then
    FEventos := TModelEventos.Create;

  Result := FEventos;
end;

function TModelEventosFabrica.PreencherEventos: IModelEventosPreencher;
begin
  if not Assigned(FEventos) then
    FEventos := TModelEventos.Create;

  Result := FEventos;
end;

end.
