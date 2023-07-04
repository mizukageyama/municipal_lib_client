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
  LibraryDM in 'LibraryDM.pas' {LibDataModule: TDataModule},
  TokenManagerU in 'TokenManagerU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TLibDataModule, LibDataModule);
  Application.Run;
end.
