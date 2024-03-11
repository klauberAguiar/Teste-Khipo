unit repository.categoria;

interface

uses
  FireDAC.Comp.Client, Data.DB;

type
  TCategoriaRepository = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function GetAll: TFDQuery;
  end;

implementation

constructor TCategoriaRepository.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TCategoriaRepository.GetAll: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.SQL.Text := 'SELECT Id, Nome FROM Categorias';
  Result.Open;
end;

end.

