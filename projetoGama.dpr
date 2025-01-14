program projetoGama;



uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroCliente in 'uFrmCadastroCliente.pas' {FrmCadastroCliente},
  uDM in 'DM\uDM.pas' {DM},
  uFrmGerenciamentoClientes in 'uFrmGerenciamentoClientes.pas' {FrmGerenciamentoClientes},
  uFrmCadastroItens in 'uFrmCadastroItens.pas' {FrmCadastroItens},
  uFrmGerenciamentoItens in 'uFrmGerenciamentoItens.pas' {FrmGerenciamentoItens},
  uFrmConfiguracaoFrete in 'uFrmConfiguracaoFrete.pas' {FrmConfiguracaoFrete},
  uFrmEmitirPedido in 'uFrmEmitirPedido.pas' {FrmEmitirPedido},
  uFrmGerenciamentoPedidos in 'uFrmGerenciamentoPedidos.pas' {FrmGerenciamentoPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TFrmCadastroCliente, FrmCadastroCliente);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmGerenciamentoClientes, FrmGerenciamentoClientes);
  Application.CreateForm(TFrmCadastroItens, FrmCadastroItens);
  Application.CreateForm(TFrmGerenciamentoItens, FrmGerenciamentoItens);
  Application.CreateForm(TFrmConfiguracaoFrete, FrmConfiguracaoFrete);
  Application.CreateForm(TFrmEmitirPedido, FrmEmitirPedido);
  Application.CreateForm(TFrmGerenciamentoPedidos, FrmGerenciamentoPedidos);
  Application.Run;
end.
