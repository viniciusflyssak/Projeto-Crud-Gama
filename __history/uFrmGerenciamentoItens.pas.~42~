unit uFrmGerenciamentoItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  System.UITypes,
  FireDAC.DApt, uDM, uFrmCadastroItens;

type
  TFrmGerenciamentoItens = class(TForm)
    grdClientes: TDBGrid;
    mtItens: TFDMemTable;
    mtItensCODIGO: TIntegerField;
    mtItensSTATUS: TStringField;
    pnlBotoes: TPanel;
    btnCancelar: TSpeedButton;
    btnCadastrar: TSpeedButton;
    btnExcluir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    mtItensDESCRICAO: TStringField;
    mtItensPRECO: TCurrencyField;
    mtItensGRUPO: TStringField;
    dsItens: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregarItens;
  public
    { Public declarations }
  end;

var
  FrmGerenciamentoItens: TFrmGerenciamentoItens;

implementation

{$R *.dfm}

procedure TFrmGerenciamentoItens.btnCadastrarClick(Sender: TObject);
var
  FrmCadastroItens: TFrmCadastroItens;
begin
  FrmCadastroItens := TFrmCadastroItens.Create(nil);
  Try
    FrmCadastroItens.ShowModal;
  Finally
    FrmCadastroItens.Free;
  End;

  carregarItens;
end;

procedure TFrmGerenciamentoItens.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmGerenciamentoItens.btnExcluirClick(Sender: TObject);
var
  qryAux: TFDQuery;
  confirmacao: Integer;
begin
  if not(mtItens.FieldByName('CODIGO').AsInteger > 0) then
  begin
    raise Exception.Create('Selecione ao menos um item!');
  end;

  confirmacao := MessageDlg('Tem certeza que deseja excluir este item?',
    mtConfirmation, [mbYes, mbNo], 0);
  if confirmacao = mrNo then
    exit;

  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := Dm.Conn;
    Dm.Conn.StartTransaction;

    try
      qryAux.SQL.Text := 'DELETE FROM ITENS WHERE CODIGO = :pCodigo';
      qryAux.Params.ParamByName('pCodigo').AsInteger :=
        mtItens.FieldByName('CODIGO').AsInteger;
      qryAux.ExecSQL;
    except
      Dm.Conn.Rollback;
    end;
    Dm.Conn.Commit;
  finally
    qryAux.Free;
  end;

  carregarItens;
end;

procedure TFrmGerenciamentoItens.carregarItens;
var
  qryAux: TFDQuery;
begin
  mtItens.Open;
  mtItens.EmptyDataSet;
  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := Dm.Conn;
    qryAux.SQL.Text :=
      'SELECT CODIGO, STATUS, DESCRICAO, PRECO, GRUPO FROM ITENS';
    qryAux.Open;

    qryAux.First;
    while not(qryAux.Eof) do
    begin
      mtItens.Append;
      mtItens.FieldByName('CODIGO').AsInteger := qryAux.FieldByName('CODIGO')
        .AsInteger;
      mtItens.FieldByName('STATUS').AsString :=
        qryAux.FieldByName('STATUS').AsString;
      mtItens.FieldByName('DESCRICAO').AsString :=
        qryAux.FieldByName('DESCRICAO').AsString;
      mtItens.FieldByName('PRECO').AsCurrency := qryAux.FieldByName('PRECO')
        .AsCurrency;
      mtItens.FieldByName('GRUPO').AsString :=
        qryAux.FieldByName('GRUPO').AsString;
      mtItens.Post;

      qryAux.Next;
    end;
  finally
    qryAux.Free;
  end;
end;

procedure TFrmGerenciamentoItens.FormShow(Sender: TObject);
begin
  carregarItens;
end;

procedure TFrmGerenciamentoItens.SpeedButton1Click(Sender: TObject);
var
  FrmCadastroItens: TFrmCadastroItens;
begin
  if not(mtItens.FieldByName('CODIGO').AsInteger > 0) then
  begin
    raise Exception.Create('Selecione ao menos um item!');
  end;

  FrmCadastroItens := TFrmCadastroItens.Create(nil);
  try
    FrmCadastroItens.idItem := mtItens.FieldByName('CODIGO').AsInteger;
    FrmCadastroItens.ShowModal;
  finally
    FrmCadastroItens.Free;
  end;

  carregarItens;
end;

end.
