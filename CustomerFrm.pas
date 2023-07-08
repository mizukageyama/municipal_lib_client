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
    fdmemCustomerId: TIntegerField;
    fdmemCustomerFirstName: TStringField;
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
    pnlCustomerInfo: TPanel;
    lblID: TLabel;
    lblFirstName: TLabel;
    btnSave: TButton;
    edtID: TEdit;
    edtFirstName: TEdit;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    edtLastName: TEdit;
    lblLastName: TLabel;
    fdmemCustomerLastName: TStringField;
    fdmemCustomerDOB: TDateField;
    fdmemCustomerNote: TStringField;
    dtpDOB: TDateTimePicker;
    lblBirthDate: TLabel;
    memNote: TMemo;
    lblNote: TLabel;
    pnlLendings: TPanel;
    DBGrid1: TDBGrid;
    fdmemCustomerLending: TFDMemTable;
    dsCustomerLending: TDataSource;
    fdmemCustomerLendingId: TIntegerField;
    fdmemCustomerLendingBookTitle: TStringField;
    fdmemCustomerLendingStart: TDateTimeField;
    fdmemCustomerLendingEnd: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetUsers(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure GetCustomerLendingHistory(CustomerID: Integer);
    procedure dbnCustomerClick(Sender: TObject; Button: TNavigateBtn);
    procedure fdmemCustomerBeforeDelete(DataSet: TDataSet);
    procedure bbtnNextPageClick(Sender: TObject);
    procedure bbtnPrevPageClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgCustomersDblClick(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    CurrentResponse: string;
    Pagination: TPaginationData;
    Loading: Boolean;
    IsNewData: Boolean;
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
  CustomerForm.Width := 930;
  CustomerForm.Height := 609;
  isNewData := True;
  TabSheet2.Caption := 'New Customer';
end;

procedure TCustomerForm.TabSheet2Show(Sender: TObject);
begin
  pnlLendings.Visible := not isNewData;
  if isNewData then
  begin
    CustomerForm.Width := 416;
    CustomerForm.Height := 494;
    edtID.Text := '*Auto Generated*';
    dtpDOB.Date := Now;
    edtFirstName.Clear;
    edtLastName.Clear;
    memNote.Clear;
  end
  else
  begin
    edtID.Text := fdmemCustomerId.AsString;
    dtpDOB.Date := fdmemCustomerDOB.Value;
    edtFirstName.Text := fdmemCustomerFirstName.AsString;
    edtLastName.Text := fdmemCustomerLastName.AsString;
    memNote.Text := fdmemCustomerNote.AsString;
    GetCustomerLendingHistory(fdmemCustomerId.Value);
  end;
end;

procedure TCustomerForm.TabSheet3Show(Sender: TObject);
begin
  isNewData := True;
  TabSheet2.Caption := 'New Customer';
  CustomerForm.Width := 930;
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
  CustomerFirstName: string;
  CustomerLastName: string;
  CustomerDOB: TDate;
  CustomerNote: string;
begin
  CustomerFirstName := edtFirstName.Text;
  CustomerLastName := edtLastName.Text;
  CustomerDOB := dtpDOB.Date;
  CustomerNote := memNote.Text;

  if CustomerFirstName.IsEmpty or CustomerLastName.IsEmpty or (CustomerDOB = Now) then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  JSONBody := TJSONObject.Create;
  JSONBody.AddPair('first_name', CustomerFirstName);
  JSONBody.AddPair('last_name', CustomerLastName);
  JSONBody.AddPair('date_of_birth', CustomerDOB);
  JSONBody.AddPair('note', CustomerNote);

  APIEndpoint := '/api/customers';

  if IsNewData then
  begin
    if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
    begin
      GetUsers;
      pcCustomer.ActivePageIndex := 0;
    end
  end
  else
  begin
    APIEndpoint := APIEndpoint + '/' + fdmemCustomerId.AsString;
    if APIRequest.PUT(RESTClient, APIEndpoint, JSONBody) then
      GetUsers;
  end;
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

procedure TCustomerForm.dbgCustomersDblClick(Sender: TObject);
begin
  isNewData := False;
  TabSheet2.Caption := 'Information';
  pcCustomer.ActivePageIndex := 1;
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
  GetUsers;
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

procedure TCustomerForm.GetCustomerLendingHistory(CustomerID: Integer);
var
  Resp: IMVCRESTResponse;
begin
  Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
    .Get('/api/lendings/customers/' + CustomerID.ToString);

  if Resp.StatusCode = 200 then
  begin
    fdmemCustomerLending.Close;
    fdmemCustomerLending.Open;
    fdmemCustomerLending.LoadJSONArrayFromJSONObjectProperty('data',
      Resp.Content, TMVCNameCase.ncSnakeCase);
    fdmemCustomerLending.First;
    RESTClient.ClearQueryParams;
  end;
end;

end.
