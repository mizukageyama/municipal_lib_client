unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, Vcl.Imaging.pngimage,
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, MainFrm, LibraryDM, System.JSON,
  TokenManagerU;

type
  TLoginForm = class(TForm)
    pnlLogin: TPanel;
    edtUsername: TEdit;
    lblUsername: TLabel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnLogin: TButton;
    pnlLeft: TPanel;
    imgLogo: TImage;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RESTClient: IMVCRESTClient;
    TokenManager: TTokenManager;
    Loading: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.btnLoginClick(Sender: TObject);
var
  Username: string;
  Password: string;
  Token: string;
  JSONValue: TJSONValue;
  TokenMgr: TTokenManager;
begin
  Username := edtUsername.Text;
  Password := edtPassword.Text;

  if Username.IsEmpty	or Password.IsEmpty then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  RESTClient.SetBasicAuthorization(Username, Password).Async(
  procedure (Resp: IMVCRESTResponse)
  begin
    Loading := False;
    if Resp.StatusCode = 200 then
    begin
      JSONValue := TJSONObject.ParseJSONValue(Resp.Content);
      Token := JSONValue.GetValue<string>('token');
      GlobalTokenManager.SaveToken(Token);
     
      MainForm.Show;
      LoginForm.Hide;
    end
    else
      ShowMessage('Username or password does not match');
  end, nil, True).Get('/api/login');
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

end.
