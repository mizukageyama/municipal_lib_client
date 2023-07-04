unit AuthorFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetAuthors(SearchKey: string = '');
    procedure btnSearchClick(Sender: TObject);
    procedure dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
    //procedure Button1Click(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    Loading: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorForm: TAuthorForm;

implementation

uses
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons, LibraryDM;

{$R *.dfm}

procedure TAuthorForm.btnSearchClick(Sender: TObject);
var
  SearchKey: string;
begin
  SearchKey := edtName.Text;
  if SearchKey.IsEmpty then
  begin
    ShowMessage('no search key');
    Exit;
  end;

  GetAuthors(SearchKey);
end;

procedure TAuthorForm.dbnAuthorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    GetAuthors;
    edtName.Clear;
  end;
end;

procedure TAuthorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
end;

procedure TAuthorForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  GetAuthors;
end;

procedure TAuthorForm.GetAuthors(SearchKey: string = '');
var
  APIEndpoint: string;
begin
  APIEndpoint := '/api/authors';

  if not SearchKey.IsEmpty then
    APIEndpoint := APIEndpoint + Format('?q=contains(full_name, "%s")', [SearchKey]);

  { for testing only }
  var str1 := 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJNdW5pY2lwYWwgTGlicmFyeSIsImV4cCI6MTY4ODQ0OTE2MSwibmJmIjoxNjg4NDQ1MjYxLCJ1c2VybmFtZSI6ImRhbmllbGV0QGxpYnJhcnkuY29tIiwid';
  var str2 := 'XNlcl9pZCI6IjE1Iiwicm9sZXMiOiJndWVzdCxlbXBsb3llZSJ9.K3RvJl7PH9SShT-1e5PuwzrdBfV3_lq8CYJQGEOQgzeEWJrvcPhiDf2ALbcoxpAMm87pJ5aRsg7lJL_kal1eKQ';
  { don't judge xD }

  RESTClient.SetBearerAuthorization(str1 + str2).Async(
    procedure (Resp: IMVCRESTResponse)
    begin
      //ShowMessage(Resp.Content);
      LibDataModule.fdmemAuthor.Close;
      LibDataModule.fdmemAuthor.Open;
      Loading := True;
      LibDataModule.fdmemAuthor.LoadJSONArrayFromJSONObjectProperty('data', Resp.Content,TMVCNameCase.ncSnakeCase);
      LibDataModule.fdmemAuthor.First;
      Loading := False;
    end, nil, True).Get(APIEndpoint);
end;

end.
