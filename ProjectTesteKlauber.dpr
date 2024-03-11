program ProjectTesteKlauber;

uses
  Vcl.Forms,
  Vcl.Controls,
  view.login in 'View\view.login.pas' {Login},
  data.conexao in 'Data\data.conexao.pas',
  view.messages in 'View\view.messages.pas' {Message},
  controller.authentication in 'Controller\controller.authentication.pas',
  view.principal in 'View\view.principal.pas' {FormPrincipal},
  view.cadastro in 'View\view.cadastro.pas' {FormCadastro},
  presenter.cadastro in 'Presenter\presenter.cadastro.pas',
  repository.produto in 'Repository\repository.produto.pas',
  view.cadastro.produto in 'View\view.cadastro.produto.pas' {FormProdutos},
  repository.categoria in 'Repository\repository.categoria.pas',
  view.movimentacao.estoque in 'View\view.movimentacao.estoque.pas' {FormMovimentacaoEstoque},
  repository.movimentacao.estoque in 'Repository\repository.movimentacao.estoque.pas',
  CadastroInterface in 'Interface\CadastroInterface.pas',
  loginInterface in 'Interface\loginInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TLogin, Login);
  if Login.ShowModal = mrOk then
  begin
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;
end.
