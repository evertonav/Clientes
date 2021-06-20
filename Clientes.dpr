program Clientes;





uses
  Vcl.Forms,
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller in 'Controller\Controller.pas',
  Model.Eventos.Fabrica.Interfaces in 'Model\Model.Eventos.Fabrica.Interfaces.pas',
  Model.Eventos.Fabrica in 'Model\Model.Eventos.Fabrica.pas',
  Model.Eventos.Get.Interfaces in 'Model\Model.Eventos.Get.Interfaces.pas',
  Model.Eventos in 'Model\Model.Eventos.pas',
  Model.Eventos.Preencher.Interfaces in 'Model\Model.Eventos.Preencher.Interfaces.pas',
  Model.DAO.Cliente.Fabrica.Interfaces in 'Model\DAO\Model.DAO.Cliente.Fabrica.Interfaces.pas',
  Model.DAO.Cliente.Fabrica in 'Model\DAO\Model.DAO.Cliente.Fabrica.pas',
  Model.DAO.Cliente.FireDAC in 'Model\DAO\Model.DAO.Cliente.FireDAC.pas',
  Model.DAO.Cliente.Interfaces in 'Model\DAO\Model.DAO.Cliente.Interfaces.pas',
  Model.Conexao.Conectar.Fabrica in 'Model\Conexao\Model.Conexao.Conectar.Fabrica.pas',
  Model.Conexao.Conectar.FireDAC.FireBird in 'Model\Conexao\Model.Conexao.Conectar.FireDAC.FireBird.pas',
  Model.Conexao.Conectar.Interfaces in 'Model\Conexao\Model.Conexao.Conectar.Interfaces.pas',
  View.CadastroCliente in 'View\View.CadastroCliente.pas' {ViewCadastroCliente},
  View.PesquisarClientes in 'View\View.PesquisarClientes.pas' {ViewPesquisarClientes},
  Model.DAO.Cliente.Pesquisar.Interfaces in 'Model\DAO\Model.DAO.Cliente.Pesquisar.Interfaces.pas',
  Model.DAO.Cliente.Pesquisar.CPF in 'Model\DAO\Model.DAO.Cliente.Pesquisar.CPF.pas',
  Model.DAO.Cliente.GetDados.FireDAC in 'Model\DAO\Model.DAO.Cliente.GetDados.FireDAC.pas',
  Model.DAO.Cliente.GetDados.Interfaces in 'Model\DAO\Model.DAO.Cliente.GetDados.Interfaces.pas',
  Model.DAO.Cliente.GetDados.Fabrica in 'Model\DAO\Model.DAO.Cliente.GetDados.Fabrica.pas',
  Model.DAO.Cliente.GetDados.Fabrica.Interfaces in 'Model\DAO\Model.DAO.Cliente.GetDados.Fabrica.Interfaces.pas',
  Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces in 'Model\DAO\Model.DAO.Cliente.Pesquisar.Fabrica.Interfaces.pas',
  Model.DAO.Cliente.Pesquisar.Fabrica in 'Model\DAO\Model.DAO.Cliente.Pesquisar.Fabrica.pas',
  Model.DAO.Cliente.Pesquisar.Nome in 'Model\DAO\Model.DAO.Cliente.Pesquisar.Nome.pas',
  View.Relatorio in 'View\View.Relatorio.pas' {ViewRelatorio},
  View.Principal in 'View\View.Principal.pas' {ViewPrincipal},
  Controller.TiposDados in 'Controller\Controller.TiposDados.pas',
  Model.Conexao.DadosBanco in 'Model\Conexao\Model.Conexao.DadosBanco.pas',
  Model.Conexao.DadosBanco.Interfaces in 'Model\Conexao\Model.Conexao.DadosBanco.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
