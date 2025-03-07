unit uFrmGerenciamentoClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uDM,
  FireDAC.DApt, uFrmCadastroCliente, System.UITypes;

type
  TFrmGerenciamentoClientes = class(TForm)
    pnlBotoes: TPanel;
    btnFechar: TSpeedButton;
    btnCadastrar: TSpeedButton;
    btnExcluir: TSpeedButton;
    grdClientes: TDBGrid;
    mtClientes: TFDMemTable;
    dsClientes: TDataSource;
    mtClientesCODIGO: TIntegerField;
    mtClientesNOME: TStringField;
    mtClientesSTATUS: TStringField;
    mtClientesTELEFONE: TStringField;
    mtClientesPRECOPORKG: TCurrencyField;
    SpeedButton1: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure carregarClientes;
  public
    { Public declarations }
  end;

var
  FrmGerenciamentoClientes: TFrmGerenciamentoClientes;

implementation

{$R *.dfm}

procedure TFrmGerenciamentoClientes.btnCadastrarClick(Sender: TObject);
var
  FrmCadastroCliente: TFrmCadastroCliente;
begin
  FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
  try
    FrmCadastroCliente.ShowModal;
  finally
    FrmCadastroCliente.Free;
  end;

  carregarClientes;
end;

procedure TFrmGerenciamentoClientes.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmGerenciamentoClientes.btnExcluirClick(Sender: TObject);
var
  qryAux: TFDQuery;
  confirmacao: Integer;
begin
  if not(mtClientes.FieldByName('CODIGO').AsInteger > 0) then
  begin
    raise Exception.Create('Selecione ao menos um cliente!');
  end;

  confirmacao := MessageDlg('Tem certeza que deseja excluir este cliente?',
    mtConfirmation, [mbYes, mbNo], 0);
  if confirmacao = mrNo then
    exit;

  qryAux := TFDQuery.Create(nil);
  try
    qryAux.Connection := Dm.Conn;
    Dm.Conn.StartTransaction;

    try
      qryAux.SQL.Text :=
        'DELETE FROM ENDERECOS WHERE CODIGOCLIENTE = :pCodigoCliente';
      qryAux.Params.ParamByName('pCodigoCliente').AsInteger :=
        mtClientes.FieldByName('CODIGO').AsInteger;
      qryAux.ExecSQL;

      qryAux.Close;
      qryAux.SQL.Clear;

      qryAux.SQL.Text := 'DELETE FROM CLIENTES WHERE CODIGO = :pCodigo';
      qryAux.Params.ParamByName('pCodigo').AsInteger :=
        mtClientes.FieldByName('CODIGO').AsInteger;
      qryAux.ExecSQL;
    except
      Dm.Conn.Rollback;
    end;
    Dm.Conn.Commit;
  finally
    qryAux.Free;
  end;
  carregarClientes;
end;

procedure TFrmGerenciamentoClientes.carregarClientes;
var
  qryCarregarClientes: TFDQuery;
begin
  mtClientes.Open;
  mtClientes.EmptyDataSet;
  qryCarregarClientes := TFDQuery.Create(nil);
  try
    qryCarregarClientes.Connection := Dm.Conn;
    qryCarregarClientes.SQL.Text :=
      'SELECT CODIGO, STATUS, NOME, TELEFONE, PRECOPORKG FROM CLIENTES;';
    qryCarregarClientes.Open;

    qryCarregarClientes.First;
    while not(qryCarregarClientes.Eof) do
    begin
      mtClientes.Append;
      mtClientes.FieldByName('CODIGO').AsInteger :=
        qryCarregarClientes.FieldByName('CODIGO').AsInteger;
      mtClientes.FieldByName('STATUS').AsString :=
        qryCarregarClientes.FieldByName('STATUS').AsString;
      mtClientes.FieldByName('NOME').AsString := qryCarregarClientes.FieldByName
        ('NOME').AsString;

      mtClientes.FieldByName('TELEFONE').AsString :=
        qryCarregarClientes.FieldByName('TELEFONE').AsString;
      mtClientes.FieldByName('PRECOPORKG').AsCurrency :=
        qryCarregarClientes.FieldByName('PRECOPORKG').AsCurrency;
      mtClientes.Post;
      qryCarregarClientes.Next;
    end;
  finally
    qryCarregarClientes.Free;
  end;
end;

procedure TFrmGerenciamentoClientes.FormShow(Sender: TObject);
begin
  carregarClientes;
end;

procedure TFrmGerenciamentoClientes.SpeedButton1Click(Sender: TObject);
var
  FrmCadastroCliente: TFrmCadastroCliente;
begin
  if not(mtClientes.FieldByName('CODIGO').AsInteger > 0) then
  begin
    raise Exception.Create('Selecione ao menos um cliente!');
  end;

  FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
  try
    FrmCadastroCliente.idCliente := mtClientes.FieldByName('CODIGO').AsInteger;
    FrmCadastroCliente.ShowModal;
  finally
    FrmCadastroCliente.Free;
  end;

  carregarClientes;
end;

end.
