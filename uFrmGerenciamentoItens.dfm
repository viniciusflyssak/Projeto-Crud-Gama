object FrmGerenciamentoItens: TFrmGerenciamentoItens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerenciamento de itens'
  ClientHeight = 442
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object grdClientes: TDBGrid
    Left = 0
    Top = 0
    Width = 660
    Height = 401
    Align = alClient
    DataSource = dsItens
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 254
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO'
        Title.Caption = 'Grupo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 62
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 401
    Width = 660
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 400
    ExplicitWidth = 656
    object btnFechar: TSpeedButton
      Left = 1
      Top = 1
      Width = 102
      Height = 39
      Align = alLeft
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharClick
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnCadastrar: TSpeedButton
      Left = 557
      Top = 1
      Width = 102
      Height = 39
      Align = alRight
      Caption = 'Cadastrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCadastrarClick
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnExcluir: TSpeedButton
      Left = 353
      Top = 1
      Width = 102
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExcluirClick
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object SpeedButton1: TSpeedButton
      Left = 455
      Top = 1
      Width = 102
      Height = 39
      Align = alRight
      Caption = 'Editar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
      ExplicitLeft = 688
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object mtItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 328
    object mtItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object mtItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object mtItensPRECO: TCurrencyField
      FieldName = 'PRECO'
    end
    object mtItensGRUPO: TStringField
      FieldName = 'GRUPO'
    end
    object mtItensSTATUS: TStringField
      FieldName = 'STATUS'
    end
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 504
    Top = 328
  end
end
