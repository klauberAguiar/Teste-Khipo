unit data.conexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB;

type
  TConexao = class
  private
    FConexao: TFDConnection;
    FDPhysFBDriverLink : TFDPhysFBDriverLink;
    class var FInstancia: TConexao;
    constructor Create;
  public
    class function GetInstancia: TConexao;
    procedure Conectar;
    property Conexao: TFDConnection read FConexao;
  end;

implementation

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.DApt;

{ TConexao }

constructor TConexao.Create;
begin
  inherited;
  FConexao := TFDConnection.Create(nil);
  FDPhysFBDriverLink := TFDPhysFBDriverLink.Create(nil);
  Conectar;
end;

class function TConexao.GetInstancia: TConexao;
begin
  if not Assigned(FInstancia) then
    FInstancia := TConexao.Create;
  Result := FInstancia;
end;

procedure TConexao.Conectar;
begin
  try
    FConexao.Params.DriverID := 'FB';
    FConexao.Params.Database := ExtractFilePath(ParamStr(0)) + 'TESTE.FDB';
    FConexao.Params.UserName := 'SYSDBA';
    FConexao.Params.Password := 'masterkey';
    FConexao.Params.Add('Server=localhost');
    FConexao.Params.Add('Port=3050');
    FConexao.LoginPrompt := False;
    FConexao.Connected := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao conectar: ' + E.Message);
    end;
  end;
end;

initialization


finalization
  FreeAndNil(TConexao.FInstancia);

end.


