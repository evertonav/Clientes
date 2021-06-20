unit Model.Conexao.DadosBanco.Interfaces;

interface

type
  IModelConexaoDadosBanco = interface
    ['{B8C8D127-A72A-4F31-A325-9B675FABE0F0}']
    function Nome: string;
    function Caminho: string;
    function CaminhoCompleto: string;
  end;

implementation

end.
