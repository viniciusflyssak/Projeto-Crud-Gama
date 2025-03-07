object FrmConfiguracaoFrete: TFrmConfiguracaoFrete
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Frete'
  ClientHeight = 365
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object gbValorTipoBairro: TGroupBox
    Left = 0
    Top = 0
    Width = 628
    Height = 321
    Align = alTop
    Caption = 'Valor por tipo por bairro'
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
    object grdValorTipoBairro: TDBGrid
      Left = 2
      Top = 21
      Width = 624
      Height = 298
      Hint = 'Informe o pre'#231'o por KG de roupas cobrados para este cliente.'
      Align = alClient
      DataSource = dsValorTipoBairro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnKeyDown = grdValorTipoBairroKeyDown
      OnKeyPress = grdValorTipoBairroKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPOFRETE'
          PickList.Strings = (
            'Nenhum'
            'Buscar e Levar'
            'Somente Buscar'
            'Somente Levar')
          Title.Caption = 'Tipo de frete'
          Width = 156
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
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORFRETE'
          Title.Caption = 'Valor de frete'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGOFRETE'
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
    Top = 323
    Width = 628
    Height = 42
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -402
    ExplicitTop = 400
    ExplicitWidth = 1030
    object btnSalvar: TSpeedButton
      Left = 525
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
  object dsValorTipoBairro: TDataSource
    DataSet = mtValorTipoBairro
    Left = 584
    Top = 121
  end
  object mtValorTipoBairro: TFDMemTable
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
    Left = 592
    Top = 193
    object mtValorTipoBairroCODIGOFRETE: TIntegerField
      FieldName = 'CODIGOFRETE'
    end
    object mtValorTipoBairroTIPOFRETE: TStringField
      FieldName = 'TIPOFRETE'
    end
    object mtValorTipoBairroBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object mtValorTipoBairroDELETAR: TBooleanField
      FieldName = 'DELETAR'
    end
    object mtValorTipoBairroVALORFRETE: TCurrencyField
      FieldName = 'VALORFRETE'
    end
  end
end
