object FrmCadastroItens: TFrmCadastroItens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de itens'
  ClientHeight = 442
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 400
    Width = 824
    Height = 42
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 399
    ExplicitWidth = 820
    object btnSalvar: TSpeedButton
      Left = 721
      Top = 1
      Width = 102
      Height = 40
      Align = alRight
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnCancelar: TSpeedButton
      Left = 1
      Top = 1
      Width = 102
      Height = 40
      Align = alLeft
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object gbDadosPrincipais: TGroupBox
    Left = 0
    Top = 0
    Width = 824
    Height = 105
    Align = alTop
    Caption = 'Dados principais'
    DefaultHeaderFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -15
    HeaderFont.Name = 'Arial'
    HeaderFont.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 820
    object lblCodigo: TLabel
      Left = 8
      Top = 24
      Width = 50
      Height = 16
      Caption = 'C'#243'digo*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 135
      Top = 24
      Width = 67
      Height = 16
      Caption = 'Descri'#231#227'o*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblObservacoes: TLabel
      Left = 831
      Top = 24
      Width = 84
      Height = 16
      Caption = 'Observa'#231#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPreco: TLabel
      Left = 455
      Top = 24
      Width = 70
      Height = 16
      Caption = 'Pre'#231'o (R$)*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 729
      Top = 24
      Width = 44
      Height = 16
      Caption = 'Status*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGrupo: TLabel
      Left = 582
      Top = 24
      Width = 44
      Height = 16
      Caption = 'Grupo*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 46
      Width = 121
      Height = 24
      Hint = 'C'#243'digo do item gerado pelo sistema.'
      Color = clSilver
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'C'#243'digo do item gerado pelo sistema.'
    end
    object edtDescricao: TEdit
      Left = 135
      Top = 46
      Width = 314
      Height = 24
      Hint = 'Informe a descri'#231#227'o do item.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object mmoObservacoes: TMemo
      Left = 831
      Top = 46
      Width = 185
      Height = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtPreco: TEdit
      Left = 455
      Top = 46
      Width = 121
      Height = 24
      Hint = 'Informe o pre'#231'o do item para clientes gerais.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = edtPrecoKeyPress
    end
    object cbStatus: TComboBox
      Left = 729
      Top = 46
      Width = 86
      Height = 24
      Hint = 'Selecione o status atual do item.'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'Ativo'
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
    object cbGrupos: TComboBox
      Left = 582
      Top = 46
      Width = 141
      Height = 24
      Hint = 'Selecione o grupo deste item.'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = 'Outros'
      Items.Strings = (
        'Cama'
        'Banho'
        'Cozinha'
        'Vestu'#225'rio'
        'Outros')
    end
  end
end
