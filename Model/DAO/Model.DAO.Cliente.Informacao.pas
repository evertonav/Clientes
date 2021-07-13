unit Model.DAO.Cliente.Informacao;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param;

type
  TModelDAOClienteValidar = class
  public
    class function CPF(const pCPF: string): Boolean;
  end;

  TModelDAOClienteGet = class
  public
    class function ProximoCodigoCliente: Integer;
  end;

implementation

uses
  DAO.DMConexao;

{ TModelDAOClienteValidar }

class function TModelDAOClienteValidar.CPF(const pCPF: string): Boolean;
const
  CONST_GET_PROXIMO_CODIGO_CLIENTE = 'SELECT '
                                   + '  CPF '
                                   + 'FROM '
                                   + '  CLIENTES '
                                   + 'WHERE CPF = :CPF ';
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := DMConexao.GetConexao;

    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(CONST_GET_PROXIMO_CODIGO_CLIENTE);

    lQuery.Params.ParamByName('CPF').AsString := pCPF;

    lQuery.Open;

    Result := lQuery.IsEmpty;
  finally
    lQuery.Close;
    lQuery.Free;
  end;
end;

{ TModelDAOClienteGet }

class function TModelDAOClienteGet.ProximoCodigoCliente: Integer;
const
  CONST_GET_PROXIMO_CODIGO_CLIENTE = 'SELECT '
                                   + '  COALESCE(MAX(CODIGO), 0) + 1 '
                                   + 'FROM '
                                   + '  CLIENTES ';
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := DMConexao.GetConexao;

    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(CONST_GET_PROXIMO_CODIGO_CLIENTE);
    lQuery.Open;

    Result := lQuery.Fields[0].AsInteger;
  finally
    lQuery.Close;
    lQuery.Free;
  end;
end;

end.
