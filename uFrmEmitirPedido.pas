unit uFrmEmitirPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.DApt, uDM, Vcl.ComCtrls, DateUtils;

type
  TFrmEmitirPedido = class(TForm)
    gbDadosPrincipais: TGroupBox;
    lblCodigo: TLabel;
    lblCliente: TLabel;
    lblEnderecoEntrega: TLabel;
    lblEmissao: TLabel;
    edtCodigo: TEdit;
    cbEndereco: TComboBox;
    cbCliente: TComboBox;
    lblPrevisaoEntrega: TLabel;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    lblObservacoes: TLabel;
    edtObservacoes: TEdit;
    gbItens: TGroupBox;
    grdItens: TDBGrid;
    dsItens: TDataSource;
    mtItens: TFDMemTable;
    mtItensQUANTIDADE: TFloatField;
    mtItensVALORUNITARIO: TCurrencyField;
    mtItensVALORTOTALITEM: TCurrencyField;
    mtItensDELETAR: TBooleanField;
    edtQtdeKg: TEdit;
    lblQtdeKg: TLabel;
    edtValorPorKg: TEdit;
    lblValorKG: TLabel;
    edtValorTotalItens: TEdit;
    lblValotTotalItens: TLabel;
    cbFrete: TGroupBox;
    lblTipoFrete: TLabel;
    cbTipo: TComboBox;
    edtValorFrete: TEdit;
    lblValorFrete: TLabel;
    edtValorTotalPedido: TEdit;
    lblValorTotalPedido: TLabel;
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    mtItensCODIGOITEMPEDIDO: TIntegerField;
    dtPrevisaoEntrega: TDateTimePicker;
    dtEmissao: TDateTimePicker;
    mtItensITEM: TStringField;
    mtTempTable: TFDMemTable;
    FloatField1: TFloatField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    BooleanField1: TBooleanField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbClienteSelect(Sender: TObject);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure mtItensITEMChange(Sender: TField);
    procedure mtItensQUANTIDADEChange(Sender: TField);
    procedure edtQtdeKgChange(Sender: TObject);
    procedure cbEnderecoSelect(Sender: TObject);
    procedure edtValorTotalItensChange(Sender: TObject);
  private
    { Private declarations }
    function retornaCodigo(Sender: TComboBox): integer;
  public
    { Public declarations }
    idPedido: integer;
  end;

var
  FrmEmitirPedido: TFrmEmitirPedido;

implementation

{$R *.dfm}

procedure TFrmEmitirPedido.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmEmitirPedido.btnSalvarClick(Sender: TObject);
var
  idPedidoGerado: integer;
  procedure salvarPedido;
  var
    qrySalvarPedido: TFDQuery;
  begin
    qrySalvarPedido := TFDQuery.Create(nil);
    try
      qrySalvarPedido.Connection := DM.Conn;
      qrySalvarPedido.SQL.Text :=
        'INSERT INTO PEDIDOS (CODIGOPEDIDO, STATUS, CLIENTEID, ENDERECOENTREGAID, EMISSAO, PREVISAOENTREGA, VALORTOTALPEDIDO) VALUES '
        + '(DEFAULT, :pStatus, :pClientId, :pEnderecoEntregaId, :pEmissao, :pPrevisaoEntrega, :pValorTotalPedido)';
      qrySalvarPedido.Params.ParamByName('pStatus').AsString :=
        cbStatus.Items[cbStatus.ItemIndex + 1];
      qrySalvarPedido.Params.ParamByName('pClientId').AsInteger :=
        retornaCodigo(cbCliente);
      qrySalvarPedido.Params.ParamByName('pEnderecoEntregaId').AsInteger :=
        retornaCodigo(cbEndereco);
      qrySalvarPedido.Params.ParamByName('pEmissao').AsDateTime :=
        dtEmissao.DateTime;
      qrySalvarPedido.Params.ParamByName('pPrevisaoEntrega').AsDateTime :=
        dtPrevisaoEntrega.DateTime;
      qrySalvarPedido.Params.ParamByName('pValorTotalPedido').AsCurrency :=
        StrToCurrDef(edtValorTotalPedido.Text, 0);
      qrySalvarPedido.ExecSQL;
    finally
      qrySalvarPedido.Free;
    end;
  end;

  procedure salvarItensPedido(idPedidoGerado: integer);
  var
    qrySalvarItens: TFDQuery;
  begin
    qrySalvarItens := TFDQuery.Create(nil);
    try
      qrySalvarItens.Connection := DM.Conn;
      mtItens.Filtered := false;

      mtItens.First;

      while not(mtItens.Eof) do
      begin
        if not(Trim(mtItens.FieldByName('ITEM').AsString) = '') and
          not(mtItens.FieldByName('DELETAR').AsBoolean) and
          not(mtItens.FieldByName('QUANTIDADE').AsCurrency = 0) then
        begin
          qrySalvarItens.Close;
          qrySalvarItens.SQL.Clear;
          qrySalvarItens.SQL.Text :=
            'INSERT INTO ITENSPEDIDOS (CODIGOITEMPEDIDO, CODIGOPEDIDO, ITEMID, QUANTIDADE, VALORUNITARIO, VALORTOTALITEM) VALUES '
            + '(DEFAULT, :pCodigoPedido, :pItemId, :pQuantidade, :pValorUnitario, :pValorTotalItem)';
          qrySalvarItens.Params.ParamByName('pCodigoPedido').AsInteger :=
            idPedidoGerado;
          qrySalvarItens.Params.ParamByName('pItemId').AsInteger :=
            StrToIntDef(Copy(mtItens.FieldByName('ITEM').AsString, 1,
            Pos(' -', mtItens.FieldByName('ITEM').AsString) - 1), 0);
          qrySalvarItens.Params.ParamByName('pQuantidade').AsFloat :=
            mtItens.FieldByName('QUANTIDADE').AsFloat;
          qrySalvarItens.Params.ParamByName('pValorUnitario').AsCurrency :=
            mtItens.FieldByName('VALORUNITARIO').AsCurrency;
          qrySalvarItens.Params.ParamByName('pValorTotalItem').AsCurrency :=
            mtItens.FieldByName('VALORTOTALITEM').AsCurrency;
          qrySalvarItens.ExecSQL;
        end;
        mtItens.Next;
      end;
    finally
      qrySalvarItens.Free;
    end;
  end;

  procedure salvarFretePedido(idPedidoGerado: integer);
  var
    qrySalvarFrete: TFDQuery;
  begin
    qrySalvarFrete := TFDQuery.Create(nil);
    try
      qrySalvarFrete.Connection := DM.Conn;
      qrySalvarFrete.SQL.Text :=
        'INSERT INTO FRETESPEDIDOS (CODIGOFRETE, CODIGOPEDIDO, TIPOFRETE, VALORFRETE) VALUES '
        + '(DEFAULT, :pCodigoPedido, :pTipoFrete, :pValorFrete)';
      qrySalvarFrete.Params.ParamByName('pCodigoPedido').AsInteger :=
        idPedidoGerado;
      qrySalvarFrete.Params.ParamByName('pTipoFrete').AsString :=
        cbTipo.Items[cbTipo.ItemIndex];
      qrySalvarFrete.Params.ParamByName('pValorFrete').AsCurrency :=
        StrToCurrDef(edtValorFrete.Text, 0);
      qrySalvarFrete.ExecSQL;
    finally
      qrySalvarFrete.Free;
    end;
  end;

  function retornaIdPedido: integer;
  var
    qryAux: TFDQuery;
  begin
    qryAux := TFDQuery.Create(nil);
    try
      qryAux.Connection := DM.Conn;
      qryAux.SQL.Text :=
        'SELECT FIRST 1 CODIGOPEDIDO FROM PEDIDOS ORDER BY CODIGOPEDIDO DESC';
      qryAux.Open;

      qryAux.First;
      result := qryAux.FieldByName('CODIGOPEDIDO').AsInteger;
    finally
      qryAux.Free;
    end;
  end;

begin
  if Trim(cbCliente.Items[cbCliente.ItemIndex]) = '' then
  begin
    cbCliente.SetFocus;
    raise Exception.Create('Necess�rio informar cliente!');
  end;

  if Trim(cbEndereco.Items[cbEndereco.ItemIndex]) = '' then
  begin
    cbEndereco.SetFocus;
    raise Exception.Create('Necess�rio informar endere�o!');
  end;

  if StrToCurrDef(edtValorTotalItens.Text, 0) <= 0 then
  begin
    raise Exception.Create('N�o � poss�vel finalizar venda com valor zerado!');
  end;
  DM.Conn.StartTransaction;
  try
    salvarPedido;
    idPedidoGerado := retornaIdPedido;
    if mtItens.RecordCount > 0 then
    begin
      salvarItensPedido(idPedidoGerado);
    end;
    if StrToCurrDef(edtValorFrete.Text, 0) > 0 then
    begin
      salvarFretePedido(idPedidoGerado);
    end;
  except
    DM.Conn.Rollback;
  end;

  DM.Conn.Commit;

  ModalResult := mrOk;
end;

procedure TFrmEmitirPedido.cbClienteSelect(Sender: TObject);
var
  qryAux: TFDQuery;
begin
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := DM.Conn;
    qryAux.SQL.Text :=
      'SELECT CODIGOENDERECO, ENDERECO, BAIRRO  FROM ENDERECOS WHERE CODIGOCLIENTE = :pCodigoCliente';
    qryAux.Params.ParamByName('pCodigoCliente').AsInteger :=
      retornaCodigo(cbCliente);
    qryAux.Open;

    qryAux.First;
    cbEndereco.Items.Clear;
    while not(qryAux.Eof) do
    begin
      cbEndereco.Items.Add(qryAux.FieldByName('CODIGOENDERECO').AsString + ' - '
        + qryAux.FieldByName('ENDERECO').AsString + ' | ' +
        qryAux.FieldByName('BAIRRO').AsString);
      qryAux.Next;
    end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text :=
      'SELECT PRECOPORKG FROM CLIENTES WHERE CODIGO = :pCodigo';
    qryAux.Params.ParamByName('pCodigo').AsInteger := retornaCodigo(cbCliente);
    qryAux.Open;
    qryAux.First;
    if qryAux.FieldByName('PRECOPORKG').AsCurrency > 0 then
    begin
      mtItens.EmptyDataSet;
      grdItens.Enabled := false;
      edtQtdeKg.Enabled := true;
      edtValorPorKg.Enabled := true;

      grdItens.TitleFont.Color := clWindowFrame;
      edtQtdeKg.Color := clWindow;
      edtValorPorKg.Color := clWindow;

      edtValorPorKg.Text := qryAux.FieldByName('PRECOPORKG').AsString;
      edtQtdeKg.Text := '1';
    end
    else
    begin
      edtQtdeKg.Text := '';
      edtValorPorKg.Text := '';

      grdItens.Enabled := true;
      edtQtdeKg.Enabled := false;
      edtValorPorKg.Enabled := false;

      grdItens.TitleFont.Color := clWindowText;
      edtQtdeKg.Color := clSilver;
      edtValorPorKg.Color := clSilver;
    end;

    cbEndereco.ItemIndex := 0;
  finally
    qryAux.Free;
  end;

  cbEnderecoSelect(nil);
end;

procedure TFrmEmitirPedido.cbEnderecoSelect(Sender: TObject);
var
  qryAux: TFDQuery;
  bairro: string;
begin
  bairro := '';
  if cbTipo.ItemIndex = 0 then
  begin
    Exit;
  end;

  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := DM.Conn;
    qryAux.SQL.Text :=
      'SELECT BAIRRO FROM ENDERECOS WHERE CODIGOENDERECO = :pCodigo';
    qryAux.Params.ParamByName('pCodigo').AsInteger := retornaCodigo(cbEndereco);
    qryAux.Open;

    qryAux.First;

    bairro := qryAux.FieldByName('BAIRRO').AsString;

    qryAux.Close;
    qryAux.SQL.Clear;

    qryAux.SQL.Text :=
      'SELECT VALORFRETE FROM FRETES WHERE TIPOFRETE = :pTipo AND BAIRRO = :pBairro';
    qryAux.Params.ParamByName('pTipo').AsString :=
      cbTipo.Items[cbTipo.ItemIndex];
    qryAux.Params.ParamByName('pBairro').AsString := bairro;
    qryAux.Open;

    if qryAux.RecordCount = 0 then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;

      qryAux.SQL.Text :=
        'SELECT VALORFRETE FROM FRETES WHERE TIPOFRETE = :pTipo AND BAIRRO = ''''';
      qryAux.Params.ParamByName('pTipo').AsString :=
        cbTipo.Items[cbTipo.ItemIndex];
      qryAux.Open;
    end;
    qryAux.First;

    if (qryAux.RecordCount = 0) then
    begin
      Exit;
    end;

    edtValorFrete.Text := FormatFloat('0.00#,##',
      qryAux.FieldByName('VALORFRETE').AsCurrency);

  finally
    qryAux.Free;
  end;
end;

procedure TFrmEmitirPedido.edtQtdeKgChange(Sender: TObject);
begin
  edtValorPorKg.Text := FormatFloat('#,##0.00',
    StrToCurrDef(edtValorPorKg.Text, 0));
  edtValorTotalItens.Text := FormatFloat('#,##0.00',
    StrToCurrDef(edtQtdeKg.Text, 0) * StrToCurrDef(edtValorPorKg.Text, 0));
end;

procedure TFrmEmitirPedido.edtValorTotalItensChange(Sender: TObject);
begin
  edtValorTotalPedido.Text := FormatFloat('#,##0.00',
    (StrToCurrDef(edtValorTotalItens.Text, 0) +
    StrToCurrDef(edtValorFrete.Text, 0)));
end;

procedure TFrmEmitirPedido.FormCreate(Sender: TObject);
begin
  idPedido := 0;
end;

procedure TFrmEmitirPedido.FormShow(Sender: TObject);
var
  qryAux: TFDQuery;
begin
  edtCodigo.Text := IntToStr(idPedido);
  mtItens.Open;
  mtTempTable.Open;
  dtPrevisaoEntrega.DateTime := Now;
  dtEmissao.DateTime := Now;
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := DM.Conn;
    qryAux.SQL.Text :=
      'SELECT CODIGO, NOME FROM CLIENTES WHERE STATUS = ''Ativo''';
    qryAux.Open;
    qryAux.First;

    if qryAux.RecordCount = 0 then
    begin
      raise Exception.Create('Cadastre ao menos uma entidade!');
      ModalResult := mrCancel;
    end;

    cbCliente.Items.Clear;
    while not(qryAux.Eof) do
    begin
      cbCliente.Items.Add(qryAux.FieldByName('CODIGO').AsString + ' - ' +
        qryAux.FieldByName('NOME').AsString);
      qryAux.Next;
    end;

    cbCliente.ItemIndex := 0;
    cbClienteSelect(Sender);

    qryAux.Close;
    qryAux.SQL.Clear;

    qryAux.SQL.Text :=
      'SELECT CODIGO, DESCRICAO FROM ITENS WHERE STATUS = ''Ativo''';
    qryAux.Open;

    if qryAux.RecordCount = 0 then
    begin
      raise Exception.Create('Cadastre ao menos um item!');
      ModalResult := mrCancel;
    end;

    qryAux.First;

    grdItens.Columns[0].PickList.Clear;
    while not(qryAux.Eof) do
    begin
      grdItens.Columns[0].PickList.Add(qryAux.FieldByName('CODIGO').AsString +
        ' - ' + qryAux.FieldByName('DESCRICAO').AsString);
      qryAux.Next;
    end;

  finally
    qryAux.Free;
  end;

end;

procedure TFrmEmitirPedido.grdItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46) then
  begin
    mtItens.Edit;
    mtItens.FieldByName('DELETAR').AsBoolean := true;
    mtItens.Post;

    mtItens.Filtered := false;
    mtItens.Filter := 'DELETAR = 0';
    mtItens.Filtered := true;
  end;
end;

procedure TFrmEmitirPedido.grdItensKeyPress(Sender: TObject; var Key: Char);
begin
  if grdItens.SelectedField = mtItensITEM then
    Key := #0;

  if (grdItens.SelectedField = mtItensQUANTIDADE) or
    (grdItens.SelectedField = mtItensVALORUNITARIO) then
  begin
    if not(CharInSet(Key, ['0' .. '9', ',', '.', #8])) then
      Key := #0;
  end;
end;

procedure TFrmEmitirPedido.mtItensITEMChange(Sender: TField);
var
  qryAux: TFDQuery;
begin
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := DM.Conn;
    qryAux.SQL.Text := 'SELECT PRECO FROM ITENS WHERE CODIGO = :pCodigo';
    qryAux.Params.ParamByName('pCodigo').AsInteger :=
      StrToIntDef(Copy(Sender.Value, 1, Pos(' -', Sender.Value) - 1), 0);
    qryAux.Open;
    qryAux.First;

    mtItensVALORUNITARIO.Value := qryAux.FieldByName('PRECO').AsCurrency;
    mtItensQUANTIDADE.Value := 1;
    mtItensVALORTOTALITEM.Value := qryAux.FieldByName('PRECO').AsCurrency;
  finally
    qryAux.Free;
  end;
end;

procedure TFrmEmitirPedido.mtItensQUANTIDADEChange(Sender: TField);
var
  total: Currency;
begin
  total := 0;
  mtItensVALORTOTALITEM.Value := mtItensVALORUNITARIO.Value *
    mtItensQUANTIDADE.Value;
  mtTempTable := mtItens;
  mtTempTable.First;

  while not(mtTempTable.Eof) do
  begin
    total := total + mtTempTable.FieldByName('VALORTOTALITEM').AsCurrency;
    mtTempTable.Next;
  end;
  edtValorTotalItens.Text := FormatFloat('#,##0.00', total);
  mtItens.Edit;
end;

function TFrmEmitirPedido.retornaCodigo(Sender: TComboBox): integer;
begin
  result := StrToIntDef(Copy(Sender.Items[Sender.ItemIndex], 1,
    Pos(' -', Sender.Items[Sender.ItemIndex]) - 1), 0);
end;

end.
