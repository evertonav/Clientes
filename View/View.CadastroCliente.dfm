object ViewCadastroCliente: TViewCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 417
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopoNavigator: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 41
    Align = alTop
    TabOrder = 1
    object nvgPercorrerRegistros: TDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 200
      Height = 35
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      DataSource = dsCadastro
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alLeft
      TabOrder = 0
    end
    object nvgAcoes: TDBNavigator
      AlignWithMargins = True
      Left = 213
      Top = 3
      Width = 290
      Height = 35
      Margins.Left = 10
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = dsCadastro
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Align = alClient
      TabOrder = 1
    end
  end
  object gbxContainer: TGroupBox
    Left = 0
    Top = 41
    Width = 506
    Height = 376
    Align = alClient
    Constraints.MinHeight = 376
    Constraints.MinWidth = 506
    TabOrder = 0
    object lblNome: TLabel
      Left = 16
      Top = 59
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblCPF: TLabel
      Left = 16
      Top = 105
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblEndereco: TLabel
      Left = 16
      Top = 151
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblCidade: TLabel
      Left = 16
      Top = 197
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblEstado: TLabel
      Left = 16
      Top = 243
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object edtNome: TDBEdit
      Left = 16
      Top = 78
      Width = 300
      Height = 21
      DataField = 'NOME'
      DataSource = dsCadastro
      MaxLength = 100
      TabOrder = 0
    end
    object edtCPF: TDBEdit
      Left = 16
      Top = 124
      Width = 300
      Height = 21
      DataField = 'CPF'
      DataSource = dsCadastro
      MaxLength = 11
      TabOrder = 1
    end
    object edtEndereco: TDBEdit
      Left = 16
      Top = 170
      Width = 300
      Height = 21
      DataField = 'ENDERECO'
      DataSource = dsCadastro
      MaxLength = 200
      TabOrder = 2
    end
    object gbxCodigo: TGroupBox
      Left = 16
      Top = 10
      Width = 300
      Height = 43
      Caption = ' C'#243'digo '
      TabOrder = 5
      object edtCodigo: TDBEdit
        Left = 7
        Top = 17
        Width = 285
        Height = 21
        DataField = 'CODIGO'
        DataSource = dsCadastro
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edtCidade: TDBEdit
      Left = 16
      Top = 216
      Width = 300
      Height = 21
      DataField = 'CIDADE'
      DataSource = dsCadastro
      MaxLength = 70
      TabOrder = 3
    end
    object cbxEstado: TDBComboBox
      Left = 16
      Top = 262
      Width = 300
      Height = 21
      Style = csDropDownList
      DataField = 'ESTADO'
      DataSource = dsCadastro
      Items.Strings = (
        'RS'
        'SP'
        'RR')
      TabOrder = 4
    end
  end
  object dsCadastro: TDataSource
    Left = 464
    Top = 273
  end
end
