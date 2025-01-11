unit uFrmCadastroItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uDM, FireDAC.DApt, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFrmCadastroItens = class(TForm)
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    gbDadosPrincipais: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblObservacoes: TLabel;
    lblPreco: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    mmoObservacoes: TMemo;
    edtPreco: TEdit;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    cbGrupos: TComboBox;
    lblGrupo: TLabel;
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idItem: integer;
  end;

var
  FrmCadastroItens: TFrmCadastroItens;

implementation

{$R *.dfm}

procedure TFrmCadastroItens.btnCancelarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TFrmCadastroItens.btnSalvarClick(Sender: TObject);
  procedure validarCampos;
  begin
    if Trim(edtDescricao.Text) = '' then
    begin
      edtDescricao.SetFocus;
      raise Exception.Create('Necessário informar descrição do produto!');
    end;

    if StrToCurrDef(StringReplace(edtPreco.Text, '.', ',', [rfReplaceAll]),
      0) <= 0 then
    begin
      edtPreco.SetFocus;
      raise Exception.Create('Necessário informar um valor para o produto!');
    end;
  end;

  procedure salvarItem;
  var
    qrySalvar: TFDQuery;
  begin
    qrySalvar := TFDQuery.Create(nil);
    try
      qrySalvar.Connection := dm.Conn;
      if idItem > 0 then
      begin
        qrySalvar.SQL.Text :=
          'UPDATE ITENS SET STATUS = :pStatus, DESCRICAO = :pDescricao, PRECO = :pPreco, GRUPO = :pGrupo WHERE CODIGO = :pCodigo';
        qrySalvar.Params.ParamByName('pCodigo').AsInteger := idItem;
      end
      else
      begin
        qrySalvar.SQL.Text :=
          'INSERT INTO ITENS (CODIGO, STATUS, DESCRICAO, PRECO, GRUPO) VALUES (DEFAULT, :pStatus, :pDescricao, :pPreco, :pGrupo)';
      end;
      qrySalvar.Params.ParamByName('pStatus').AsString :=
        cbStatus.Items[cbStatus.ItemIndex];
      qrySalvar.Params.ParamByName('pDescricao').AsString := edtDescricao.Text;
      qrySalvar.Params.ParamByName('pPreco').AsCurrency :=
        StrToCurrDef(StringReplace(edtPreco.Text, '.', ',', [rfReplaceAll]), 0);
      qrySalvar.Params.ParamByName('pGrupo').AsString :=
        cbGrupos.Items[cbGrupos.ItemIndex];
      qrySalvar.ExecSQL;
    finally
      qrySalvar.Free;
    end;
  end;

begin
  validarCampos;

  dm.Conn.StartTransaction;
  try
    salvarItem;
  except
    dm.Conn.Rollback;
  end;
  dm.Conn.commit;

  modalResult := mrOK;
end;

procedure TFrmCadastroItens.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(Key, ['0' .. '9', ',', '.', #8])) then
    Key := #0;

  if (CharInSet(Key, [',', '.'])) and (Pos(Key, TEdit(Sender).Text) > 0) then
    Key := #0;
end;

procedure TFrmCadastroItens.FormCreate(Sender: TObject);
begin
  idItem := 0;
end;

procedure TFrmCadastroItens.FormShow(Sender: TObject);
var
  qryAux: TFDQuery;
  I: integer;
begin
  edtCodigo.Text := IntToStr(idItem);
  if idItem > 0 then
  begin
    qryAux := TFDQuery.Create(nil);
    try
      qryAux.Connection := dm.Conn;
      qryAux.SQL.Text :=
        'SELECT STATUS, DESCRICAO, PRECO, GRUPO FROM ITENS WHERE CODIGO = :pCodigo';
      qryAux.Params.ParamByName('pCodigo').AsInteger := idItem;
      qryAux.Open;

      qryAux.First;
      edtDescricao.Text := qryAux.FieldByName('DESCRICAO').AsString;
      edtPreco.Text := StringReplace(qryAux.FieldByName('PRECO').AsString, '.',
        ',', [rfReplaceAll]);
      if qryAux.FieldByName('STATUS').AsString = 'Ativo' then
        cbStatus.ItemIndex := 0
      else
        cbStatus.ItemIndex := 1;

      for I := 0 to cbGrupos.Items.Count - 1 do
      begin
        if cbGrupos.Items[I] = qryAux.FieldByName('GRUPO').AsString then
        begin
          cbGrupos.ItemIndex := I;
        end;
      end;
    finally
      qryAux.Free;
    end;
  end;
end;

end.
