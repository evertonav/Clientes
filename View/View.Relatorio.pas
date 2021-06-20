unit View.Relatorio;

interface

uses
  Vcl.Forms, QRCtrls, QuickRpt, System.Classes, Vcl.Controls, Vcl.ExtCtrls,
  Controller.TiposDados;

type
  TViewRelatorio = class(TForm)
    repHistoricoVisitas: TQuickRep;
    phdCabecalho: TQRBand;
    lblTituloRelatorio: TQRLabel;
    sdtHorarioEmissaoRelatorio: TQRSysData;
    lblPagina: TQRLabel;
    sdtContadorPagina: TQRSysData;
    lblCodigo: TQRLabel;
    lblNome: TQRLabel;
    lblCPF: TQRLabel;
    lblEndereco: TQRLabel;
    lblCidade: TQRLabel;
    lblEstado: TQRLabel;
    shpCabecalho: TQRShape;
    bndDetalhe: TQRBand;
    edtCodigo: TQRDBText;
    edtNome: TQRDBText;
    edtCPF: TQRDBText;
    edtEndereco: TQRDBText;
    edtCidade: TQRDBText;
    edtEstado: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(const pFiltro: string;
                                const pTipoFiltro: TTipoFiltro);
  end;

var
  ViewRelatorio: TViewRelatorio;

implementation

uses
  Controller;

{$R *.dfm}

procedure TViewRelatorio.ImprimirRelatorio(const pFiltro: string;
  const pTipoFiltro: TTipoFiltro);
begin
  //Ver depois porque da memory leak
  try
    case pTipoFiltro of
      tfNome:
      begin
        repHistoricoVisitas.DataSet := TController
                                         .Criar
                                         .PesquisarClientesFabrica
                                         .PesquisarClienteNome
                                         .Parametro(pFiltro)
                                         .GerarDadosRelatorio;
      end;
      tfCPF:
      begin
        repHistoricoVisitas.DataSet := TController
                                         .Criar
                                         .PesquisarClientesFabrica
                                         .PesquisarClienteCPF
                                         .Parametro(pFiltro)
                                         .GerarDadosRelatorio;
      end;
    end;

    edtCodigo.DataSet := repHistoricoVisitas.DataSet;
    edtNome.DataSet := repHistoricoVisitas.DataSet;
    edtCPF.DataSet := repHistoricoVisitas.DataSet;
    edtEndereco.DataSet := repHistoricoVisitas.DataSet;
    edtCidade.DataSet := repHistoricoVisitas.DataSet;
    edtEstado.DataSet := repHistoricoVisitas.DataSet;

    repHistoricoVisitas.PreviewModal;

    Application.ProcessMessages;
  finally
    repHistoricoVisitas.DataSet.Free;
  end;
end;

end.
