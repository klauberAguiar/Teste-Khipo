unit teste.login;

interface

uses
  DUnitX.TestFramework,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Stan.Def,
  FireDAC.DApt,
  loginInterface,
  data.conexao;

type

  [TestFixture]
  TLoginServiceTest = class(TObject)
  private
    FLoginService: ILoginService;
    FConexao: TFDConnection;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure TestAuthenticateUser_ValidCredentials_ReturnsTrue;
    [Test]
    procedure TestAuthenticateUser_InvalidCredentials_ReturnsFalse;
  end;

implementation

procedure TLoginServiceTest.Setup;
begin
  FConexao := TConexao.GetInstancia.Conexao;
  FLoginService := TLoginService.Create(FConexao);
end;

procedure TLoginServiceTest.TestAuthenticateUser_ValidCredentials_ReturnsTrue;
begin
  Assert.IsTrue(FLoginService.AuthenticateUser('ADMINISTRADOR', '123456'));
end;

procedure TLoginServiceTest.TestAuthenticateUser_InvalidCredentials_ReturnsFalse;
begin
  Assert.IsFalse(FLoginService.AuthenticateUser('ADMINISTRADOR', '654321'));
end;

initialization
  TDUnitX.RegisterTestFixture(TLoginServiceTest);
end.

