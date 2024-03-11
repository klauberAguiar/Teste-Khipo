unit view.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.jpeg;

type
  TLogin = class(TForm)
    Label7: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image3: TImage;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Image4: TImage;
    Image1: TImage;
    Image2: TImage;
    btnLogin: TButton;
    GroupBox1: TGroupBox;
    edtUsuario: TEdit;
    GroupBox2: TGroupBox;
    edtSenha: TEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

uses
  data.conexao, loginInterface, view.messages, controller.authentication, View.Principal;

procedure TLogin.Image4Click(Sender: TObject);
begin
  Close;
end;

procedure TLogin.btnLoginClick(Sender: TObject);
var
  LoginService: ILoginService;
  AuthController: TAuthController;
  Autenticado: Boolean;
begin
  if (edtUsuario.Text = '') or (edtSenha.Text = '') then
  begin
    TMessage.ShowMessage('Aviso', 'Usuário e senha são obrigatórios.', tmAttention);
    Exit;
  end;

  LoginService := TLoginService.Create(TConexao.GetInstancia.Conexao);
  AuthController := TAuthController.Create(LoginService);
  try
    Autenticado := AuthController.Authenticate(edtUsuario.Text, edtSenha.Text);

    if Autenticado then
    begin
      ModalResult := mrOk;
    end
    else
    begin
      TMessage.ShowMessage('Erro', 'Verifique os dados de login!', tmAttention);
    end;
  finally
    AuthController.Free;
  end;
end;
end.

