unit FunctionsU;

interface

uses
  System.Classes, System.SysUtils;

procedure SaveTokenToMemoryStream(MemoryStream: TMemoryStream; const Token: string);
function GetTokenFromMemoryStream(MemoryStream: TMemoryStream): string;

implementation

procedure SaveTokenToMemoryStream(MemoryStream: TMemoryStream; const Token: string);
begin
var
  TokenBytes: TBytes;
begin
  // Convert the token string to bytes
  TokenBytes := TEncoding.UTF8.GetBytes(Token);

  // Clear any existing data in the MemoryStream (optional)
  MemoryStream.Clear;

  // Write the token bytes to the MemoryStream
  MemoryStream.WriteBuffer(TokenBytes[0], Length(TokenBytes));

  // Set the MemoryStream's position back to the beginning (optional)
  MemoryStream.Position := 0;
end;
end;

function GetTokenFromMemoryStream(MemoryStream: TMemoryStream): string;
var
  TokenBytes: TBytes;
begin
  // Check if the MemoryStream is not empty
  if MemoryStream.Size > 0 then
  begin
    // Save the current position of the MemoryStream
    // We'll restore it later after reading the token bytes
    var CurrentPos := MemoryStream.Position;

    try
      // Move to the beginning of the MemoryStream
      MemoryStream.Position := 0;

      // Read the bytes from the MemoryStream
      SetLength(TokenBytes, MemoryStream.Size);
      MemoryStream.ReadBuffer(TokenBytes[0], MemoryStream.Size);

      // Convert the bytes back to a string (assuming it was saved as UTF-8)
      Result := TEncoding.UTF8.GetString(TokenBytes);
    finally
      // Restore the original position of the MemoryStream
      MemoryStream.Position := CurrentPos;
    end;
  end
  else
    Result := '';
end;

end.
