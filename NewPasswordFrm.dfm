object NewPwdForm: TNewPwdForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Change Password'
  ClientHeight = 124
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblNewPwd: TLabel
    Left = 43
    Top = 32
    Width = 80
    Height = 15
    Caption = 'New Password:'
  end
  object edtNewPassword: TEdit
    Left = 147
    Top = 29
    Width = 185
    Height = 23
    PasswordChar = '*'
    TabOrder = 0
  end
  object btnChangePassword: TButton
    Left = 126
    Top = 71
    Width = 124
    Height = 25
    Caption = 'Change password'
    TabOrder = 1
    OnClick = btnChangePasswordClick
  end
end
