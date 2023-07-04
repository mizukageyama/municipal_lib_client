unit TokenManagerU;

interface

uses
  System.Classes, System.SysUtils, Vcl.Dialogs;

type
  TTokenManager = class
  private
    FMemoryStream: TMemoryStream;
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
  //FMemoryStream := TMemoryStream.Create;
  FStringStream := TStringStream.Create;
end;

destructor TTokenManager.Destroy;
begin
  //FMemoryStream.Free;
  FStringStream.Free;
  inherited;
end;

procedure TTokenManager.SaveToken(const Token: string);
//var
//  TokenBytes: TBytes;
begin
  FStringStream.WriteString(Token);
//  TokenBytes := TEncoding.UTF8.GetBytes(Token);
//  FMemoryStream.Clear;
//  FMemoryStream.WriteBuffer(TokenBytes[0], Length(TokenBytes));
//  FMemoryStream.Position := 0;
end;

function TTokenManager.GetToken: string;
//var
//  TokenBytes: TBytes;
begin
  if FStringStream.Size > 0 then
  //if FMemoryStream.Size > 0 then
  begin
  Result :=  FStringStream.DataString;
//    SetLength(TokenBytes, FMemoryStream.Size);
//    FMemoryStream.ReadBuffer(TokenBytes[0], FMemoryStream.Size);
//    Result := TEncoding.UTF8.GetString(TokenBytes);
  end
  else
    Result := '';
end;

initialization
  GlobalTokenManager := TTokenManager.Create;

finalization
  GlobalTokenManager.Free;

end.

