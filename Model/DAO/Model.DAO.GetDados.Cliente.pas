unit Model.DAO.GetDados.Cliente;

interface

uses
  FireDAC.Comp.Client,
  Model.DAO.GetDados.Cliente.Interfaces,
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados,
  Model.Query.Fabrica.Interfaces;

type
  TModelDAOGetDadosCliente = class(TInterfacedObject, IModelDAOGetDadosCliente)
  private
    function GetSQLDadosClienteCPF(const pCPF: string): string;
    function GetSQLDadosClienteNome(const pNome: string): string;

    function ExecutarSQL(const pSQL: string): TList<TDadosCliente>; overload;
    function ExecutarSQLRelatorio(const pSQL: string): IModelQueryFabrica; overload;

    function GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
    function GetDadosClienteCPFRelatorio(const pCPF: string): IModelQueryFabrica;
    function GetDadosClienteNome(const pNome: string): TList<TDadosCliente>;
    function GetDadosClienteNomeRelatorio(const pNome: string): IModelQueryFabrica;
  public
    class function Criar: IModelDAOGetDadosCliente;
  end;

implementation

uses
  Model.Conexao.Fabrica,
  System.SysUtils,
  Model.Query.Fabrica;

{ TModelDAOGetDadosCliente }

class function TModelDAOGetDadosCliente.Criar: IModelDAOGetDadosCliente;
begin
  Result := Self.Create;
end;

function TModelDAOGetDadosCliente.ExecutarSQL(const pSQL: string): TList<TDadosCliente>;
var
  lQuery: TDataSet;
  lDadosCliente: TDadosCliente;
  lQueryFabrica: IModelQueryFabrica;
begin
  Result := TList<TDadosCliente>.Create;

  lQueryFabrica := TModelQueryFabrica.Criar;
  lQuery := lQueryFabrica.Query.AdicionarSQL(pSQL).GetQuery;

  lQuery.Close;
  lQuery.Open;

  lQuery.First;
  while not lQuery.Eof do
  begin
    lDadosCliente.Codigo := lQuery.FieldByName('CODIGO').AsInteger;
    lDadosCliente.Nome := lQuery.FieldByName('NOME').AsString;
    lDadosCliente.CPF := lQuery.FieldByName('CPF').AsString;

    Result.Add(lDadosCliente);

    lQuery.Next;
  end;
end;

function TModelDAOGetDadosCliente.ExecutarSQLRelatorio(
  const pSQL: string): IModelQueryFabrica;
var
  lQuery: TDataSet;
  lQueryFabrica: IModelQueryFabrica;
begin
  lQueryFabrica := TModelQueryFabrica.Criar;
  lQueryFabrica.Query.AdicionarSQL(pSQL).GetQuery.Open;

  Result := lQueryFabrica;
end;

function TModelDAOGetDadosCliente.GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOGetDadosCliente.GetDadosClienteCPFRelatorio(
  const pCPF: string): IModelQueryFabrica;
begin
  Result := ExecutarSQLRelatorio(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOGetDadosCliente.GetDadosClienteNome(
  const pNome: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteNome(pNome));
end;

function TModelDAOGetDadosCliente.GetDadosClienteNomeRelatorio(
  const pNome: string): IModelQueryFabrica;
begin
  Result := ExecutarSQLRelatorio(GetSQLDadosClienteNome(pNome));
end;

function TModelDAOGetDadosCliente.GetSQLDadosClienteCPF(const pCPF: string): string;
begin
  Result := 'SELECT '
          + '  CODIGO, '
          + '  NOME, '
          + '  CPF, '
          + '  ENDERECO, '
          + '  CIDADE, '
          + '  ESTADO '
          + 'FROM '
          + '  CLIENTES '
          + 'WHERE CPF LIKE '
          + QuotedStr('%' + pCPF + '%')
          + ' ORDER BY CODIGO ';
end;

function TModelDAOGetDadosCliente.GetSQLDadosClienteNome(const pNome: string): string;
begin
  Result := 'SELECT '
          + '  CODIGO, '
          + '  NOME, '
          + '  CPF, '
          + '  ENDERECO, '
          + '  CIDADE, '
          + '  ESTADO '
          + 'FROM '
          + '  CLIENTES '
          + 'WHERE UPPER(NOME) LIKE '
          + QuotedStr('%' + UpperCase(pNome) + '%')
          + ' ORDER BY CODIGO ';
end;

end.
