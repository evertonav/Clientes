unit Model.DAO.Cliente.GetDados.Fabrica;

interface

uses
  Model.DAO.Cliente.GetDados.Interfaces,
  Model.DAO.Cliente.GetDados.FireDAC,
  Model.DAO.Cliente.GetDados.Fabrica.Interfaces;


type
  TModelDAOClienteGetDadosFabrica = class(TInterfacedObject,
                                          IModelDAOClienteGetDadosFabrica)
  public
    function DadosCliente: IModelDAOClienteGetDados;

    class function Criar: IModelDAOClienteGetDadosFabrica;
  end;

implementation

{ TModelDAOClienteGetDadosFabrica }

class function TModelDAOClienteGetDadosFabrica.Criar: IModelDAOClienteGetDadosFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOClienteGetDadosFabrica.DadosCliente: IModelDAOClienteGetDados;
begin
  Result := TModelDAOClienteGetDados.Criar;
end;

end.
