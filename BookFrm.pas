unit BookFrm;

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
  Vcl.ExtDlgs, APIRequestServiceU, Vcl.Samples.Spin;

type
  TBookForm = class(TForm)
    dsBook: TDataSource;
    fdmemBook: TFDMemTable;
    fdmemBookId: TIntegerField;
    fdmemBookAuthor: TStringField;
    pgcBook: TPageControl;
    TabSheet1: TTabSheet;
    pnlGrid: TPanel;
    dbgBooks: TDBGrid;
    pnlActions: TPanel;
    lblBookTitle: TLabel;
    btnSearch: TButton;
    edtBookTitle: TEdit;
    dbnBook: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    TabSheet2: TTabSheet;
    pnlBookInfo: TPanel;
    lblID: TLabel;
    lblYear: TLabel;
    btnSave: TButton;
    edtID: TEdit;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    lblAuthor: TLabel;
    lblTitle: TLabel;
    fdmemBookTitle: TStringField;
    fdmemBookAuthorId: TIntegerField;
    fdmemBookPubYear: TIntegerField;
    edtTitle: TEdit;
    sedYear: TSpinEdit;
    dblcAuthor: TDBLookupComboBox;
    fdmemAuthorOpt: TFDMemTable;
    dsAuthorOpt: TDataSource;
    fdmemAuthorOptid: TIntegerField;
    fdmemAuthorOptfull_name: TStringField;
    pnlBookLendingHistory: TPanel;
    dbgLendingHistory: TDBGrid;
    fdmemLendingHistory: TFDMemTable;
    dsLendingHistory: TDataSource;
    fdmemLendingHistoryCustomerName: TStringField;
    fdmemLendingHistoryLendingID: TIntegerField;
    fdmemLendingHistoryLendingStart: TDateTimeField;
    fdmemLendingHistoryLendingEnd: TDateTimeField;
    pnlSubGridTitle: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetBooks(SearchKey: string = ''; PageParam: Integer = 1);
    procedure GetBookLendingHistory(BookID: Integer);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnBookClick(Sender: TObject; Button: TNavigateBtn);
    procedure GetAuthorOpt;
    procedure fdmemBookBeforeDelete(DataSet: TDataSet);
    procedure bbtnNextPageClick(Sender: TObject);
    procedure bbtnPrevPageClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgBooksDblClick(Sender: TObject);
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
  BookForm: TBookForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TBookForm.bbtnNextPageClick(Sender: TObject);
begin
  GetBooks(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TBookForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := edtBookTitle.Text;
  Result := SearchKey;
end;

procedure TBookForm.TabSheet1Show(Sender: TObject);
begin
  BookForm.Width := 957;
  BookForm.Height := 609;
  isNewData := True;
  TabSheet2.Caption := 'New Book';
end;

procedure TBookForm.TabSheet2Show(Sender: TObject);
begin
    pnlBookLendingHistory.Visible := not IsNewData;

    if IsNewData then
    begin
      BookForm.Width := 455;
      BookForm.Height := 326;
      edtID.Text := '*Auto Generated*';
      edtTitle.Clear;
      sedYear.Value := 2023;
      dblcAuthor.KeyValue := null;
    end
    else
    begin
      var SelectedBookID :=  fdmemBookId.Value;
      edtID.Text := SelectedBookID.ToString;
      dblcAuthor.KeyValue := fdmemBookAuthorId.Value;
      sedYear.Value := fdmemBookPubYear.Value;
      edtTitle.Text := fdmemBookTitle.AsString;
      GetBookLendingHistory(SelectedBookID);
    end;
end;

procedure TBookForm.TabSheet3Show(Sender: TObject);
begin
  isNewData := True;
  TabSheet2.Caption := 'New Book';
  BookForm.Width := 957;
  BookForm.Height := 609;
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TBookForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetBooks(GetSearchKey, Pagination.fCurrentPage - 1);
end;

procedure TBookForm.btnSaveClick(Sender: TObject);
var
  JSONBody: TJSONObject;
  APIEndpoint: string;
  BookTitle: string;
  BookPubYear: Integer;
  BookAuthorId: Integer;
begin
  BookTitle := edtTitle.Text;
  BookPubYear := sedYear.Value;
  BookAuthorId := 0;

  if not VarIsNull(dblcAuthor.KeyValue) then
    BookAuthorId := dblcAuthor.KeyValue;

  if BookTitle.IsEmpty or (BookAuthorId = 0) then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  JSONBody := TJSONObject.Create;
  JSONBody.AddPair('title', BookTitle);
  JSONBody.AddPair('pub_year', BookPubYear);
  JSONBody.AddPair('author_id', BookAuthorId);

  APIEndpoint := '/api/books';
  if IsNewData then
  begin
    if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
    begin
      GetBooks;
      pgcBook.ActivePageIndex := 0;
    end
  end
  else
  begin
    APIEndpoint := APIEndpoint + '/' + edtId.Text;
    if APIRequest.PUT(RESTClient, APIEndpoint, JSONBody) then
      GetBooks;
  end;
end;

procedure TBookForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetBooks(GetSearchKey);
end;

procedure TBookForm.dbgBooksDblClick(Sender: TObject);
begin
  isNewData := False;
  TabSheet2.Caption := 'Information';
  pgcBook.ActivePageIndex := 1;
end;

procedure TBookForm.dbnBookClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetBooks;
    edtBookTitle.Clear;
  end;
end;

procedure TBookForm.fdmemBookBeforeDelete(DataSet: TDataSet);
var
  Response: IMVCRESTResponse;
begin
  Response := RESTClient.DataSetDelete('/api/users', fdmemBookId.AsString);
  if not Response.StatusCode in [200] then
    raise Exception.Create(Response.Content);
  GetBooks;
end;

procedure TBookForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
  Pagination := nil;
end;

procedure TBookForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  Pagination := TPaginationData.Create;
end;

procedure TBookForm.FormShow(Sender: TObject);
begin
  GetBooks;
  GetAuthorOpt;
end;

procedure TBookForm.GetBooks(SearchKey: string = '';
  PageParam: Integer = 1);
var
  Resp: IMVCRESTResponse;
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter user by name }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam('q', Format('contains(title, "%s")',
      [SearchKey]));

  try
    Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
       .Get('/api/books');
    if Resp.StatusCode = 200 then
    begin
      fdmemBook.Close;
      fdmemBook.Open;
      Loading := True;
      CurrentResponse := Resp.Content;

      GetPaginationData(CurrentResponse, Pagination);
      fdmemBook.LoadJSONArrayFromJSONObjectProperty('data',
        CurrentResponse, TMVCNameCase.ncSnakeCase);
      fdmemBook.First;

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

procedure TBookForm.GetAuthorOpt;
var
  Resp: IMVCRESTResponse;
begin
  Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
    .Get('/api/authors/all');

  if Resp.StatusCode = 200 then
  begin
    fdmemAuthorOpt.Close;
    fdmemAuthorOpt.Open;
    fdmemAuthorOpt.LoadJSONArrayFromJSONObjectProperty('data',
      Resp.Content, TMVCNameCase.ncSnakeCase);
    fdmemAuthorOpt.First;
    RESTClient.ClearQueryParams;
  end;
end;

procedure TBookForm.GetBookLendingHistory(BookID: Integer);
var
  Resp: IMVCRESTResponse;
begin
  Resp := RESTClient.SetBearerAuthorization(TokenManager.GetToken)
    .Get('/api/lendings/books/' + BookID.ToString);

  if Resp.StatusCode = 200 then
  begin
    fdmemLendingHistory.Close;
    fdmemLendingHistory.Open;
    fdmemLendingHistory.LoadJSONArrayFromJSONObjectProperty('data',
      Resp.Content, TMVCNameCase.ncSnakeCase);
    fdmemLendingHistory.First;
    RESTClient.ClearQueryParams;
  end;
end;

end.
