unit controller.authentication;

interface

uses
  loginInterface, FireDAC.Comp.Client;

type
  TAuthController = class
  private
    FLoginService: ILoginService;
  public
    constructor Create(LoginService: ILoginService);
    function Authenticate(const Username, Password: String): Boolean;
  end;

implementation

constructor TAuthController.Create(LoginService: ILoginService);
begin
  inherited Create;
  FLoginService := LoginService;
end;

function TAuthController.Authenticate(const Username, Password: String): Boolean;
begin
  Result := FLoginService.AuthenticateUser(Username, Password);
end;

end.

