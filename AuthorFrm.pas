unit AuthorFrm;

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
  TAuthorForm = class(TForm)
    pgcAuthor: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlGrid: TPanel;
    dbgAuthors: TDBGrid;
    pnlActions: TPanel;
    lblAuthorName: TLabel;
    btnSearch: TButton;
    edtName: TEdit;
    dbnAuthor: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    pnlAuthorInfo: TPanel;
    pnlBooks: TPanel;
    dtpBirthDate: TDateTimePicker;
    btnSave: TButton;
    lblID: TLabel;
    lblFullname: TLabel;
    lblBirthDate: TLabel;
    dbgAuthorBooks: TDBGrid;
    TabSheet3: TTabSheet;
    pnlRawData: TPanel;
    memRawResponse: TMemo;
    dsAuthor: TDataSource;
    fdmemAuthor: TFDMemTable;
    fdmemAuthorid: TIntegerField;
    fdmemAuthorFullname: TStringField;
    fdmemAuthorDOB: TDateField;
    fdmemAuthorBook: TFDMemTable;
    dsAuthorBook: TDataSource;
    fdmemAuthorBookid: TIntegerField;
    fdmemAuthorBooktitle: TStringField;
    fdmemAuthorBookyear: TIntegerField;
    edtID: TEdit;
    edtFullname: TEdit;
    pnlSubGridTitle: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetAuthors(SearchKey: string = ''; PageParam: Integer = 1);
    procedure btnSearchClick(Sender: TObject);
    procedure dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
    procedure fdmemAuthorBeforeDelete(DataSet: TDataSet);
    procedure fdmemAuthorBeforePost(DataSet: TDataSet);
    procedure bbtnNextPageClick(Sender: TObject);
    procedure bbtnPrevPageClick(Sender: TObject);
    procedure ValidateInput;
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure dbgAuthorsDblClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure GetBooksByAuthorId(AuthorId: integer);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    CurrentResponse: string;
    IsNewData: Boolean;
    Pagination: TPaginationData;
    Loading: Boolean;
    function GetSearchKey: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorForm: TAuthorForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, System.JSON;

{$R *.dfm}

procedure TAuthorForm.bbtnNextPageClick(Sender: TObject);
begin
  GetAuthors(GetSearchKey, Pagination.fCurrentPage + 1);
end;

function TAuthorForm.GetSearchKey: string;
var
  SearchKey: string;
begin
  SearchKey := edtName.Text;
  Result := SearchKey;
end;

procedure TAuthorForm.TabSheet1Show(Sender: TObject);
begin
  IsNewData := True;
  AuthorForm.Height := 609;
  TabSheet2.Caption := 'New Author';
end;

procedure TAuthorForm.TabSheet2Show(Sender: TObject);
begin
  pnlBooks.Visible := not IsNewData;
  if IsNewData then
  begin
    AuthorForm.Height := 297;
    edtID.Text := '*Auto Generated*';
    edtFullname.Clear;
    dtpBirthDate.Date := Now;
  end
  else
  begin
    var SelectedAuthorID := fdmemAuthorId.Value;
    edtID.Text := SelectedAuthorID.toString;
    edtFullname.Text := fdmemAuthorFullname.AsString;
    dtpBirthDate.Date := fdmemAuthorDOB.Value;
    GetBooksByAuthorId(SelectedAuthorID);
  end;
end;

procedure TAuthorForm.TabSheet3Show(Sender: TObject);
begin
  IsNewData := True;
  AuthorForm.Height := 609;
  TabSheet2.Caption := 'New Author';
  memRawResponse.Lines.Add(CurrentResponse);
  memRawResponse.SelStart := 0;
  memRawResponse.SelLength := 0;
  memRawResponse.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TAuthorForm.ValidateInput;
begin
  if (fdmemAuthorFullname.Value = '') or fdmemAuthorDOB.IsNull then
  begin
    ShowMessage('All fields are required');
    Abort;
  end;
end;

procedure TAuthorForm.bbtnPrevPageClick(Sender: TObject);
begin
  GetAuthors(GetSearchKey, Pagination.fCurrentPage - 1);
end;

procedure TAuthorForm.btnSaveClick(Sender: TObject);
var
  JSONBody: TJSONObject;
  APIEndpoint: string;
  AuthorFullName: string;
  AuthorDOB: TDate;
begin
  AuthorFullName := edtFullname.Text;
  AuthorDOB := dtpBirthDate.Date;

  if AuthorFullName.IsEmpty	or (AuthorDOB = Now) then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;

  JSONBody := TJSONObject.Create;
  JSONBody.AddPair('full_name', AuthorFullName);
  JSONBody.AddPair('date_of_birth', AuthorDOB);

  if IsNewData then
  begin
    APIEndpoint := '/api/authors';
    if APIRequest.POST(RESTClient, APIEndpoint, JSONBody) then
    begin
      GetAuthors;
      pgcAuthor.ActivePageIndex := 0;
    end
  end
  else
  begin
    APIEndpoint := Format('/api/authors/%s', [edtID.Text]);
    if APIRequest.PUT(RESTClient, APIEndpoint, JSONBody) then
      GetAuthors;
  end;
end;



procedure TAuthorForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetAuthors(GetSearchKey);
end;

procedure TAuthorForm.dbgAuthorsDblClick(Sender: TObject);
begin
  IsNewData := False;
  TabSheet2.Caption := 'Information';
  pnlBooks.Visible := not IsNewData;
  pgcAuthor.TabIndex := 1;
end;

procedure TAuthorForm.dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetAuthors;
    edtName.Clear;
  end;
end;

procedure TAuthorForm.fdmemAuthorBeforeDelete(DataSet: TDataSet);
var
  Response: IMVCRESTResponse;
begin
  Response := RESTClient.DataSetDelete('/api/authors', fdmemAuthorid.AsString);
  if not Response.StatusCode in [200] then
    raise Exception.Create(Response.Content);
end;

procedure TAuthorForm.fdmemAuthorBeforePost(DataSet: TDataSet);
var
  Resp: IMVCRESTResponse;
  RespJSON: TJSONValue;
begin
  if Loading then
    Exit;

  ValidateInput;
  case fdmemAuthor.State of
    dsEdit:
      Resp := RESTClient.DataSetUpdate('/api/authors', fdmemAuthorid.AsString,
        fdmemAuthor);
    dsInsert:
      begin
        Resp := RESTClient.DataSetInsert('/api/authors', fdmemAuthor);
        RespJSON := TJSONObject.ParseJSONValue(Resp.Content);
        fdmemAuthorid.Value := RespJSON.GetValue<Integer>('id');
      end;
  end;
  if not (Resp.StatusCode in [200, 201]) then
    raise Exception.Create(Resp.Content);
end;

procedure TAuthorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
  Pagination := nil;
end;

procedure TAuthorForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  Pagination := TPaginationData.Create;
  IsNewData := True;
end;

procedure TAuthorForm.FormShow(Sender: TObject);
begin
  GetAuthors;
end;

procedure TAuthorForm.GetAuthors(SearchKey: string = '';
  PageParam: Integer = 1);
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter author by name }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam(
      'q', Format('contains(full_name, "%s")', [SearchKey])
    );

  try
    RESTClient.SetBearerAuthorization(TokenManager.GetToken).Async(
      procedure (Resp: IMVCRESTResponse)
      begin
        fdmemAuthor.Close;
        fdmemAuthor.Open;
        Loading := True;
        CurrentResponse := Resp.Content;

        GetPaginationData(CurrentResponse, Pagination);
        fdmemAuthor.LoadJSONArrayFromJSONObjectProperty('data',
          CurrentResponse, TMVCNameCase.ncSnakeCase);
        fdmemAuthor.First;

        //set pagination button
        bbtnNextPage.Enabled := Pagination.fHasNextPage;
        bbtnPrevPage.Enabled := Pagination.fHasPrevPage;
        lblPageInfo.Caption := Format('Page %d out of %d',
          [Pagination.fCurrentPage, Pagination.fTotalPages]);

        Loading := False;
        RESTClient.ClearQueryParams;
      end, nil, True).Get('/api/authors');
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

procedure TAuthorForm.GetBooksByAuthorId(AuthorId: integer);
begin
  try
    RESTClient.SetBearerAuthorization(TokenManager.GetToken).Async(
      procedure (Resp: IMVCRESTResponse)
      begin
        fdmemAuthorBook.Close;
        fdmemAuthorBook.Open;

        fdmemAuthorBook.LoadJSONArrayFromJSONObjectProperty('data',
          Resp.Content, TMVCNameCase.ncSnakeCase);
        fdmemAuthorBook.First;

        RESTClient.ClearQueryParams;
      end, nil, True).Get(Format('/api/authors/%d/books', [AuthorId]));
  except
    on e: Exception do
    begin
      ShowMessage(e.toString);
    end;
  end;
end;

end.
