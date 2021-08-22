unit TesteConexao;

interface

uses
  DUnitX.TestFramework,
  Model.Conexao.FireDac,
  Model.Conexao.DadosBanco,
  Model.Conexao.DadosBanco.Interfaces,
  Model.Conexao.Interfaces,
  System.SysUtils;

type
  {Objetivo deste teste é testar a conexão com o
   banco de dados se está ok}
  [TestFixture]
  TMyTestObject = class
  private
  public
    // Sample Methods
    // Simple single Test
    [Setup]
    procedure Setup;
    // Test with TestCase Attribute to supply parameters.
    [TearDown]
    procedure TearDown;

    [Test]
    procedure VerificarFBClienteDLL;

    [Test]
    procedure VerificarCaminhoBanco;

    [Test]
    procedure VerificarCaminhoConfiguracaoIni;

    [Test]
    procedure ConectarBanco;
  end;

implementation

procedure TMyTestObject.Setup;
begin

end;

procedure TMyTestObject.TearDown;
begin

end;

procedure TMyTestObject.VerificarCaminhoBanco;
begin
  Assert.IsTrue(FileExists(TModelConexaoDadosBanco.Criar.CaminhoCompleto),
                'Verifique o caminho do banco de dados!')
end;

procedure TMyTestObject.VerificarCaminhoConfiguracaoIni;
begin
  Assert.IsTrue(FileExists(GetCurrentDir + '\Configuracao.ini'),
                'Verifique o arquivo de Configuracao.ini se está junto com o executavel')
end;

procedure TMyTestObject.VerificarFBClienteDLL;
begin
  Assert.IsTrue(FileExists(GetCurrentDir + '\FBClient.dll'),
                'Verifique se a FBClient.dll está junto com o executável!');
end;

procedure TMyTestObject.ConectarBanco;
begin
  Assert.IsTrue(TModelConexaoFireDac.Criar.GetConexao.Connected,
                'Você deve verificar a conexão com o banco de dados');
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
