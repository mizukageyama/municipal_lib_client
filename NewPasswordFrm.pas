unit NewPasswordFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, APIRequestServiceU, MVCFramework.RESTClient.Intf, MVCFramework.RESTClient;

type
  TNewPwdForm = class(TForm)
    edtNewPassword: TEdit;
    lblNewPwd: TLabel;
    btnChangePassword: TButton;
    procedure btnChangePasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPwdForm: TNewPwdForm;

implementation

uses
  System.JSON;

{$R *.dfm}

procedure TNewPwdForm.btnChangePasswordClick(Sender: TObject);
var
  NewPassword: string;
  APIEndpoint: string;
  JSONBody: TJSONObject;
  RESTClient: IMVCRESTClient;
begin
  try
    RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
    NewPassword := edtNewPassword.Text;

    JSONBody := TJSONObject.Create;
    JSONBody.AddPair('pwd', NewPassword);

    APIEndpoint := '/api/users/me/password';
    if APIRequest.PUT(RESTClient, APIEndpoint, JSONBody) then
      Close;
  finally
    RESTClient := nil;
  end;
end;

end.
