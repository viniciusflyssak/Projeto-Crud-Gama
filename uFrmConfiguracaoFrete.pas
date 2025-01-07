unit uFrmConfiguracaoFrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls, uDM,
  FireDAC.DApt;

type
  TFrmConfiguracaoFrete = class(TForm)
    gbValorTipoBairro: TGroupBox;
    grdValorTipoBairro: TDBGrid;
    dsValorTipoBairro: TDataSource;
    mtValorTipoBairro: TFDMemTable;
    mtValorTipoBairroBAIRRO: TStringField;
    mtValorTipoBairroDELETAR: TBooleanField;
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    mtValorTipoBairroCODIGOFRETE: TIntegerField;
    mtValorTipoBairroTIPOFRETE: TStringField;
    mtValorTipoBairroVALORFRETE: TCurrencyField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdValorTipoBairroKeyPress(Sender: TObject; var Key: Char);
    procedure grdValorTipoBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguracaoFrete: TFrmConfiguracaoFrete;

implementation

{$R *.dfm}

procedure TFrmConfiguracaoFrete.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmConfiguracaoFrete.btnSalvarClick(Sender: TObject);
  procedure salvarFretes;
  var
    qrySalvar: TFDQuery;
  begin
    mtValorTipoBairro.Filtered := false;
    mtValorTipoBairro.First;
    qrySalvar := TFDQuery.Create(nil);
    try
      qrySalvar.Connection := DM.Conn;
      while not(mtValorTipoBairro.Eof) do
      begin
        qrySalvar.Close;
        qrySalvar.SQL.Clear;
        if mtValorTipoBairro.FieldByName('CODIGOFRETE').AsInteger > 0 then
        begin
          if mtValorTipoBairro.FieldByName('DELETAR').AsBoolean then
          begin
            qrySalvar.SQL.Text :=
              'DELETE FROM FRETES WHERE CODIGOFRETE = :pCodigoFrete';
          end
          else
          begin
            qrySalvar.SQL.Text :=
              'UPDATE FRETES SET TIPOFRETE = :pTipoFrete, BAIRRO = :pBairro, VALORFRETE = :pValorFrete WHERE CODIGOFRETE = :pCodigoFrete';
          end;
          qrySalvar.Params.ParamByName('pCodigoFrete').AsInteger :=
            mtValorTipoBairro.FieldByName('CODIGOFRETE').AsInteger;
        end
        else
        begin
          qrySalvar.SQL.Text :=
            'INSERT INTO FRETES (CODIGOFRETE, TIPOFRETE, BAIRRO, VALORFRETE) VALUES (DEFAULT, :pTipoFrete, :pBairro, :pValorFrete)'
        end;
        if not(mtValorTipoBairro.FieldByName('DELETAR').AsBoolean) then
        begin
          qrySalvar.Params.ParamByName('pTipoFrete').AsString :=
            mtValorTipoBairro.FieldByName('TIPOFRETE').AsString;
          qrySalvar.Params.ParamByName('pBairro').AsString :=
            mtValorTipoBairro.FieldByName('BAIRRO').AsString;
          qrySalvar.Params.ParamByName('pValorFrete').AsCurrency :=
            mtValorTipoBairro.FieldByName('VALORFRETE').AsCurrency;
        end;
        qrySalvar.ExecSQL;

        mtValorTipoBairro.Next;
      end;
    finally
      qrySalvar.Free;
    end;
  end;

begin
  mtValorTipoBairro.First;
  while not(mtValorTipoBairro.Eof) do
  begin
    if Trim(mtValorTipoBairro.FieldByName('TIPOFRETE').AsString) = '' then
    begin
      raise Exception.Create('Necessário informar o tipo do frete!');
    end;
    mtValorTipoBairro.Next;
  end;

  DM.Conn.StartTransaction;
  try
    salvarFretes
  except
    DM.Conn.Rollback;
  end;

  DM.Conn.Commit;
  ModalResult := mrOk;
end;

procedure TFrmConfiguracaoFrete.FormShow(Sender: TObject);
var
  qryAux: TFDQuery;
begin
  mtValorTipoBairro.Open;
  mtValorTipoBairro.EmptyDataSet;
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := DM.Conn;
    qryAux.SQL.Text :=
      'SELECT CODIGOFRETE, TIPOFRETE, BAIRRO, VALORFRETE FROM FRETES';
    qryAux.Open;

    qryAux.First;

    while not(qryAux.Eof) do
    begin
      mtValorTipoBairro.Append;
      mtValorTipoBairro.FieldByName('CODIGOFRETE').AsInteger :=
        qryAux.FieldByName('CODIGOFRETE').AsInteger;
      mtValorTipoBairro.FieldByName('TIPOFRETE').AsString :=
        qryAux.FieldByName('TIPOFRETE').AsString;
      mtValorTipoBairro.FieldByName('BAIRRO').AsString :=
        qryAux.FieldByName('BAIRRO').AsString;
      mtValorTipoBairro.FieldByName('VALORFRETE').AsCurrency :=
        qryAux.FieldByName('VALORFRETE').AsCurrency;
      mtValorTipoBairro.FieldByName('DELETAR').AsBoolean := false;
      mtValorTipoBairro.Post;
      qryAux.Next;
    end;
  finally
    qryAux.Free;
  end;
end;

procedure TFrmConfiguracaoFrete.grdValorTipoBairroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 46) then
  begin
    mtValorTipoBairro.Edit;
    mtValorTipoBairro.FieldByName('DELETAR').AsBoolean := true;
    mtValorTipoBairro.Post;

    mtValorTipoBairro.Filtered := false;
    mtValorTipoBairro.Filter := 'DELETAR = 0';
    mtValorTipoBairro.Filtered := true;
  end;
end;

procedure TFrmConfiguracaoFrete.grdValorTipoBairroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if grdValorTipoBairro.SelectedField = mtValorTipoBairroTIPOFRETE then
    Key := #0;

  if grdValorTipoBairro.SelectedField = mtValorTipoBairroVALORFRETE then
  begin
    if not(CharInSet(Key, ['0' .. '9', ',', '.', #8])) then
      Key := #0;
  end;
end;

end.
