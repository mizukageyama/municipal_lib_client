unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  TokenManagerU;

type
  TMainForm = class(TForm)
    mmLibrarySystem: TMainMenu;
    aclLibrarySystem: TActionList;
    Lendings1: TMenuItem;
    DatabaseMaintainace1: TMenuItem;
    Authortable1: TMenuItem;
    Booktable1: TMenuItem;
    Customertable1: TMenuItem;
    Usertable1: TMenuItem;
    Newlending1: TMenuItem;
    CancelLending1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    actNewLending: TAction;
    actCancelLending: TAction;
    actAuthorTable: TAction;
    actBookTable: TAction;
    actCustomerTable: TAction;
    actUserTable: TAction;
    actExit: TAction;
    actLogout: TAction;
    Logout1: TMenuItem;
    procedure actCancelLendingExecute(Sender: TObject);
    procedure actAuthorTableExecute(Sender: TObject);
    procedure actBookTableExecute(Sender: TObject);
    procedure actCustomerTableExecute(Sender: TObject);
    procedure actUserTableExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actNewLendingExecute(Sender: TObject);
    procedure actLogoutExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  AuthorFrm, BookFrm, CancelLendingFrm, CustomerFrm, NewLendingFrm, UserFrm,
  LoginFrm;

procedure TMainForm.actAuthorTableExecute(Sender: TObject);
begin
  Application.CreateForm(TAuthorForm, AuthorForm);
  AuthorForm.Show;
end;

procedure TMainForm.actBookTableExecute(Sender: TObject);
begin
  Application.CreateForm(TBookForm, BookForm);
  BookForm.Show;
end;

procedure TMainForm.actCancelLendingExecute(Sender: TObject);
begin
  Application.CreateForm(TCancelLendingForm, CancelLendingForm);
  CancelLendingForm.Show;
end;

procedure TMainForm.actCustomerTableExecute(Sender: TObject);
begin
  Application.CreateForm(TCustomerForm, CustomerForm);
  CustomerForm.Show;
end;

procedure TMainForm.actExitExecute(Sender: TObject);
begin
  Close;
  LoginForm.Close;
end;

procedure TMainForm.actLogoutExecute(Sender: TObject);
begin
  Close;
  LoginForm.Show;
end;

procedure TMainForm.actNewLendingExecute(Sender: TObject);
begin
  Application.CreateForm(TNewLendingForm, NewLendingForm);
  NewLendingForm.Show;
end;

procedure TMainForm.actUserTableExecute(Sender: TObject);
begin
  Application.CreateForm(TUserForm, UserForm);
  UserForm.Show;
end;

end.
