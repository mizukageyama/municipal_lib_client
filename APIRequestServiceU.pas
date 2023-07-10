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
    class function ResponseHandler(Response: IMVCRESTResponse;
      SuccessMessage: String): boolean;
  end;
implementation

{ APIRequest }

class function APIRequest.POST(const RESTClient: IMVCRESTClient;
  const Endpoint: string; JSONBody: TJSONObject): boolean;
var
  IsSuccess: Boolean;
  Resp: IMVCRESTResponse;
  JSONValue: TJSONValue;
begin
  IsSuccess := False;
  try
    if JSONBody <> nil then
      RESTClient.AddBody(JSONBody.toString, 'application/json');

    Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
      .POST(Endpoint);
    Result := ResponseHandler(Resp, 'Added Successfully');
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
  JSONValue: TJSONValue;
begin
  IsSuccess := False;
  try
     if JSONBody <> nil then
      RESTClient.AddBody(JSONBody.toString, 'application/json');

    Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
      .PUT(Endpoint);
    Result := ResponseHandler(Resp, 'Updated Successfully');
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
    Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
      .DELETE(Endpoint);
    Result := ResponseHandler(Resp, 'Deleted Successfully');
  except
    on e: Exception do
      ShowMessage(e.toString);
  end;
  Result := IsSuccess;
end;

class function APIRequest.ResponseHandler(Response: IMVCRESTResponse;
  SuccessMessage: String): boolean;
var
  JSONValue: TJSONValue;
begin
  case Response.StatusCode of
    200, 201:
      begin
        ShowMessage(SuccessMessage);
        Result := True;
      end;
    204:
      begin
        ShowMessage(Response.StatusText);
        Result := True;
      end;
    400, 401:
      begin
        JSONValue := TJSONObject.ParseJSONValue(Response.Content);
        var ErrorMessage := JSONValue.GetValue<string>('message');
        ShowMessage(ErrorMessage);
      end;
    403:
      ShowMessage('You are not allowed for this action.')
  else
    ShowMessage('Something went wrong');
  end;
end;

end.
