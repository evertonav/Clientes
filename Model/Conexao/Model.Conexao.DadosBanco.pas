unit Model.Conexao.DadosBanco;

interface

uses
  Model.Conexao.DadosBanco.Interfaces,
  System.IniFiles;

type
  TModelConexaoDadosBanco = class(TInterfacedObject, IModelConexaoDadosBanco)
  private
    FConfiguracao: TMemIniFile;

    function Nome: string;
    function Caminho: string;
    function CaminhoCompleto: string;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    class function Criar: IModelConexaoDadosBanco;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoDadosBanco }

function TModelConexaoDadosBanco.Caminho: string;
begin
  Result := IncludeTrailingPathDelimiter(FConfiguracao.ReadString('BANCO_DADOS', 'CAMINHO', GetCurrentDir));
end;

function TModelConexaoDadosBanco.CaminhoCompleto: string;
begin
  Result := Caminho + Nome;
end;

constructor TModelConexaoDadosBanco.Create;
begin
  FConfiguracao := TMemIniFile.Create(GetCurrentDir + '\Configuracao.ini');
end;

class function TModelConexaoDadosBanco.Criar: IModelConexaoDadosBanco;
begin
  Result := Self.Create;
end;

destructor TModelConexaoDadosBanco.Destroy;
begin
  if Assigned(FConfiguracao) then
    FConfiguracao.Free;

  inherited;
end;

function TModelConexaoDadosBanco.Nome: string;
begin
  Result := FConfiguracao.ReadString('BANCO_DADOS', 'NOME', 'BANCO.FDB');
end;

end.
