program Municipal_Library_System;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  LoginFrm in 'LoginFrm.pas' {LoginForm},
  LendingFrm in 'LendingFrm.pas' {LendingForm},
  CustomerFrm in 'CustomerFrm.pas' {CustomerForm},
  TokenManagerU in 'TokenManagerU.pas',
  PaginationControllerU in 'PaginationControllerU.pas',
  LoadingFrm in 'LoadingFrm.pas' {LoadingForm},
  APIRequestServiceU in 'APIRequestServiceU.pas',
  AuthorFrm in 'AuthorFrm.pas' {AuthorForm},
  BookFrm in 'BookFrm.pas' {BookForm},
  UserFrm in 'UserFrm.pas' {UserForm},
  NewPasswordFrm in 'NewPasswordFrm.pas' {NewPwdForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TLoadingForm, LoadingForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAuthorForm, AuthorForm);
  Application.CreateForm(TBookForm, BookForm);
  Application.CreateForm(TUserForm, UserForm);
  Application.CreateForm(TNewPwdForm, NewPwdForm);
  Application.Run;
end.
