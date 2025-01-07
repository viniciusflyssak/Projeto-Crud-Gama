object FrmCadastroCliente: TFrmCadastroCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de cliente'
  ClientHeight = 442
  ClientWidth = 1030
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
  object gbDadosPrincipais: TGroupBox
    Left = 0
    Top = 0
    Width = 1030
    Height = 153
    Align = alTop
    Caption = 'Dados principais'
    DefaultHeaderFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -15
    HeaderFont.Name = 'Arial'
    HeaderFont.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1026
    object lblCodigo: TLabel
      Left = 8
      Top = 24
      Width = 51
      Height = 16
      Caption = 'C'#243'digo*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 135
      Top = 24
      Width = 43
      Height = 16
      Caption = 'Nome*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTelefone: TLabel
      Left = 614
      Top = 24
      Width = 55
      Height = 16
      Caption = 'Telefone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 739
      Top = 24
      Width = 51
      Height = 16
      Caption = 'Status*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
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
    object lblValorKg: TLabel
      Left = 8
      Top = 89
      Width = 112
      Height = 16
      Caption = 'Pre'#231'o por KG(R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 46
      Width = 121
      Height = 24
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 135
      Top = 46
      Width = 473
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
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
      TabOrder = 4
    end
    object cbStatus: TComboBox
      Left = 739
      Top = 46
      Width = 86
      Height = 24
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 3
      Text = 'Ativo'
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
    object edtTelefone: TMaskEdit
      Left = 614
      Top = 46
      Width = 115
      Height = 24
      EditMask = '!\(99\)00000-0000;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
      Text = ''
    end
    object edtPrecoKg: TEdit
      Left = 8
      Top = 111
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edtPrecoKgKeyPress
    end
  end
  object gbEnderecos: TGroupBox
    Left = 0
    Top = 153
    Width = 1030
    Height = 153
    Align = alTop
    Caption = 'Endere'#231'os'
    DefaultHeaderFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -15
    HeaderFont.Name = 'Arial'
    HeaderFont.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 1026
    object grdEnderecos: TDBGrid
      Left = 3
      Top = 30
      Width = 473
      Height = 120
      DataSource = dsEndereco
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnKeyDown = grdEnderecosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Title.Caption = 'Endere'#231'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 260
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Title.Caption = 'Bairro'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGOENDERECO'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DELETAR'
          Visible = False
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 400
    Width = 1030
    Height = 42
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 399
    ExplicitWidth = 1026
    object btnSalvar: TSpeedButton
      Left = 927
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
  object mtEndereco: TFDMemTable
    OnNewRecord = mtEnderecoNewRecord
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'FDMemTable1Index1'
      end>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Top = 313
    object mtEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object mtEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object mtEnderecoCODIGOENDERECO: TIntegerField
      FieldName = 'CODIGOENDERECO'
    end
    object mtEnderecoDELETAR: TBooleanField
      FieldName = 'DELETAR'
    end
  end
  object dsEndereco: TDataSource
    DataSet = mtEndereco
    Left = 32
    Top = 313
  end
end
