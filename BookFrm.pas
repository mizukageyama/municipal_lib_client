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
    fdmemBookid: TIntegerField;
    fdmemBookAuthor: TStringField;
    pcBook: TPageControl;
    TabSheet1: TTabSheet;
    pnlGrid: TPanel;
    dbgUsers: TDBGrid;
    pnlActions: TPanel;
    lblBookTitle: TLabel;
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
    lblYear: TLabel;
    lblBookInfo: TLabel;
    btnSave: TButton;
    edtID: TEdit;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    lblAuthor: TLabel;
    Label1: TLabel;
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
    pblBookHistory: TPanel;
    DBGrid1: TDBGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetUsers(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
    procedure GetAuthorOpt;
    procedure fdmemBookBeforeDelete(DataSet: TDataSet);
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
  BookForm: TBookForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TBookForm.bbtnNextPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TBookForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := edtEmail.Text;
  Result := SearchKey;
end;

procedure TBookForm.TabSheet1Show(Sender: TObject);
begin
  BookForm.Height := 609;
end;

procedure TBookForm.TabSheet2Show(Sender: TObject);
begin
    BookForm.Height := 320;
    edtID.Text := '*Auto Generated*';
    edtEmail.Clear;
end;

procedure TBookForm.TabSheet3Show(Sender: TObject);
begin
  BookForm.Height := 609;
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TBookForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetUsers(GetSearchKey, Pagination.fCurrentPage - 1);
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
  if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
  begin
    GetUsers;
    pcBook.ActivePageIndex := 0;
    edtTitle.Clear;
    sedYear.Value := 2023;
    dblcAuthor.KeyValue := null;
  end

end;

procedure TBookForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetUsers(GetSearchKey);
end;

procedure TBookForm.dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetUsers;
    edtEmail.Clear;
  end;
end;

procedure TBookForm.fdmemBookBeforeDelete(DataSet: TDataSet);
var
  Response: IMVCRESTResponse;
begin
  Response := RESTClient.DataSetDelete('/api/users', fdmemBookId.AsString);
  if not Response.StatusCode in [200] then
    raise Exception.Create(Response.Content);
  GetUSers;
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
  GetUsers;
  GetAuthorOpt;
end;

procedure TBookForm.GetUsers(SearchKey: string = '';
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
    Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
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
  Resp := RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken)
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

end.
