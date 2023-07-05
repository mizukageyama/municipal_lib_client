unit AuthorFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, TokenManagerU,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, PaginationControllerU;

type
  TAuthorForm = class(TForm)
    pnlActions: TPanel;
    pnlGrid: TPanel;
    pnlNavigation: TPanel;
    dbnAuthor: TDBNavigator;
    dbgAuthors: TDBGrid;
    btnSearch: TButton;
    edtName: TEdit;
    lblAuthorName: TLabel;
    fdmemAuthor: TFDMemTable;
    fdmemAuthorid: TIntegerField;
    fdmemAuthorFullname: TStringField;
    fdmemAuthorDOB: TDateField;
    dsAuthor: TDataSource;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    lblPageInfo: TLabel;
    pnlInfo: TPanel;
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
  private
    RESTClient: IMVCRESTClient;
    Loading: Boolean;
    Pagination: TPaginationData;
    function GetSearchKey: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorForm: TAuthorForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  LibraryDM, System.JSON;

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

procedure TAuthorForm.btnSearchClick(Sender: TObject);
begin
  if GetSearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetAuthors(GetSearchKey);
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
      Resp := RESTClient.DataSetUpdate('/api/authors', fdmemAuthorid.AsString, fdmemAuthor);
    dsInsert:
      begin
        Resp := RESTClient.DataSetInsert('/api/authors', fdmemAuthor);
        RespJSON := TJSONObject.ParseJSONValue(Resp.Content);
        fdmemAuthorid.Value := RespJSON.GetValue<Integer>('id');
      end;
  end;
  if not Resp.StatusCode in [200, 201] then
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
  GetAuthors;
end;

procedure TAuthorForm.GetAuthors(SearchKey: string = ''; PageParam: Integer = 1);
begin
  RESTClient.AddQueryStringParam('page', PageParam);

  { filter author by name }
  if not SearchKey.IsEmpty then
    RESTClient.AddQueryStringParam(
      'q', Format('contains(full_name, "%s")', [SearchKey])
    );

  try
    RESTClient.SetBearerAuthorization(GlobalTokenManager.GetToken).Async(
      procedure (Resp: IMVCRESTResponse)
      begin
        fdmemAuthor.Close;
        fdmemAuthor.Open;
        Loading := True;

        GetPaginationData(Resp.Content, Pagination);

        fdmemAuthor.LoadJSONArrayFromJSONObjectProperty('data',
          Resp.Content, TMVCNameCase.ncSnakeCase);
        fdmemAuthor.First;
        Loading := False;
        RESTClient.ClearQueryParams;

        //set pagination button
        bbtnNextPage.Enabled := Pagination.fHasNextPage;
        bbtnPrevPage.Enabled := Pagination.fHasPrevPage;
        lblPageInfo.Caption := Format('Page %d out of %d', [Pagination.fCurrentPage, Pagination.fTotalPages]);
      end, nil, True).Get('/api/authors');
  except
    //Something went wrong
    bbtnNextPage.Enabled := False;
    bbtnPrevPage.Enabled := False;
    lblPageInfo.Caption := 'No result';
  end;
end;

end.
