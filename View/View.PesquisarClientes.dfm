object ViewPesquisarClientes: TViewPesquisarClientes
  Left = 0
  Top = 0
  Caption = 'Pesquisar Clientes'
  ClientHeight = 417
  ClientWidth = 506
  Color = clBtnFace
  Constraints.MinHeight = 455
  Constraints.MinWidth = 522
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 417
    Align = alClient
    Caption = 'pnlContainer'
    TabOrder = 0
    ExplicitWidth = 457
    ExplicitHeight = 360
    object gbxListaClientes: TGroupBox
      Left = 1
      Top = 52
      Width = 504
      Height = 323
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 455
      ExplicitHeight = 266
      object ltvPesquisarClientes: TListView
        Left = 2
        Top = 33
        Width = 500
        Height = 288
        Align = alClient
        Columns = <
          item
            Caption = 'C'#243'digo'
          end
          item
            Caption = 'Nome'
            Width = 250
          end
          item
            Caption = 'CPF'
            Width = 130
          end>
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ltvPesquisarClientesDblClick
        ExplicitWidth = 451
        ExplicitHeight = 231
      end
      object pnlDica: TPanel
        Left = 2
        Top = 15
        Width = 500
        Height = 18
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 451
        object lblDica: TLabel
          Left = 8
          Top = 2
          Width = 399
          Height = 13
          Caption = 
            'Dica: Para acessar o cadastro, basta dar um duplo clique na linh' +
            'a da coluna c'#243'digo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object pnlInferiorContainer: TPanel
      Left = 1
      Top = 375
      Width = 504
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 318
      ExplicitWidth = 455
      DesignSize = (
        504
        41)
      object btnImprimir: TButton
        Left = 421
        Top = 7
        Width = 76
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Imprimir'
        TabOrder = 0
        Visible = False
        OnClick = btnImprimirClick
        ExplicitLeft = 372
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 504
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 455
      object gbxFiltro: TGroupBox
        Left = 0
        Top = 0
        Width = 412
        Height = 51
        Align = alLeft
        Caption = ' Filtro '
        TabOrder = 0
        object edtFiltro: TEdit
          Left = 79
          Top = 18
          Width = 323
          Height = 21
          TabOrder = 1
        end
        object cbxTipoFiltro: TComboBox
          Left = 11
          Top = 18
          Width = 62
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'Nome'
          OnChange = cbxTipoFiltroChange
          Items.Strings = (
            'Nome'
            'CPF')
        end
      end
      object btnPesquisar: TButton
        AlignWithMargins = True
        Left = 415
        Top = 3
        Width = 82
        Height = 45
        Align = alLeft
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = btnPesquisarClick
      end
    end
  end
end
