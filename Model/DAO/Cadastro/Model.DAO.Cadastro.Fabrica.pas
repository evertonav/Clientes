unit Model.DAO.Cadastro.Fabrica;

interface

uses
  Data.DB,
  Model.DAO.Cadastro.View.Interfaces,
  Model.DAO.Cadastro.Fabrica.Interfaces;

type
  TModelDAOCadastroFabrica = class(TInterfacedObject, IModelDAOCadastroFabrica)
  private
    FCadastroCliente: IModelDAOCadastroClienteView;
    FDataSource: TDataSource;

    function DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
    function Clientes: IModelDAOCadastroClienteView;
  public
    class function Criar: IModelDAOCadastroFabrica;
  end;

implementation

{ TModelDAOCadastroFabrica }

uses
  System.SysUtils,
  Model.DAO.Cadastro.Cliente;

function TModelDAOCadastroFabrica.Clientes: IModelDAOCadastroClienteView;
begin
  if not Assigned(FCadastroCliente) then
    raise Exception.Create('Você deve preencher primeiro o data source!');

  Result := FCadastroCliente;
end;

class function TModelDAOCadastroFabrica.Criar: IModelDAOCadastroFabrica;
begin
  Result := Self.Create;
end;

function TModelDAOCadastroFabrica.DataSource(pValor: TDataSource): IModelDAOCadastroClienteView;
begin
  FDataSource := pValor;

  if not Assigned(FCadastroCliente) then
    FCadastroCliente := TModelDAOCadastroCliente.Create(pValor);

  Result := FCadastroCliente;
end;

end.
