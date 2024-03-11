unit teste.form.produtos;

interface

uses
  DUnitX.TestFramework, view.cadastro.produto, System.SysUtils, FireDAC.Comp.Client,
  data.conexao, FireDAC.Stan.Param, FireDAC.DApt, Vcl.Forms, repository.produto,
  presenter.cadastro;

type
  [TestFixture]
  TestTFormProdutos = class(TObject)
  strict private
    FFormProdutos: TFormProdutos;
    FProdutoRepository: TProdutoRepository;
    FPresenter: TCadastroPresenter;
    FQuery: TFDQuery;
    FConexao: TFDConnection;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;
  published
    [Test]
    procedure TesteBotoesAposNovo;
    [Test]
    procedure TesteSalvarProduto;
  end;

implementation

procedure TestTFormProdutos.SetUp;
var
  ProdutoRepository : TProdutoRepository;
begin
  FConexao := TConexao.GetInstancia.Conexao;
  FProdutoRepository := TProdutoRepository.Create(FConexao);
  ProdutoRepository := TProdutoRepository.Create(TConexao.GetInstancia.Conexao);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  FQuery.SQL.Text := ProdutoRepository.GetAll.SQL.Text;
  FQuery.Open;
  FQuery.BeforePost := FormProdutos.FDQueryBeforePost;
  FPresenter := TCadastroPresenter.Create(nil, FQuery);
  FFormProdutos := TFormProdutos.Create(Application, FPresenter, FQuery);
end;

procedure TestTFormProdutos.TearDown;
begin
  FreeAndNil(FFormProdutos);
  FreeAndNil(FQuery);
  FreeAndNil(FProdutoRepository);
end;

procedure TestTFormProdutos.TesteBotoesAposNovo;
begin
  FFormProdutos.btnNovoClick(Self);
  Assert.IsFalse(FFormProdutos.btnNovo.Enabled, 'btnNovo deve estar desabilitado após clicar em Novo');
  Assert.IsTrue(FFormProdutos.btnSalvar.Enabled, 'btnSalvar deve estar habilitado após clicar em Novo');
  Assert.IsTrue(FFormProdutos.btnCancelar.Enabled, 'btnCancelar deve estar habilitado após clicar em Novo');
  Assert.IsFalse(FFormProdutos.btnEditar.Enabled, 'btnEditar deve estar desabilitado após clicar em Novo');
  Assert.IsFalse(FFormProdutos.btnExcluir.Enabled, 'btnExcluir deve estar desabilitado após clicar em Novo');
end;

procedure TestTFormProdutos.TesteSalvarProduto;
var
  NomeProduto, Categoria: string;
  Preco: Currency;
  QuantidadeEstoque: Integer;
  DataSetProdutos: TFDQuery;
begin
  FFormProdutos.btnNovoClick(Self);
  NomeProduto := 'Produto Teste';
  Preco := 10.00;
  QuantidadeEstoque := 100;
  Categoria := '1';

  FFormProdutos.DBEdit2.Text := NomeProduto;
  FFormProdutos.DBEdit3.Text := FloatToStr(Preco);
  FFormProdutos.DBEdit4.Text := IntToStr(QuantidadeEstoque);
  FFormProdutos.DBEdit5.text := '1';
  FFormProdutos.btnSalvarClick(Self);

  DataSetProdutos := FFormProdutos.GetDataSetProdutos;
  DataSetProdutos.Filter := 'NOME = ' + QuotedStr(NomeProduto);
  DataSetProdutos.Filtered := True;

  Assert.IsTrue(DataSetProdutos.RecordCount > 0, 'Produto não foi salvo corretamente no banco de dados');
  Assert.AreEqual(NomeProduto, DataSetProdutos.FieldByName('NOME').AsString, 'Nome do produto não corresponde');
  Assert.AreEqual(Preco, DataSetProdutos.FieldByName('PRECO').AsCurrency, 'Preço do produto não corresponde');
  Assert.AreEqual(QuantidadeEstoque, DataSetProdutos.FieldByName('QUANTIDADEEMESTOQUE').AsInteger, 'Quantidade em estoque do produto não corresponde');
end;

initialization
  TDUnitX.RegisterTestFixture(TestTFormProdutos);
end.

