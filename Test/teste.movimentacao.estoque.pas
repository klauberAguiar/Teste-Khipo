unit teste.movimentacao.estoque;

interface

uses
  DUnitX.TestFramework, view.movimentacao.estoque, System.SysUtils, FireDAC.Comp.Client, Vcl.Forms,
  data.conexao, FireDAC.Stan.Param, FireDAC.DApt, Repository.produto, presenter.cadastro, repository.movimentacao.estoque;

type
  [TestFixture]
  TestTFormMovimentacaoEstoque = class(TObject)
  strict private
    FFormMovimentacao: TFormMovimentacaoEstoque;
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
    procedure TesteMovimentacaoEstoque;
  end;

implementation

procedure TestTFormMovimentacaoEstoque.SetUp;
var
  MovimentacaoEstoqueRepository: TMovimentacaoEstoqueRepository;
begin
  FConexao := TConexao.GetInstancia.Conexao;
  FProdutoRepository := TProdutoRepository.Create(FConexao);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  MovimentacaoEstoqueRepository := TMovimentacaoEstoqueRepository.Create(TConexao.GetInstancia.Conexao);
  FQuery.SQL.Text := MovimentacaoEstoqueRepository.GetAll.SQL.Text;
  FQuery.Open;
  FPresenter := TCadastroPresenter.Create(FFormMovimentacao, FQuery);
  FFormMovimentacao := TFormMovimentacaoEstoque.Create(Application, FPresenter, FQuery);
end;

procedure TestTFormMovimentacaoEstoque.TearDown;
begin
  FreeAndNil(FFormMovimentacao);
  FreeAndNil(FQuery);
  FreeAndNil(FProdutoRepository);
end;

procedure TestTFormMovimentacaoEstoque.TesteMovimentacaoEstoque;
var
  ProdutoId: Integer;
  EstoqueAntes, EstoqueDepois: Integer;
begin
  ProdutoId := 1;
  EstoqueAntes := FFormMovimentacao.DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
  FFormMovimentacao.btnNovoClick(nil);
  FFormMovimentacao.DBEdit2.Text := '1';
  FFormMovimentacao.DataSource.DataSet.FieldByName('produto_id').AsInteger := ProdutoId;
  FFormMovimentacao.DataSource.DataSet.FieldByName('tipo_movimentacao').AsString := 'ENTRADA';
  FFormMovimentacao.DBEdit4.Text := '10';
  FFormMovimentacao.btnSalvarClick(nil);

  EstoqueDepois := FFormMovimentacao.DataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;

  Assert.AreEqual(EstoqueAntes, EstoqueDepois, 'Estoque não foi atualizado corretamente após movimentação de entrada');
end;

initialization
  TDUnitX.RegisterTestFixture(TestTFormMovimentacaoEstoque);
end.

