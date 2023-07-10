unit LendingFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, System.Variants,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, TokenManagerU,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, PaginationControllerU,
  Vcl.ExtDlgs, APIRequestServiceU, Vcl.Samples.Spin;

type
  TLendingForm = class(TForm)
    dsLending: TDataSource;
    fdmemLending: TFDMemTable;
    fdmemLendingid: TIntegerField;
    pgcLending: TPageControl;
    TabSheet1: TTabSheet;
    pnlGrid: TPanel;
    dbgLendings: TDBGrid;
    pnlActions: TPanel;
    lblLendingStatus: TLabel;
    btnSearch: TButton;
    dbnLending: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    TabSheet2: TTabSheet;
    pnlLendingInfo: TPanel;
    btnSave: TButton;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    dblcBook: TDBLookupComboBox;
    fdmemCustomerOpt: TFDMemTable;
    dsCustomerOpt: TDataSource;
    fdmemCustomerOptid: TIntegerField;
    fdmemBookOpt: TFDMemTable;
    dsBookOpt: TDataSource;
    cmbStatus: TComboBox;
    fdmemLendingBookTitle: TStringField;
    fdmemLendingCustomerName: TStringField;
    fdmemLendinLendingStart: TDateTimeField;
    fdmemLendingLendingEnd: TDateTimeField;
    dblcCustomer: TDBLookupComboBox;
    fdmemCustomerOptFirstName: TStringField;
    fdmemCustomerOptLastName: TStringField;
    fdmemBookOptid: TIntegerField;
    fdmemBookOpttitle: TStringField;
    fdmemBookOptauthor: TStringField;
    gbBookDetails: TGroupBox;
    gbCustomerDetails: TGroupBox;
    lblCustomerID: TLabel;
    lblLastName: TLabel;
    lblBookID: TLabel;
    lblBookAuthor: TLabel;
    lblBookYear: TLabel;
    btnTerminateLending: TButton;
    fdmemBookOptPubYear: TIntegerField;
    edtID: TEdit;
    lblID: TLabel;
    fdmemLendingBookID: TIntegerField;
    fdmemLendingCustomerID: TIntegerField;
    dbtForSelectedCustomerID: TDBText;
    dbtForSelectedLastName: TDBText;
    dbtForSelectedBookID: TDBText;
    dbtForSelectedAuthor: TDBText;
    dbtForSelectedYear: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetLendings(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnLendingClick(Sender: TObject; Button: TNavigateBtn);
    procedure GetCustomerOpt;
    procedure GetBookOpt;
    procedure bbtnNextPageClick(Sender: TObject);
    procedure bbtnPrevPageClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTerminateLendingClick(Sender: TObject);
    procedure dbgLendingsDblClick(Sender: TObject);
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
  LendingForm: TLendingForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TLendingForm.bbtnNextPageClick(Sender: TObject);
begin
  GetLendings(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TLendingForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := cmbStatus.Text;
  Result := SearchKey;
end;

procedure TLendingForm.TabSheet1Show(Sender: TObject);
begin
  LendingForm.Width := 980;
  LendingForm.Height := 609;
  isNewData := True;
  TabSheet2.Caption := 'New Lending';
end;

procedure TLendingForm.TabSheet2Show(Sender: TObject);
begin
  LendingForm.Width := 370;
  LendingForm.Height := 518;
  btnTerminateLending.Visible := not isNewData;

  if isNewData then
  begin
    edtID.Text := '*Auto Generated*';
    { set default selection to first options }
    if dblcBook.ListSource.DataSet.RecordCount >= 1 then
      dblcBook.KeyValue	:= dblcBook.ListSource.DataSet.FieldByName('id').Value;

    if dblcCustomer.ListSource.DataSet.RecordCount >= 1 then
      dblcCustomer.KeyValue	:= dblcCustomer.ListSource.DataSet
        .FieldByName('id').Value;
  end
  else
  begin
    edtID.Text := fdmemLendingId.AsString;
    dblcBook.KeyValue	:= fdmemLendingBookId.AsString;
    dblcCustomer.KeyValue	:= fdmemLendingCustomerId.AsString;
  end;
end;

procedure TLendingForm.TabSheet3Show(Sender: TObject);
begin
  LendingForm.Width := 980;
  LendingForm.Height := 609;
  isNewData := True;
  TabSheet2.Caption := 'New Lending';
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TLendingForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetLendings(GetSearchKey, Pagination.fCurrentPage - 1);
end;

procedure TLendingForm.btnSaveClick(Sender: TObject);
var
  JSONBody: TJSONObject;
  APIEndpoint: string;
  BookId: Integer;
  CustomerId: Integer;
begin
  BookId := 0;
  CustomerId := 0;

  if not VarIsNull(dblcBook.KeyValue) then
    BookId := dblcBook.KeyValue;

  if not VarIsNull(dblcCustomer.KeyValue) then
    CustomerId := dblcCustomer.KeyValue;

  if (BookId = 0) or (CustomerId = 0) then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  JSONBody := TJSONObject.Create;
  JSONBody.AddPair('book_id', BookId);
  JSONBody.AddPair('customer_id', CustomerId);

  APIEndpoint := '/api/lendings/';

  if isNewData then
  begin
    APIEndpoint := APIEndpoint + 'customers/' + CustomerId.ToString;
    if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
    begin
      GetLendings;
      pgcLending.ActivePageIndex := 0;
    end
  end
  else
  begin
    APIEndpoint := APIEndpoint + fdmemLendingId.AsString;
    if APIRequest.PUT(RESTClient, APIEndpoint, JSONBody) then
      GetLendings;
  end;
end;

procedure TLendingForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetLendings(GetSearchKey);
end;

procedure TLendingForm.btnTerminateLendingClick(Sender: TObject);
var
  APIEndpoint: string;
begin
  if MessageDlg('Are you sure you want to terminate this lending?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    APIEndpoint := Format('/api/lendings/terminated/%d',
      [fdmemLendingId.Value]);
    if APIRequest.PUT(RESTClient, APIEndpoint, nil) then
      GetLendings;
  end;
end;

procedure TLendingForm.dbgLendingsDblClick(Sender: TObject);
begin
  isNewData := False;
  TabSheet2.Caption := 'Information';
  pgcLending.ActivePageIndex := 1;
end;

procedure TLendingForm.dbnLendingClick(Sender: TObject; Button: TNavigateBtn);
var
  APIEndpoint: string;
begin
  if Button = nbRefresh then
  begin
    GetLendings;
    cmbStatus.ItemIndex := -1;
  end
end;

procedure TLendingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
  Pagination := nil;
end;

procedure TLendingForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  Pagination := TPaginationData.Create;
end;

procedure TLendingForm.FormShow(Sender: TObject);
begin
  IsNewData := True;
  GetCustomerOpt;
  GetBookOpt;
  GetLendings;
end;

procedure TLendingForm.GetLendings(SearchKey: string = '';
  PageParam: Integer = 1);
var
  Resp: IMVCRESTResponse;
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter lending by status }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam('status', SearchKey.ToLower);

  try
    Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
      .Get('/api/lendings');

    if Resp.StatusCode = 200 then
    begin
      fdmemLending.Close;
      fdmemLending.Open;
      Loading := True;
      CurrentResponse := Resp.Content;

      GetPaginationData(CurrentResponse, Pagination);
      fdmemLending.LoadJSONArrayFromJSONObjectProperty('data',
        CurrentResponse, TMVCNameCase.ncSnakeCase);
      fdmemLending.First;

      //set pagination button
      bbtnNextPage.Enabled := Pagination.fHasNextPage;
      bbtnPrevPage.Enabled := Pagination.fHasPrevPage;
      lblPageInfo.Caption := Format('Page %d out of %d',
        [Pagination.fCurrentPage, Pagination.fTotalPages]);

      Loading := True;
      RESTClient.ClearQueryParams;
    end;
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

procedure TLendingForm.GetBookOpt;
var
  Resp: IMVCRESTResponse;
begin
  Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
    .Get('/api/books/all');

  if Resp.StatusCode = 200 then
  begin
    fdmemBookOpt.Close;
    fdmemBookOpt.Open;
    fdmemBookOpt.LoadJSONArrayFromJSONObjectProperty('data',
      Resp.Content, TMVCNameCase.ncSnakeCase);
    fdmemBookOpt.First;
  end
end;

procedure TLendingForm.GetCustomerOpt;
var
  Resp: IMVCRESTResponse;
begin
  Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
    .Get('/api/customers/all');

  if Resp.StatusCode = 200 then
  begin
    fdmemCustomerOpt.Close;
    fdmemCustomerOpt.Open;
      fdmemCustomerOpt.LoadJSONArrayFromJSONObjectProperty('data',
        Resp.Content, TMVCNameCase.ncSnakeCase);
    fdmemCustomerOpt.First;
  end
end;

end.
