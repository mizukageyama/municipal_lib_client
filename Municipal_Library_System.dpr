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
