unit UserFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, TokenManagerU,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, PaginationControllerU,
  Vcl.ExtDlgs, APIRequestServiceU;

type
  TUserForm = class(TForm)
    dsUser: TDataSource;
    fdmemUser: TFDMemTable;
    fdmemUserid: TIntegerField;
    fdmemUserEmail: TStringField;
    pcUser: TPageControl;
    TabSheet1: TTabSheet;
    pnlGrid: TPanel;
    dbgUsers: TDBGrid;
    pnlActions: TPanel;
    lblUserEmail: TLabel;
    btnSearch: TButton;
    edtEmail: TEdit;
    dbnAuthor: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    TabSheet2: TTabSheet;
    pnlAuthorInfo: TPanel;
    lblID: TLabel;
    lblEmail: TLabel;
    btnSave: TButton;
    edtID: TEdit;
    edtFullname: TEdit;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    edtPassword: TEdit;
    lblPassword: TLabel;
    fdmemUserlastLogin: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetUsers(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
    procedure fdmemUserBeforeDelete(DataSet: TDataSet);
    procedure bbtnNextPageClick(Sender: TObject);
    procedure bbtnPrevPageClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    CurrentResponse: string;
    Pagination: TPaginationData;
    Loading: Boolean;
    function GetSearchKey: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TUserForm.bbtnNextPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TUserForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := edtEmail.Text;
  Result := SearchKey;
end;

procedure TUserForm.TabSheet1Show(Sender: TObject);
begin
  UserForm.Height := 609;
  UserForm.Width := 671
end;

procedure TUserForm.TabSheet2Show(Sender: TObject);
begin
  UserForm.Height := 305;
  UserForm.Width := 440;
  edtID.Text := '*Auto Generated*';
  edtEmail.Clear;
end;

procedure TUserForm.TabSheet3Show(Sender: TObject);
begin
  UserForm.Height := 609;
  UserForm.Width := 671;
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TUserForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage - 1);
end;

procedure TUserForm.btnSaveClick(Sender: TObject);
var
  JSONBody: TJSONObject;
  APIEndpoint: string;
  UserEmail: string;
  UserPassword: string;
begin
  UserEmail := edtFullname.Text;
  UserPassword := edtPassword.Text;

  if UserEmail.IsEmpty or UserPassword.IsEmpty then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  JSONBody := TJSONObject.Create;
  JSONBody.AddPair('email', UserEmail);
  JSONBody.AddPair('pwd', UserPassword);


  APIEndpoint := '/api/users';
  if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
  begin
    GetUsers;
    pcUser.ActivePageIndex := 0;
  end

end;

procedure TUserForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetUsers(GetSearchKey);
end;

procedure TUserForm.dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetUsers;
    edtEmail.Clear;
  end;
end;

procedure TUserForm.fdmemUserBeforeDelete(DataSet: TDataSet);
var
  Response: IMVCRESTResponse;
begin
  Response := RESTClient.DataSetDelete('/api/users', fdmemUserid.AsString);
  if not Response.StatusCode in [200] then
    raise Exception.Create(Response.Content);
  GetUSers;
end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
  Pagination := nil;
end;

procedure TUserForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  Pagination := TPaginationData.Create;
end;

procedure TUserForm.FormShow(Sender: TObject);
begin
  GetUsers;
end;

procedure TUserForm.GetUsers(SearchKey: string = '';
  PageParam: Integer = 1);
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter user by name }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam(
      'q', Format('contains(email, "%s")', [SearchKey])
    );

  try
    RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken).Async(
      procedure (Resp: IMVCRESTResponse)
      begin
        fdmemUser.Close;
        fdmemUser.Open;
        Loading := True;
        CurrentResponse := Resp.Content;

        GetPaginationData(CurrentResponse, Pagination);
        fdmemUser.LoadJSONArrayFromJSONObjectProperty('data',
          CurrentResponse, TMVCNameCase.ncSnakeCase);
        fdmemUser.First;

        //set pagination button
        bbtnNextPage.Enabled := Pagination.fHasNextPage;
        bbtnPrevPage.Enabled := Pagination.fHasPrevPage;
        lblPageInfo.Caption := Format('Page %d out of %d',
          [Pagination.fCurrentPage, Pagination.fTotalPages]);

        Loading := True;
        RESTClient.ClearQueryParams;
      end, nil, True).Get('/api/users');
  except
    on e: Exception do
    begin
      //Something went wrong
      bbtnNextPage.Enabled := False;
      bbtnPrevPage.Enabled := False;
      lblPageInfo.Caption := 'No result';
      ShowMessage(e.toString);
      RESTClient.ClearQueryParams;
    end;
  end;
end;

end.
