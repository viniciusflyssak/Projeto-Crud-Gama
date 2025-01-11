object FrmEmitirPedido: TFrmEmitirPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Pedido'
  ClientHeight = 654
  ClientWidth = 958
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
    Width = 958
    Height = 193
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
    TabOrder = 0
    ExplicitWidth = 954
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
    object lblCliente: TLabel
      Left = 135
      Top = 24
      Width = 50
      Height = 16
      Caption = 'Cliente*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEnderecoEntrega: TLabel
      Left = 614
      Top = 24
      Width = 133
      Height = 16
      Caption = 'Endere'#231'o de entrega'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmissao: TLabel
      Left = 8
      Top = 81
      Width = 57
      Height = 16
      Caption = 'Emiss'#227'o*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrevisaoEntrega: TLabel
      Left = 200
      Top = 81
      Width = 128
      Height = 16
      Caption = 'Previs'#227'o de entrega'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 795
      Top = 81
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
    object lblObservacoes: TLabel
      Left = 8
      Top = 136
      Width = 81
      Height = 16
      Caption = 'Observa'#231#245'es'
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
      Hint = 'C'#243'digo do cliente gerado pelo sistema.'
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
      Text = 'C'#243'digo do cliente gerado pelo sistema.'
    end
    object cbEndereco: TComboBox
      Left = 614
      Top = 46
      Width = 336
      Height = 24
      Hint = 'Informe o endere'#231'o de entrega deste pedido.'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnSelect = cbEnderecoSelect
    end
    object cbCliente: TComboBox
      Left = 135
      Top = 46
      Width = 473
      Height = 24
      Hint = 'Informe o cliente do pedido.'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnSelect = cbClienteSelect
    end
    object cbStatus: TComboBox
      Left = 795
      Top = 103
      Width = 155
      Height = 24
      Hint = 'Selecione o status atual do pedido.'
      Style = csDropDownList
      Color = clSilver
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'Aberto'
      Items.Strings = (
        'Aberto'
        'Finalizado'
        'Cancelado')
    end
    object edtObservacoes: TEdit
      Left = 8
      Top = 158
      Width = 942
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object dtPrevisaoEntrega: TDateTimePicker
      Left = 200
      Top = 103
      Width = 186
      Height = 24
      Hint = 'Informe a data de previs'#227'o de entrega do pedido.'
      Date = 45666.000000000000000000
      Format = 'dd/mm/yyyy hh:mm'
      Time = 0.986722129629924900
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object dtEmissao: TDateTimePicker
      Left = 8
      Top = 103
      Width = 186
      Height = 24
      Hint = 'Informe a data de emiss'#227'o do pedido'
      Date = 45666.000000000000000000
      Format = 'dd/mm/yyyy hh:mm'
      Time = 0.986722129629924900
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
  end
  object gbItens: TGroupBox
    Left = 0
    Top = 193
    Width = 958
    Height = 336
    Align = alTop
    Caption = 'Itens'
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
    ExplicitWidth = 954
    object lblQtdeKg: TLabel
      Left = 8
      Top = 279
      Width = 127
      Height = 16
      Caption = 'Quantidade em KGs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorKG: TLabel
      Left = 191
      Top = 279
      Width = 81
      Height = 16
      Caption = 'Valor por KG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValotTotalItens: TLabel
      Left = 347
      Top = 279
      Width = 99
      Height = 16
      Caption = 'Valor total itens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grdItens: TDBGrid
      Left = 13
      Top = 22
      Width = 942
      Height = 251
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      DataSource = dsItens
      GradientEndColor = clWindow
      GradientStartColor = clWindow
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
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnKeyDown = grdItensKeyDown
      OnKeyPress = grdItensKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'ITEM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Item'
          Width = 435
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quantidade'
          Width = 151
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORUNITARIO'
          Title.Caption = 'Valor unit'#225'rio'
          Width = 150
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'VALORTOTALITEM'
          ReadOnly = True
          Title.Caption = 'Valor total item'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DELETAR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGOITEMPEDIDO'
          Visible = False
        end>
    end
    object edtQtdeKg: TEdit
      Left = 8
      Top = 301
      Width = 177
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edtQtdeKgChange
    end
    object edtValorPorKg: TEdit
      Left = 191
      Top = 301
      Width = 150
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = edtQtdeKgChange
    end
    object edtValorTotalItens: TEdit
      Left = 347
      Top = 301
      Width = 150
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
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
      TabOrder = 3
      OnChange = edtValorTotalItensChange
    end
  end
  object cbFrete: TGroupBox
    Left = 0
    Top = 529
    Width = 958
    Height = 80
    Align = alTop
    Caption = 'Frete'
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
    TabOrder = 2
    ExplicitWidth = 954
    object lblTipoFrete: TLabel
      Left = 8
      Top = 24
      Width = 86
      Height = 16
      Caption = 'Tipo de frete*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorFrete: TLabel
      Left = 191
      Top = 24
      Width = 114
      Height = 16
      Caption = 'Valor de frete (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotalPedido: TLabel
      Left = 347
      Top = 24
      Width = 141
      Height = 16
      Caption = 'Valor total pedido (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTipo: TComboBox
      Left = 8
      Top = 46
      Width = 177
      Height = 24
      Hint = 'Selecione o status atual do cliente.'
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
      TabOrder = 0
      Text = 'Nenhum'
      OnSelect = cbEnderecoSelect
      Items.Strings = (
        'Nenhum'
        'Buscar e Levar'
        'Somente Buscar'
        'Somente Levar')
    end
    object edtValorFrete: TEdit
      Left = 191
      Top = 46
      Width = 150
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edtValorTotalItensChange
    end
    object edtValorTotalPedido: TEdit
      Left = 347
      Top = 46
      Width = 150
      Height = 24
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
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
      TabOrder = 2
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 612
    Width = 958
    Height = 42
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 611
    ExplicitWidth = 954
    object btnSalvar: TSpeedButton
      Left = 855
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
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 816
    Top = 473
  end
  object mtItens: TFDMemTable
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
    Left = 872
    Top = 473
    object mtItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      OnChange = mtItensQUANTIDADEChange
    end
    object mtItensVALORUNITARIO: TCurrencyField
      FieldName = 'VALORUNITARIO'
      OnChange = mtItensQUANTIDADEChange
    end
    object mtItensVALORTOTALITEM: TCurrencyField
      FieldName = 'VALORTOTALITEM'
    end
    object mtItensDELETAR: TBooleanField
      FieldName = 'DELETAR'
    end
    object mtItensCODIGOITEMPEDIDO: TIntegerField
      FieldName = 'CODIGOITEMPEDIDO'
    end
    object mtItensITEMID: TIntegerField
      FieldName = 'ITEMID'
    end
    object mtItensITEM: TStringField
      FieldName = 'ITEM'
      OnChange = mtItensITEMChange
    end
  end
  object mtTempTable: TFDMemTable
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
    Left = 720
    Top = 481
    object FloatField1: TFloatField
      FieldName = 'QUANTIDADE'
      OnChange = mtItensQUANTIDADEChange
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'VALORUNITARIO'
      OnChange = mtItensQUANTIDADEChange
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'VALORTOTALITEM'
    end
    object BooleanField1: TBooleanField
      FieldName = 'DELETAR'
    end
    object IntegerField1: TIntegerField
      FieldName = 'CODIGOITEMPEDIDO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ITEMID'
    end
    object StringField1: TStringField
      FieldName = 'ITEM'
      OnChange = mtItensITEMChange
    end
  end
end
