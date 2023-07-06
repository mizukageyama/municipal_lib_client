program Municipal_Library_System;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  LoginFrm in 'LoginFrm.pas' {LoginForm},
  NewLendingFrm in 'NewLendingFrm.pas' {NewLendingForm},
  CancelLendingFrm in 'CancelLendingFrm.pas' {CancelLendingForm},
  AuthorFrm in 'AuthorFrm.pas' {AuthorForm},
  BookFrm in 'BookFrm.pas' {BookForm},
  CustomerFrm in 'CustomerFrm.pas' {CustomerForm},
  UserFrm in 'UserFrm.pas' {UserForm},
  TokenManagerU in 'TokenManagerU.pas',
  PaginationControllerU in 'PaginationControllerU.pas',
  LoadingFrm in 'LoadingFrm.pas' {LoadingForm},
  APIRequestServiceU in 'APIRequestServiceU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TLoadingForm, LoadingForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
