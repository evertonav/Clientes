unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  Vcl.Mask;

type
  TViewPrincipal = class(TForm)
    pnlContainer: TPanel;
    actPrincipal: TActionList;
    imgPrincipal: TImageList;
    actCadastrarClientes: TAction;
    actPesquisarClientes: TAction;
    pnlMenu: TGridPanel;
    btnCadastroClientes: TSpeedButton;
    btnPesquisarClientes: TSpeedButton;
    procedure actCadastrarClientesExecute(Sender: TObject);
    procedure actPesquisarClientesExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  View.CadastroCliente,
  View.PesquisarClientes,
  DAO.DMConexao;

{$R *.dfm}

procedure TViewPrincipal.actCadastrarClientesExecute(Sender: TObject);
begin
  ViewCadastroCliente := TViewCadastroCliente.Create(nil);
  try
    ViewCadastroCliente.ShowModal;
  finally
    ViewCadastroCliente.Free;
  end;
end;

procedure TViewPrincipal.actPesquisarClientesExecute(Sender: TObject);
begin
  ViewPesquisarClientes := TViewPesquisarClientes.Create(nil);
  try
    ViewPesquisarClientes.ShowModal;
  finally
    ViewPesquisarClientes.Free;
  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  //ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewPrincipal.FormResize(Sender: TObject);
begin
  pnlMenu.AlignWithMargins := True;
  pnlMenu.Margins.Left := 250;
  pnlMenu.Margins.Right := 250;
  pnlMenu.Margins.Top := 200;
  pnlMenu.Margins.Bottom := 250;
end;

end.
