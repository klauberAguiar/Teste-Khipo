unit Entity.Produto;

interface

type
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FPreco: Currency;
    FQuantidadeEmEstoque: Integer;
    FCategoriaId: Integer;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Preco: Currency read FPreco write FPreco;
    property QuantidadeEmEstoque: Integer read FQuantidadeEmEstoque write FQuantidadeEmEstoque;
    property CategoriaId: Integer read FCategoriaId write FCategoriaId;
  end;

implementation

end.

