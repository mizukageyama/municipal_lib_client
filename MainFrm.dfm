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
  OnShow = FormShow
  TextHeight = 15
  object mmLibrarySystem: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 40
    Top = 24
    object Lendings1: TMenuItem
      Caption = 'Lendings'
      object Newlending1: TMenuItem
        Action = actNewLending
      end
      object CancelLending1: TMenuItem
        Action = actCancelLending
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Logout1: TMenuItem
        Action = actLogout
      end
      object Exit1: TMenuItem
        Action = actExit
      end
    end
    object DatabaseMaintainace1: TMenuItem
      Caption = 'Database Maintenace'
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
    object actCancelLending: TAction
      Caption = '&Cancel lending'
      OnExecute = actCancelLendingExecute
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
  end
end
