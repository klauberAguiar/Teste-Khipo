unit loginInterface;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  ILoginService = interface
    ['{E0A1B79A-88F8-4E3E-927D-6E9B8FCD9A07}']
    function AuthenticateUser(const Username, Password: string): Boolean;
  end;

  TLoginService = class(TInterfacedObject, ILoginService)
  private
    FConexao: TFDConnection;
    function EncryptPassword(const Password: string): string;
  public
    constructor Create(Conexao: TFDConnection);

    function AuthenticateUser(const Username, Password: string): Boolean;
  end;

implementation

uses
  System.Hash;

constructor TLoginService.Create(Conexao: TFDConnection);
begin
  inherited Create;
  FConexao := Conexao;
end;

function TLoginService.EncryptPassword(const Password: string): string;
begin
  Result := THashSHA2.GetHashString(Password);
end;

function TLoginService.AuthenticateUser(const Username, Password: string): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConexao;
    Query.Close;
    Query.SQL.Text := 'SELECT COUNT(*) FROM usuarios WHERE nome = :nome AND senha = :senha';
    Query.ParamByName('nome').AsString := Username;
    Query.ParamByName('senha').AsString := EncryptPassword(Password);
    Query.Open;
    Result := Query.Fields[0].AsInteger > 0;
  finally
    Query.Free;
  end;
end;

end.

