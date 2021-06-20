unit Model.DAO.Cliente.Fabrica;

interface

uses
  Data.DB,
  Model.DAO.Cliente.Interfaces,
  Model.DAO.Cliente.Fabrica.Interfaces;

type
  TModelDAOClienteFabrica = class(TInterfacedObject, IModelDAOClienteFabrica)
  private
    FDAOCliente: IModelDAOCliente;
    FDataSource: TDataSource;

    function DataSource(pValor: TDataSource): IModelDAOCliente;
    function Clientes: IModelDAOCliente;
  public
    class function Criar: IModelDAOClienteFabrica;
  end;

implementation

{ TModelDAOClienteFabrica }

uses Model.DAO.Cliente.FireDAC, System.SysUtils;

function TModelDAOClienteFabrica.Clientes: IModelDAOCliente;
begin
  if not Assigned(FDAOCliente) then
    raise Exception.Create('Você deve preencher primeiro o data source!');

  Result := FDAOCliente;
end;

class function TModelDAOClienteFabrica.Criar: IModelDAOClienteFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOClienteFabrica.DataSource(pValor: TDataSource): IModelDAOCliente;
begin
  FDataSource := pValor;

  if not Assigned(FDAOCliente) then
    FDAOCliente := TModelDAOClienteFireDac.Create(FDataSource);

  Result := FDAOCliente;
end;

end.
