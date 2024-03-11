unit repository.produto;

interface

uses
  FireDAC.Comp.Client, Data.DB;

type
  TProdutoRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function GetAll: TFDQuery;
  end;

implementation

constructor TProdutoRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TProdutoRepository.GetAll: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.SQL.ADD('SELECT P.*, C.NOME as NOME_CATEGORIA');
  Result.SQL.ADD('FROM PRODUTOS P');
  Result.SQL.ADD('LEFT JOIN CATEGORIAS C on C.ID = CATEGORIAID');
  Result.Open;
end;
end.

