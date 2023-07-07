unit CustomerFrm;

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
  TCustomerForm = class(TForm)
    dsCustomer: TDataSource;
    fdmemCustomer: TFDMemTable;
    fdmemCustomerid: TIntegerField;
    fdmemCustomerEmail: TStringField;
    pcCustomer: TPageControl;
    TabSheet1: TTabSheet;
    pnlGrid: TPanel;
    dbgCustomers: TDBGrid;
    pnlActions: TPanel;
    lblName: TLabel;
    btnSearch: TButton;
    edtName: TEdit;
    dbnCustomer: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    TabSheet2: TTabSheet;
    pnlAuthorInfo: TPanel;
    lblID: TLabel;
    lblFirstName: TLabel;
    lblUserInfo: TLabel;
    btnSave: TButton;
    edtID: TEdit;
    edtFullname: TEdit;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    edtPassword: TEdit;
    lblLastName: TLabel;
    fdmemCustomerlast_name: TStringField;
    fdmemCustomerdate_of_birth: TDateField;
    fdmemCustomernote: TStringField;
    dtpBirthDate: TDateTimePicker;
    lblBirthDate: TLabel;
    memNote: TMemo;
    lblNote: TLabel;
    pnlLendings: TPanel;
    DBGrid1: TDBGrid;
    fdmemCustomerLending: TFDMemTable;
    dsCustomerLending: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetUsers(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnCustomerClick(Sender: TObject; Button: TNavigateBtn);
    procedure fdmemCustomerBeforeDelete(DataSet: TDataSet);
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
  CustomerForm: TCustomerForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TCustomerForm.bbtnNextPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TCustomerForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := edtName.Text;
  Result := SearchKey;
end;

procedure TCustomerForm.TabSheet1Show(Sender: TObject);
begin
  CustomerForm.Height := 609;
end;

procedure TCustomerForm.TabSheet2Show(Sender: TObject);
begin
    CustomerForm.Height := 320;
    edtID.Text := '*Auto Generated*';
    edtName.Clear;
end;

procedure TCustomerForm.TabSheet3Show(Sender: TObject);
begin
  CustomerForm.Height := 609;
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TCustomerForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage - 1);
end;

procedure TCustomerForm.btnSaveClick(Sender: TObject);
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
    pcCustomer.ActivePageIndex := 0;
  end

end;

procedure TCustomerForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetUsers(GetSearchKey);
end;

procedure TCustomerForm.dbnCustomerClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetUsers;
    edtName.Clear;
  end;
end;

procedure TCustomerForm.fdmemCustomerBeforeDelete(DataSet: TDataSet);
var
  Response: IMVCRESTResponse;
begin
  Response := RESTClient.DataSetDelete('/api/customers', fdmemCustomerid.AsString);
  if not Response.StatusCode in [200] then
    raise Exception.Create(Response.Content);
  GetUSers;
end;

procedure TCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
  Pagination := nil;
end;

procedure TCustomerForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  Pagination := TPaginationData.Create;
end;

procedure TCustomerForm.FormShow(Sender: TObject);
begin
  GetUsers;
end;

procedure TCustomerForm.GetUsers(SearchKey: string = '';
  PageParam: Integer = 1);
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter user by name }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam(
      'q', Format('or(contains(first_name, "%s"), contains(last_name, "%s"))',
      [SearchKey, SearchKey]));

  try
    RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken).Async(
      procedure (Resp: IMVCRESTResponse)
      begin
        fdmemCustomer.Close;
        fdmemCustomer.Open;
        Loading := True;
        CurrentResponse := Resp.Content;

        GetPaginationData(CurrentResponse, Pagination);
        fdmemCustomer.LoadJSONArrayFromJSONObjectProperty('data',
          CurrentResponse, TMVCNameCase.ncSnakeCase);
        fdmemCustomer.First;

        //set pagination button
        bbtnNextPage.Enabled := Pagination.fHasNextPage;
        bbtnPrevPage.Enabled := Pagination.fHasPrevPage;
        lblPageInfo.Caption := Format('Page %d out of %d',
          [Pagination.fCurrentPage, Pagination.fTotalPages]);

        Loading := True;
        RESTClient.ClearQueryParams;
      end, nil, True).Get('/api/customers');
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
