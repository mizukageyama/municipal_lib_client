object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Municipal Library System'
  ClientHeight = 378
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mmLibrarySystem
  Position = poScreenCenter
  TextHeight = 15
  object mmLibrarySystem: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 40
    Top = 24
    object Account1: TMenuItem
      Caption = 'Account'
      object Change1: TMenuItem
        Action = actChangePassword
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Logout2: TMenuItem
        Action = actLogout
      end
    end
    object Lendings1: TMenuItem
      Caption = 'Lendings'
      object Newlending1: TMenuItem
        Action = actNewLending
      end
    end
    object DatabaseMaintainace1: TMenuItem
      Caption = 'Library Maintenace'
      object Authortable1: TMenuItem
        Action = actAuthorTable
      end
      object Booktable1: TMenuItem
        Action = actBookTable
      end
      object Customertable1: TMenuItem
        Action = actCustomerTable
      end
      object Usertable1: TMenuItem
        Action = actUserTable
      end
    end
  end
  object aclLibrarySystem: TActionList
    Left = 120
    Top = 16
    object actNewLending: TAction
      Caption = '&New lending'
      OnExecute = actNewLendingExecute
    end
    object actAuthorTable: TAction
      Caption = '&Author table...'
      OnExecute = actAuthorTableExecute
    end
    object actBookTable: TAction
      Caption = '&Book table...'
      OnExecute = actBookTableExecute
    end
    object actCustomerTable: TAction
      Caption = 'Cus&tomer table...'
      OnExecute = actCustomerTableExecute
    end
    object actUserTable: TAction
      Caption = '&User table...'
      OnExecute = actUserTableExecute
    end
    object actExit: TAction
      Caption = 'E&xit'
      OnExecute = actExitExecute
    end
    object actLogout: TAction
      Caption = '&Log out'
      OnExecute = actLogoutExecute
    end
    object actChangePassword: TAction
      Caption = 'Change &Password'
    end
  end
end
