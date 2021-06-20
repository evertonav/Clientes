object ViewRelatorio: TViewRelatorio
  Left = 14
  Top = 0
  Caption = 'ViewRelatorio'
  ClientHeight = 415
  ClientWidth = 1169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object repHistoricoVisitas: TQuickRep
    Left = 32
    Top = 48
    Width = 794
    Height = 1123
    ShowingPreview = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Default
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = False
    ReportTitle = 'Fornecedores por Dia de Visita'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object phdCabecalho: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 60
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = bndDetalhe
      Size.Values = (
        158.750000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lblTituloRelatorio: TQRLabel
        Left = 3
        Top = 16
        Width = 116
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          42.333333333333330000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Relat'#243'rio de Clientes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object sdtHorarioEmissaoRelatorio: TQRSysData
        Left = 804
        Top = 3
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          2127.250000000000000000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = True
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblPagina: TQRLabel
        Left = 936
        Top = 3
        Width = 40
        Height = 18
        Size.Values = (
          47.625000000000000000
          2476.500000000000000000
          7.937500000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object sdtContadorPagina: TQRSysData
        Left = 985
        Top = 3
        Width = 42
        Height = 18
        Size.Values = (
          47.625000000000000000
          2606.145833333333000000
          7.937500000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = True
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCodigo: TQRLabel
        Left = 16
        Top = 41
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333330000
          108.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblNome: TQRLabel
        Left = 88
        Top = 41
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333300000
          108.479166666666700000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCPF: TQRLabel
        Left = 319
        Top = 41
        Width = 20
        Height = 15
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          108.479166666666700000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CPF'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblEndereco: TQRLabel
        Left = 423
        Top = 41
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          1119.187500000000000000
          108.479166666666700000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCidade: TQRLabel
        Left = 718
        Top = 40
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1899.708333333333000000
          105.833333333333300000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblEstado: TQRLabel
        Left = 988
        Top = 40
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          2614.083333333333000000
          105.833333333333300000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object shpCabecalho: TQRShape
        Left = 2
        Top = 56
        Width = 1046
        Height = 1
        Size.Values = (
          2.645833333333333000
          5.291666666666667000
          148.166666666666700000
          2767.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object bndDetalhe: TQRBand
      Left = 38
      Top = 98
      Width = 718
      Height = 17
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object edtCodigo: TQRDBText
        Left = 16
        Top = 1
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object edtNome: TQRDBText
        Left = 88
        Top = 1
        Width = 225
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          2.645833333333333000
          595.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object edtCPF: TQRDBText
        Left = 319
        Top = 1
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          844.020833333333200000
          2.645833333333333000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object edtEndereco: TQRDBText
        Left = 423
        Top = 1
        Width = 285
        Height = 17
        Size.Values = (
          44.979166666666670000
          1119.187500000000000000
          2.645833333333333000
          754.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object edtCidade: TQRDBText
        Left = 718
        Top = 1
        Width = 260
        Height = 17
        Size.Values = (
          44.979166666666670000
          1899.708333333333000000
          2.645833333333333000
          687.916666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object edtEstado: TQRDBText
        Left = 988
        Top = 1
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          2614.083333333333000000
          2.645833333333333000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
end
