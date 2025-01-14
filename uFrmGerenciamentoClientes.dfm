object FrmGerenciamentoClientes: TFrmGerenciamentoClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerenciamento de Clientes'
  ClientHeight = 442
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 401
    Width = 658
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 400
    ExplicitWidth = 654
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
      Left = 555
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
      Left = 351
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
      Left = 453
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
  object grdClientes: TDBGrid
    Left = 0
    Top = 0
    Width = 658
    Height = 401
    Align = alClient
    DataSource = dsClientes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOPORKG'
        Title.Caption = 'Pre'#231'o por KG'
        Width = 99
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
  object mtClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 328
    object mtClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object mtClientesNOME: TStringField
      FieldName = 'NOME'
    end
    object mtClientesSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object mtClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object mtClientesPRECOPORKG: TCurrencyField
      FieldName = 'PRECOPORKG'
    end
  end
  object dsClientes: TDataSource
    DataSet = mtClientes
    Left = 504
    Top = 328
  end
end
