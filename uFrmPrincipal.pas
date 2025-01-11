unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uDM, uFrmGerenciamentoClientes, uFrmGerenciamentoItens
  , uFrmConfiguracaoFrete, uFrmEmitirPedido;

type
  TfrmPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Itens1: TMenuItem;
    Configuraes1: TMenuItem;
    Configuraesdefret1: TMenuItem;
    Processos1: TMenuItem;
    EmissodePedido1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Itens1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Configuraesdefret1Click(Sender: TObject);
    procedure EmissodePedido1Click(Sender: TObject);
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

procedure TfrmPrincipal.Configuraesdefret1Click(Sender: TObject);
var
  FrmConfiguracaoCartaFrete: TFrmConfiguracaoFrete;
begin
  FrmConfiguracaoCartaFrete := TFrmConfiguracaoFrete.Create(nil);
  try
    FrmConfiguracaoFrete.ShowModal;
  finally
    FrmConfiguracaoCartaFrete.Free;
  end;
end;

procedure TfrmPrincipal.EmissodePedido1Click(Sender: TObject);
var
  FrmEmitirPedido: TFrmEmitirPedido;
begin
  FrmEmitirPedido := TFrmEmitirPedido.Create(nil);
  try
    FrmEmitirPedido.ShowModal;
  finally
    FrmEmitirPedido.Free;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  DM.Conn.Params.Values['CharacterSet'] := 'UTF8';
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
