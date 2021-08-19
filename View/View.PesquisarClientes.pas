unit View.PesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  System.Generics.Collections, Controller.TiposDados, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList;

type
  TViewPesquisarClientes = class(TForm)
    ltvPesquisarClientes: TListView;
    edtFiltro: TEdit;
    cbxTipoFiltro: TComboBox;
    pnlInferiorContainer: TPanel;
    btnImprimir: TButton;
    gbxListaClientes: TGroupBox;
    gbxFiltro: TGroupBox;
    pnlContainer: TPanel;
    pnlDica: TPanel;
    lblDica: TLabel;
    pnlTopo: TPanel;
    btnPesquisar: TButton;
    procedure ltvPesquisarClientesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbxTipoFiltroChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FFiltro: string;
    FTipoFiltro: TTipoFiltro;

    procedure Pesquisar(const pTipoFiltro: TTipoFiltro;
                        const pFiltro: string);

    procedure PreencherListView(pDadosCliente: TList<TDadosCliente>);

    procedure AdicionarItemLista(const pCodigo: string;
                                 const pNome: string;
                                 const pCPF: string);
  public
    { Public declarations }
  end;

var
  ViewPesquisarClientes: TViewPesquisarClientes;

implementation

uses
  Controller,
  Data.DB,
  View.CadastroCliente;

{$R *.dfm}

procedure TViewPesquisarClientes.AdicionarItemLista(const pCodigo: string; const pNome,
  pCPF: string);
var
  Item: TListItem;
begin
  Item := ltvPesquisarClientes.Items.Add;
  Item.Caption := pCodigo;//CODIGO
  Item.SubItems.Add(pNome);//Nome
  Item.SubItems.Add(pCPF);//CPF
end;

procedure TViewPesquisarClientes.btnImprimirClick(Sender: TObject);
begin
  //Ver depois porque da memory leak
  {if ltvPesquisarClientes.Items.Count > 0 then
  begin
    ViewRelatorio := TViewRelatorio.Create(Self);
    try
      ViewRelatorio.ImprimirRelatorio(FFiltro,
                                      FTipoFiltro);
    finally
      ViewRelatorio.Free;
    end;
  end; }
end;

procedure TViewPesquisarClientes.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar(TTipoFiltro(cbxTipoFiltro.ItemIndex), edtFiltro.Text);

  FFiltro := edtFiltro.Text;
  FTipoFiltro := TTipoFiltro(cbxTipoFiltro.ItemIndex);
end;

procedure TViewPesquisarClientes.cbxTipoFiltroChange(Sender: TObject);
begin
  case TTipoFiltro(cbxTipoFiltro.ItemIndex) of
    tfNome:
    begin
      edtFiltro.MaxLength := 100;
      edtFiltro.Text := EmptyStr;
    end;
    tfCPF:
    begin
      edtFiltro.MaxLength := 14;
      edtFiltro.Text := EmptyStr;
    end;
  end;
end;

procedure TViewPesquisarClientes.FormCreate(Sender: TObject);
begin
  FFiltro := EmptyStr;
  FTipoFiltro := tfNome;
end;

procedure TViewPesquisarClientes.ltvPesquisarClientesDblClick(Sender: TObject);
begin
  ViewCadastroCliente := TViewCadastroCliente.Create(nil);
  try
    if ltvPesquisarClientes.ItemIndex >= 0 then
    begin
      ViewCadastroCliente.Codigo :=  ltvPesquisarClientes.ItemFocused.Caption.ToInteger;
      ViewCadastroCliente.AcessoCadastro := acEditarExcluir;
      ViewCadastroCliente.ShowModal;

      Pesquisar(FTipoFiltro, FFiltro);
    end
    else
      ShowMessage('Você deve selecionar um cliente para abrir o cadastro!');
  finally
    ViewCadastroCliente.Free;
  end;
end;

procedure TViewPesquisarClientes.Pesquisar(const pTipoFiltro: TTipoFiltro;
  const pFiltro: string);
begin
  case pTipoFiltro of
    tfNome:
    begin
      PreencherListView(TController
                          .Criar
                          .PesquisarClientesFabrica
                          .PesquisarClienteNome
                          .Parametro(pFiltro)
                          .Pesquisar);
    end;
    tfCPF:
    begin
      PreencherListView(TController
                          .Criar
                          .PesquisarClientesFabrica
                          .PesquisarClienteCPF
                          .Parametro(pFiltro)
                          .Pesquisar);
    end;
  end;
end;

procedure TViewPesquisarClientes.PreencherListView(pDadosCliente: TList<TDadosCliente>);
var
  I: Integer;
  lQuantidadeCliente: Integer;
begin
  ltvPesquisarClientes.Items.Clear;

  if Assigned(pDadosCliente) then
  begin
    try
      lQuantidadeCliente := pDadosCliente.Count;

      if lQuantidadeCliente > 0 then
      begin
        lQuantidadeCliente := lQuantidadeCliente - 1;

        pDadosCliente.First;

        for I := 0 to lQuantidadeCliente do
        begin
          AdicionarItemLista(pDadosCliente.Items[I].Codigo.ToString,
                             pDadosCliente.Items[I].Nome,
                             pDadosCliente.Items[I].CPF);
        end;
      end;
    finally
      pDadosCliente.Free;
    end;
  end;
end;

end.
