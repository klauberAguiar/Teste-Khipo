unit teste.conexao;

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
  TTesteConexao = class(TObject)
  private
    FConexao: TFDConnection;
    Conexao: TConexao;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure TesteConectar;
    [Test]
    procedure TesteFalhaConectar;
  end;

implementation

procedure TTesteConexao.Setup;
begin
  FConexao := TConexao.GetInstancia.Conexao;
  Conexao := TConexao.GetInstancia;
end;

procedure TTesteConexao.TesteConectar;
begin
  Conexao.Conectar;
  Assert.IsTrue(Conexao.Conexao.Connected, 'A conexão esta ativa!');
end;

procedure TTesteConexao.TesteFalhaConectar;
begin
  Conexao.Conexao.Close;
  Assert.IsFalse(Conexao.Conexao.Connected, 'A conexão esta inativa!');
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteConexao);
end.

