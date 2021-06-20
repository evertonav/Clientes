unit Model.DAO.Cliente.GetDados.FireDAC;

interface

uses
  FireDAC.Comp.Client,
  Model.DAO.Cliente.GetDados.Interfaces,
  Data.DB,
  System.Generics.Collections,
  Controller.TiposDados;

type
  TModelDAOClienteGetDados = class(TInterfacedObject, IModelDAOClienteGetDados)
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
    class function Criar: IModelDAOClienteGetDados;
  end;

implementation

uses
  Model.Conexao.Conectar.Fabrica,
  System.SysUtils;

{ TModelDAOClienteGetDados }

class function TModelDAOClienteGetDados.Criar: IModelDAOClienteGetDados;
begin
  Result := Self.Create;
end;

function TModelDAOClienteGetDados.ExecutarSQL(const pSQL: string): TList<TDadosCliente>;
var
  lQuery: TFDQuery;
  lConexao: TFDConnection;
  lDadosCliente: TDadosCliente;
begin
  Result := TList<TDadosCliente>.Create;

  lConexao := TFDConnection.Create(nil);
  try
    TModelConexaoConectarFabrica.Conexao.Conectar(lConexao);

    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := lConexao;

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
  finally
    lConexao.Free;
  end;
end;

function TModelDAOClienteGetDados.ExecutarSQLRelatorio(
  const pSQL: string): TDataSet;
var
  lQuery: TFDQuery;
  lConexao: TFDConnection;
begin
  lQuery := TFDQuery.Create(nil);

  lConexao := TFDConnection.Create(lQuery);
  TModelConexaoConectarFabrica.Conexao.Conectar(lConexao);

  lQuery.Connection := lConexao;

  lQuery.Close;
  lQuery.SQL.Clear;
  lQuery.SQL.Add(pSQL);
  lQuery.Open;

  Result := lQuery;
end;

function TModelDAOClienteGetDados.GetDadosClienteCPF(const pCPF: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOClienteGetDados.GetDadosClienteCPFRelatorio(
  const pCPF: string): TDataSet;
begin
  Result := ExecutarSQLRelatorio(GetSQLDadosClienteCPF(pCPF));
end;

function TModelDAOClienteGetDados.GetDadosClienteNome(
  const pNome: string): TList<TDadosCliente>;
begin
  Result := ExecutarSQL(GetSQLDadosClienteNome(pNome));
end;

function TModelDAOClienteGetDados.GetDadosClienteNomeRelatorio(
  const pNome: string): TDataSet;
begin
  Result := ExecutarSQLRelatorio(GetSQLDadosClienteNome(pNome));
end;

function TModelDAOClienteGetDados.GetSQLDadosClienteCPF(const pCPF: string): string;
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

function TModelDAOClienteGetDados.GetSQLDadosClienteNome(const pNome: string): string;
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
