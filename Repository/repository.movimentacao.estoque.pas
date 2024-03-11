unit repository.movimentacao.estoque;

interface

uses
  FireDAC.Comp.Client, Data.DB;

type
  TMovimentacaoEstoqueRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function GetAll: TFDQuery;
  end;

implementation

constructor TMovimentacaoEstoqueRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TMovimentacaoEstoqueRepository.GetAll: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.SQL.add('SELECT  ME.*, ');
  Result.SQL.add('P.NOME');
  Result.SQL.add('FROM MOVIMENTACOES_ESTOQUE ME');
  Result.SQL.add('JOIN PRODUTOS P ON ME.PRODUTO_ID = P.ID');
  Result.SQL.add('ORDER BY ID');
end;


end.

