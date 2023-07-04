unit TokenManagerU;

interface

uses
  System.Classes, System.SysUtils, Vcl.Dialogs;

type
  TTokenManager = class
  private
    FStringStream: TStringStream;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SaveToken(const Token: string);
    function GetToken: string;
  end;

var
  GlobalTokenManager: TTokenManager;

implementation

constructor TTokenManager.Create;
begin
  FStringStream := TStringStream.Create;
end;

destructor TTokenManager.Destroy;
begin
  FStringStream.Free;
  inherited;
end;

procedure TTokenManager.SaveToken(const Token: string);
begin
  FStringStream.WriteString(Token);
end;

function TTokenManager.GetToken: string;
begin
  Result :=  FStringStream.DataString
end;

initialization
  GlobalTokenManager := TTokenManager.Create;

finalization
  GlobalTokenManager.Free;

end.

