unit uFrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Buttons, uDM, FireDAC.DApt;

type
  TFrmCadastroCliente = class(TForm)
    gbDadosPrincipais: TGroupBox;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTelefone: TLabel;
    lblStatus: TLabel;
    cbStatus: TComboBox;
    lblObservacoes: TLabel;
    mmoObservacoes: TMemo;
    gbEnderecos: TGroupBox;
    grdEnderecos: TDBGrid;
    mtEndereco: TFDMemTable;
    dsEndereco: TDataSource;
    mtEnderecoENDERECO: TStringField;
    mtEnderecoBAIRRO: TStringField;
    lblValorKg: TLabel;
    edtTelefone: TMaskEdit;
    edtPrecoKg: TEdit;
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    mtEnderecoCODIGOENDERECO: TIntegerField;
    mtEnderecoDELETAR: TBooleanField;
    procedure edtPrecoKgKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtEnderecoNewRecord(DataSet: TDataSet);
    procedure grdEnderecosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    idCliente: integer;
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

procedure TFrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TFrmCadastroCliente.btnSalvarClick(Sender: TObject);
  procedure salvarCliente;
  var
    qrySalvar: TFDQuery;
  begin
    qrySalvar := TFDQuery.Create(nil);
    try
      qrySalvar.Connection := DM.Conn;
      if idCliente > 0 then
      begin
        qrySalvar.SQL.Text :=
          'UPDATE CLIENTES SET STATUS = :pStatus, NOME = :pNome, TELEFONE = :pTelefone, OBSERVACOES = :pObservacoes, PRECOPORKG = :pPrecoPorKg WHERE CODIGO = :pCodigoCliente';
        qrySalvar.Params.ParamByName('pCodigoCliente').AsInteger := idCliente;
      end
      else
      begin
        qrySalvar.SQL.Text :=
          'INSERT INTO CLIENTES (CODIGO, STATUS, NOME, TELEFONE, OBSERVACOES, PRECOPORKG) VALUES (DEFAULT, :pStatus, :pNome, :pTelefone, :pObservacoes, :pPrecoPorKg)';
      end;
      qrySalvar.Params.ParamByName('pStatus').AsString :=
        cbStatus.Items[cbStatus.ItemIndex];
      qrySalvar.Params.ParamByName('pNome').AsString := edtNome.Text;
      qrySalvar.Params.ParamByName('pTelefone').AsString := edtTelefone.Text;
      qrySalvar.Params.ParamByName('pObservacoes').AsString :=
        mmoObservacoes.Lines.Text;
      qrySalvar.Params.ParamByName('pPrecoPorKg').AsCurrency :=
        StrToCurrDef(StringReplace(edtPrecoKg.Text, '.', ',',
        [rfReplaceAll]), 0);
      qrySalvar.ExecSQL;
    finally
      qrySalvar.Free;
    end;
  end;

  procedure salvarEnderecos;
  var
    qrySalvar: TFDQuery;

    function retornaUltimoCliente: integer;
    var
      qryAux: TFDQuery;
    begin
      qryAux := TFDQuery.Create(nil);
      try
        qryAux.Connection := DM.Conn;
        qryAux.SQL.Text :=
          'SELECT FIRST 1 CODIGO  FROM CLIENTES ORDER BY CODIGO DESC';
        qryAux.Open;

        qryAux.First;
        result := qryAux.FieldByName('CODIGO').AsInteger;
      finally
        qryAux.Free;
      end;
    end;

  begin
    qrySalvar := TFDQuery.Create(nil);
    try
      qrySalvar.Connection := DM.Conn;
      mtEndereco.Filtered := false;
      mtEndereco.First;
      while not mtEndereco.Eof do
      begin
        if (mtEndereco.FieldByName('DELETAR').AsBoolean and
          not(mtEndereco.FieldByName('CODIGOENDERECO').AsInteger > 0)) then
        begin
          mtEndereco.Next;
          continue;
        end;

        qrySalvar.Close;
        qrySalvar.SQL.Clear;

        if not(mtEndereco.FieldByName('DELETAR').AsBoolean) then
        begin
          if (mtEndereco.FieldByName('CODIGOENDERECO').AsInteger > 0) then
          begin
            qrySalvar.SQL.Text :=
              'UPDATE ENDERECOS SET ENDERECO = :pEndereco, BAIRRO = :pBairro WHERE CODIGOENDERECO = :pCodigoEndereco';
            qrySalvar.Params.ParamByName('pCodigoEndereco').AsInteger :=
              mtEndereco.FieldByName('CODIGOENDERECO').AsInteger;

          end
          else
          begin
            qrySalvar.SQL.Text :=
              'INSERT INTO ENDERECOS (CODIGOENDERECO, CODIGOCLIENTE, ENDERECO, BAIRRO) VALUES (DEFAULT, :pCodigoCliente, :pEndereco, :pBairro)';
            if idCliente > 0 then
            begin
              qrySalvar.Params.ParamByName('pCodigoCliente').AsInteger :=
                idCliente;
            end
            else
            begin
              qrySalvar.Params.ParamByName('pCodigoCliente').AsInteger :=
                retornaUltimoCliente;
            end;
          end;
          qrySalvar.Params.ParamByName('pEndereco').AsString :=
            mtEndereco.FieldByName('ENDERECO').AsString;
          qrySalvar.Params.ParamByName('pBairro').AsString :=
            mtEndereco.FieldByName('BAIRRO').AsString;
        end
        else
        begin
          qrySalvar.SQL.Text :=
            'DELETE FROM ENDERECOS WHERE CODIGOENDERECO = :pCodigoEndereco';
          qrySalvar.Params.ParamByName('pCodigoEndereco').AsInteger :=
            mtEndereco.FieldByName('CODIGOENDERECO').AsInteger;
        end;
        qrySalvar.ExecSQL;
        mtEndereco.Next;
      end;
    finally
      qrySalvar.Free;
    end;

  end;

begin
  if (trim(edtNome.Text) = '') then
  begin
    edtNome.SetFocus;
    raise Exception.Create('Nome deve ser informado!');
  end;

  DM.Conn.StartTransaction;
  try
    salvarCliente;
    salvarEnderecos;
  except
    DM.Conn.Rollback;
    raise Exception.Create('Erro ao salvar cliente! Tente novamente!');
  end;

  DM.Conn.Commit;

  modalResult := mrOk;
end;

procedure TFrmCadastroCliente.edtPrecoKgKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not(CharInSet(Key, ['0' .. '9', ',', '.', #8])) then
    Key := #0;

  if (CharInSet(Key, [',', '.'])) and (Pos(Key, TEdit(Sender).Text) > 0) then
    Key := #0;
end;

procedure TFrmCadastroCliente.FormCreate(Sender: TObject);
begin
  idCliente := 0;
  mtEndereco.Open;
end;

procedure TFrmCadastroCliente.FormShow(Sender: TObject);
var
  qryAux: TFDQuery;
begin
  edtCodigo.Text := '0';
  if idCliente > 0 then
  begin
    qryAux := TFDQuery.Create(nil);
    try
      qryAux.Connection := DM.Conn;
      qryAux.SQL.Text :=
        'SELECT STATUS, NOME, TELEFONE, OBSERVACOES, PRECOPORKG FROM CLIENTES WHERE CODIGO = :pCodigo';
      qryAux.Params.ParamByName('pCodigo').AsInteger := idCliente;
      qryAux.Open;
      qryAux.First;

      edtCodigo.Text := IntToStr(idCliente);
      edtNome.Text := qryAux.FieldByName('NOME').AsString;
      edtTelefone.Text := qryAux.FieldByName('TELEFONE').AsString;
      mmoObservacoes.Lines.Text := qryAux.FieldByName('OBSERVACOES').AsString;
      edtPrecoKg.Text := StringReplace(qryAux.FieldByName('PRECOPORKG')
        .AsString, '.', ',', [rfReplaceAll]);
      if qryAux.FieldByName('STATUS').AsString = 'Ativo' then      
        cbStatus.ItemIndex := 0
      else 
        cbStatus.ItemIndex := 1;

      qryAux.Close;
      qryAux.SQL.Clear;

      qryAux.SQL.Text :=
        'SELECT ENDERECO, BAIRRO, CODIGOENDERECO FROM ENDERECOS WHERE CODIGOCLIENTE = :pCodigoCliente';
      qryAux.Params.ParamByName('pCodigoCliente').AsInteger := idCliente;
      qryAux.Open;
      qryAux.First;

      mtEndereco.Open;
      mtEndereco.EmptyDataSet;

      while not(qryAux.Eof) do
      begin
        mtEndereco.Append;
        mtEndereco.FieldByName('CODIGOENDERECO').AsInteger :=
          qryAux.FieldByName('CODIGOENDERECO').AsInteger;
        mtEndereco.FieldByName('ENDERECO').AsString :=
          qryAux.FieldByName('ENDERECO').AsString;
        mtEndereco.FieldByName('BAIRRO').AsString :=
          qryAux.FieldByName('BAIRRO').AsString;
        mtEndereco.FieldByName('DELETAR').AsBoolean := false;
        mtEndereco.Post;

        qryAux.Next;
      end;
    finally
      qryAux.Free;
    end;

  end;
end;

procedure TFrmCadastroCliente.grdEnderecosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 46) then
  begin
    mtEndereco.Edit;
    mtEndereco.FieldByName('DELETAR').AsBoolean := true;
    mtEndereco.Post;

    mtEndereco.Filtered := false;
    mtEndereco.Filter := 'DELETAR = 0';
    mtEndereco.Filtered := true;
  end;
end;

procedure TFrmCadastroCliente.mtEnderecoNewRecord(DataSet: TDataSet);
begin
  mtEndereco.FieldByName('DELETAR').AsBoolean := false;
end;

end.
