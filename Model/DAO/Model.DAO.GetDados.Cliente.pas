unit Model.DAO.GetDados.Cliente;

interface

uses
  FireDAC.Comp.Client,
  Model.DAO.GetDados.Cliente.Interfaces,
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOGetDadosCliente = class(TInterfacedObject, IModelDAOGetDadosCliente)
  private
    function GetSQLDadosClienteCPF(const pCPF: string): string;
    function GetSQLDadosClienteNome(const pNome: string): string;

    function ExecutarSQL(const pSQL: string): TList<TDadosCliente>; overload;
    function ExecutarSQLRelatorio(const pSQL: string): TDataSet; overload;

    function GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
    function GetDadosClienteCPFRelatorio(const pCPF: string): TDataSet;
    function GetDadosClienteNome(const pNome: string): TList<TDadosCliente>;
    function GetDadosClienteNomeRelatorio(const pNome: string): TDataSet;
  public
    class function Criar: IModelDAOGetDadosCliente;
  end;

implementation

uses
  Model.Conexao.Fabrica,
  System.SysUtils;

{ TModelDAOGetDadosCliente }

class function TModelDAOGetDadosCliente.Criar: IModelDAOGetDadosCliente;
begin
  Result := Self.Create;
end;

function TModelDAOGetDadosCliente.ExecutarSQL(const pSQL: string): TList<TDadosCliente>;
var
  lQuery: TFDQuery;
  lDadosCliente: TDadosCliente;
begin
  Result := TList<TDadosCliente>.Create;

  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := TModelConexaoFabrica.ConexaoFireDac;

    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(pSQL);
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
  finally
    lQuery.Close;
    lQuery.Free;
  end;
end;

function TModelDAOGetDadosCliente.ExecutarSQLRelatorio(
  const pSQL: string): TDataSet;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);

  lQuery.Connection := TModelConexaoFabrica.ConexaoFireDac;

  lQuery.Close;
  lQuery.SQL.Clear;
  lQuery.SQL.Add(pSQL);
  lQuery.Open;

  Result := lQuery;
end;

function TModelDAOGetDadosCliente.GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOGetDadosCliente.GetDadosClienteCPFRelatorio(
  const pCPF: string): TDataSet;
begin
  Result := ExecutarSQLRelatorio(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOGetDadosCliente.GetDadosClienteNome(
  const pNome: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteNome(pNome));
end;

function TModelDAOGetDadosCliente.GetDadosClienteNomeRelatorio(
  const pNome: string): TDataSet;
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
