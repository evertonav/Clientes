unit View.CadastroCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Controller,
  Controller.Interfaces,
  Vcl.ComCtrls,
  Data.DB,
  Controller.TiposDados;

type
  TViewCadastroCliente = class(TForm)
    pnlTopoNavigator: TPanel;
    nvgPercorrerRegistros: TDBNavigator;
    nvgAcoes: TDBNavigator;
    gbxContainer: TGroupBox;
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    edtEndereco: TDBEdit;
    gbxCodigo: TGroupBox;
    edtCodigo: TDBEdit;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblEndereco: TLabel;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    dsCadastro: TDataSource;
    cbxEstado: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController: IController;
    FCodigo: Integer;
    FAcessoCadastro: TPermissaoCadastro;

    procedure PreencherComboEstados;
    procedure SetCodigo(const Value: Integer);
    procedure SetAcessoCadastro(const Value: TPermissaoCadastro);

    procedure AfterDelete(DataSet: TDataSet);
  public
    { Public declarations }
    property Codigo: Integer read FCodigo write SetCodigo;
    property AcessoCadastro: TPermissaoCadastro read FAcessoCadastro write SetAcessoCadastro;
  end;

const
  CONST_ESTADOS_BRASIL: array [1..26] of string = ('AC',
                                                   'AL',
                                                   'AP',
                                                   'AM',
                                                   'BA',
                                                   'CE',
                                                   'DF',
                                                   'ES',
                                                   'GO',
                                                   'MA',
                                                   'MT',
                                                   'MS',
                                                   'PA',
                                                   'PB',
                                                   'PR',
                                                   'PE',
                                                   'PI',
                                                   'RJ',
                                                   'RN',
                                                   'RS',
                                                   'RO',
                                                   'RR',
                                                   'TO',
                                                   'SC',
                                                   'SP',
                                                   'SE');

var
  ViewCadastroCliente: TViewCadastroCliente;

implementation

{$R *.dfm}

procedure TViewCadastroCliente.AfterDelete(DataSet: TDataSet);
begin
  if AcessoCadastro = acEditarExcluir then
  begin
    edtCodigo.ReadOnly := True;
    edtNome.ReadOnly := True;
    edtCPF.ReadOnly := True;
    edtEndereco.ReadOnly := True;
    edtCidade.ReadOnly := True;
    cbxEstado.ReadOnly := True;
    nvgAcoes.Visible := False;
  end;
end;

procedure TViewCadastroCliente.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  FCodigo := 0;
  FAcessoCadastro := acTotal;
end;

procedure TViewCadastroCliente.FormShow(Sender: TObject);
begin
  PreencherComboEstados;

  FController := TController.Criar;

  FController
    .ClientesFabrica
    .DataSource(dsCadastro)
    .Codigo(FCodigo)
    .SetAfterDelete(AfterDelete)
    .Consultar;
end;

procedure TViewCadastroCliente.PreencherComboEstados;
var
  I: Integer;
begin
  cbxEstado.Items.Clear;

  for I := 1 to High(CONST_ESTADOS_BRASIL) do
    cbxEstado.Items.Add(CONST_ESTADOS_BRASIL[I]);
end;

procedure TViewCadastroCliente.SetAcessoCadastro(const Value: TPermissaoCadastro);
begin
  FAcessoCadastro := Value;

  if FAcessoCadastro = acEditarExcluir then
  begin
    nvgPercorrerRegistros.Visible := False;
    nvgAcoes.VisibleButtons := [nbDelete, nbEdit, nbPost, nbCancel];
  end
  else
    begin
      nvgPercorrerRegistros.Visible := True;
      nvgAcoes.VisibleButtons := [nbInsert, nbDelete, nbEdit, nbPost, nbCancel];
    end;
end;

procedure TViewCadastroCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

end.
