unit APIRequestServiceU;

interface

uses
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, TokenManagerU,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, System.JSON;

type
  APIRequest = class
    RESTClient: IMVCRESTClient;
  public
    class function POST(const RESTClient: IMVCRESTClient;
      const Endpoint: string; JSONBody: TJSONObject): boolean;
    class function PUT(const RESTClient: IMVCRESTClient;
      const Endpoint: string; JSONBody: TJSONObject): boolean;
    class function DELETE(const RESTClient: IMVCRESTClient;
      const Endpoint: string): boolean;
  end;
implementation

{ APIRequest }

class function APIRequest.POST(const RESTClient: IMVCRESTClient;
  const Endpoint: string; JSONBody: TJSONObject): boolean;
var
  IsSuccess: Boolean;
  Resp: IMVCRESTResponse;
begin
  IsSuccess := False;
  try
    RESTClient.AddBody(JSONBody.toString, 'application/json');
    Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
      .POST(Endpoint);

    if Resp.StatusCode in [201, 200] then
    begin
      IsSuccess := True;
      ShowMessage('Added Successfully.');
    end
    else if Resp.StatusCode = 403 then
      ShowMessage('You are now allowed for this action.');
  except
    on e: Exception do
      ShowMessage(e.toString);
  end;
  Result := IsSuccess;
end;

class function APIRequest.PUT(const RESTClient: IMVCRESTClient;
  const Endpoint: string; JSONBody: TJSONObject): boolean;
var
  IsSuccess: Boolean;
  Resp: IMVCRESTResponse;
begin
  IsSuccess := False;
  try
    RESTClient.AddBody(JSONBody.toString, 'application/json');
    Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
      .PUT(Endpoint);

    if Resp.StatusCode = 200 then
    begin
      ShowMessage('Updated Successfully.');
      IsSuccess := True;
    end
    else if Resp.StatusCode = 403 then
      ShowMessage('You are now allowed for this action.');
  except
    on e: Exception do
      ShowMessage(e.toString);
  end;
  Result := IsSuccess;
end;

class function APIRequest.DELETE(const RESTClient: IMVCRESTClient;
  const Endpoint: string): boolean;
var
  IsSuccess: Boolean;
  Resp: IMVCRESTResponse;
begin
  IsSuccess := False;
  try
    Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
      .DELETE(Endpoint);
    if Resp.StatusCode = 200 then
    begin
      ShowMessage('Deleted Successfully.');
      IsSuccess := True;
    end
    else if Resp.StatusCode = 403 then
      ShowMessage('You are now allowed for this action.');
  except
    on e: Exception do
      ShowMessage(e.toString);
  end;
  Result := IsSuccess;
end;

end.
