unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uFrmGerenciamentoClientes, uFrmGerenciamentoItens;

type
  TfrmPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Itens1: TMenuItem;
    Configuraes1: TMenuItem;
    Configuraesdefret1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Itens1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
var
  frmGerenciamentoClientes: TFrmGerenciamentoClientes;
begin
  frmGerenciamentoClientes := TFrmGerenciamentoClientes.Create(nil);
  try
    frmGerenciamentoClientes.ShowModal;
  finally
    frmGerenciamentoClientes.Free;
  end;
end;

procedure TfrmPrincipal.Itens1Click(Sender: TObject);
var
  FrmGerenciamentoItens: TFrmGerenciamentoItens;
begin
  FrmGerenciamentoItens := TFrmGerenciamentoItens.Create(nil);
  try
    FrmGerenciamentoItens.ShowModal;
  finally
    FrmGerenciamentoItens.Free;
  end;
end;

end.
