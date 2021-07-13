unit Model.DAO.Cliente.Fabrica;

interface

uses
  Data.DB,
  Model.DAO.Cadastro.View.Interfaces,
  Model.DAO.Cliente.Fabrica.Interfaces;

type
  TModelDAOClienteFabrica = class(TInterfacedObject, IModelDAOClienteFabrica)
  private
    FCadastroCliente: IModelDAOCadastroClienteView;
    FDataSource: TDataSource;

    function DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
    function Clientes: IModelDAOCadastroClienteView;
  public
    class function Criar: IModelDAOClienteFabrica;
  end;

implementation

{ TModelDAOClienteFabrica }

uses
  System.SysUtils,
  Model.DAO.Cadastro.Cliente;

function TModelDAOClienteFabrica.Clientes: IModelDAOCadastroClienteView;
begin
  if not Assigned(FCadastroCliente) then
    raise Exception.Create('Você deve preencher primeiro o data source!');

  Result := FCadastroCliente;
end;

class function TModelDAOClienteFabrica.Criar: IModelDAOClienteFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOClienteFabrica.DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
begin
  FDataSource := pValor;

  if not Assigned(FCadastroCliente) then
    FCadastroCliente := TModelDAOCadastroCliente.Create(pValor);

  Result := FCadastroCliente;
end;

end.
