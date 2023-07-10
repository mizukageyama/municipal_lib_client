unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, System.Actions, Vcl.ActnList, TokenManagerU, NewPasswordFrm,
  Vcl.StdCtrls;

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
    actNewLending: TAction;
    actAuthorTable: TAction;
    actBookTable: TAction;
    actCustomerTable: TAction;
    actUserTable: TAction;
    actExit: TAction;
    actLogout: TAction;
    actChangePassword: TAction;
    Account1: TMenuItem;
    Change1: TMenuItem;
    Logout2: TMenuItem;
    N1: TMenuItem;
    lblWelcome: TLabel;
    procedure actCancelLendingExecute(Sender: TObject);
    procedure actAuthorTableExecute(Sender: TObject);
    procedure actBookTableExecute(Sender: TObject);
    procedure actCustomerTableExecute(Sender: TObject);
    procedure actUserTableExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actNewLendingExecute(Sender: TObject);
    procedure actLogoutExecute(Sender: TObject);
    procedure actChangePasswordExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  LoginFrm, LendingFrm;

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

procedure TMainForm.actChangePasswordExecute(Sender: TObject);
begin
  NewPwdForm.ShowModal;
end;

procedure TMainForm.actCustomerTableExecute(Sender: TObject);
begin
  Application.CreateForm(TCustomerForm, CustomerForm);
  CustomerForm.Show;
end;

procedure TMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.actLogoutExecute(Sender: TObject);
begin
  //MainForm.Hide;
  LoginForm.Show;
end;

procedure TMainForm.actNewLendingExecute(Sender: TObject);
begin
  Application.CreateForm(TLendingForm, LendingForm);
  LendingForm.Show;
end;

procedure TMainForm.actUserTableExecute(Sender: TObject);
begin
  Application.CreateForm(TUserForm, UserForm);
  UserForm.Show;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoginForm.Close; { End Application }
end;
procedure TMainForm.FormShow(Sender: TObject);
begin
  LoginForm.ShowModal;
end;

end.
