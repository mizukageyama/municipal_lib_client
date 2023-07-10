object UserForm: TUserForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Users'
  ClientHeight = 571
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pgcUser: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 3
    Width = 659
    Height = 568
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 653
    ExplicitHeight = 559
    object TabSheet1: TTabSheet
      Caption = 'User Table'
      OnShow = TabSheet1Show
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 651
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 645
        ExplicitHeight = 529
        object dbgUsers: TDBGrid
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 639
          Height = 414
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          Align = alClient
          DataSource = dsUser
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'email'
              Width = 231
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'last_login'
              Width = 270
              Visible = True
            end>
        end
        object pnlActions: TPanel
          Left = 0
          Top = 0
          Width = 651
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 645
          object lblUserEmail: TLabel
            Left = 9
            Top = 13
            Width = 304
            Height = 20
            AutoSize = False
            Caption = 'User email:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object btnSearch: TButton
            Left = 192
            Top = 38
            Width = 121
            Height = 29
            Caption = 'Search'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnSearchClick
          end
          object edtEmailKey: TEdit
            Left = 9
            Top = 39
            Width = 177
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbnUser: TDBNavigator
            Left = 319
            Top = 38
            Width = 74
            Height = 27
            DataSource = dsUser
            VisibleButtons = [nbDelete, nbRefresh]
            TabOrder = 2
            OnClick = dbnUserClick
          end
        end
        object pnlNavigation: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 496
          Width = 651
          Height = 37
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 487
          ExplicitWidth = 645
          object lblPageInfo: TLabel
            Left = 120
            Top = 0
            Width = 405
            Height = 37
            Align = alClient
            Alignment = taCenter
            Caption = 'No result'
            Layout = tlCenter
            ExplicitWidth = 48
            ExplicitHeight = 15
          end
          object bbtnNextPage: TBitBtn
            AlignWithMargins = True
            Left = 528
            Top = 3
            Width = 118
            Height = 34
            Margins.Right = 5
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Next   '
            Enabled = False
            Glyph.Data = {
              82060000424D8206000000000000420000002800000014000000140000000100
              20000300000040060000000000000000000000000000000000000000FF0000FF
              0000FF0000004C7047004C7047004C7047004C7047004C70470096BC4A1D96BC
              4A6F96BC4ABD96BC4AEA96BC4AFC96BC4AFC96BC4AEA96BC4ABD96BC4A6F96BC
              4A1D4C7047004C7047004C7047004C7047004C7047004C7047004C7047004C70
              47004C70470096BC4A5F96BC4ACF96BC4AFC96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFC96BC4ACF96BC4A5F4C7047004C7047004C70
              47004C7047004C7047004C70470096BC4A0E96BC4A8F96BC4AF896BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AF896BC4A8F96BC4A0E4C7047004C7047004C7047004C70470096BC
              4A8F96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4A8F4C70
              47004C7047004C70470096BC4A5F96BC4AF896BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF95BB47FF95BB47FF95BB47FF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AF896BC4A5F4C70470096BC4A1D96BC4ACF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF9CC053FFC7DC
              9FFFBDD58EFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4ACF96BC4A1D96BC4A6F96BC4AFC96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF95BB47FFB3CF7CFFFDFEFBFFFBFDF8FFC7DC9FFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFC96BC4A6F96BC4ABD96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF95BB47FF95BB47FF95BB47FF95BB47FFA6C665FFE3ED
              CEFFFFFFFFFFFBFDF8FFC7DC9FFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4ABD96BC4AEA96BC4AFF96BC4AFF96BC4AFF96BC4AFFA6C665FFACCA
              70FFACCA70FFACCA70FFACCA70FFBDD58EFFF2F7E8FFFFFFFFFFFBFDF8FFC7DC
              9FFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AEA96BC4AFC96BC4AFF96BC
              4AFF95BB47FFA6C665FFF2F7E8FFFBFDF8FFFBFDF8FFFBFDF8FFFBFDF8FFFBFD
              F8FFFDFEFBFFFFFFFFFFFFFFFFFFFBFDF8FFB3CF7CFF95BB47FF96BC4AFF96BC
              4AFF96BC4AFC96BC4AFC96BC4AFF96BC4AFF95BB47FFA6C665FFF2F7E8FFFDFE
              FBFFFDFEFBFFFDFEFBFFFDFEFBFFFBFDF8FFFDFEFBFFFFFFFFFFFFFFFFFFFDFE
              FBFFBDD58EFF95BB47FF96BC4AFF96BC4AFF96BC4AFC96BC4AEA96BC4AFF96BC
              4AFF96BC4AFF96BC4AFFA6C665FFB3CF7CFFB3CF7CFFB3CF7CFFB3CF7CFFBDD5
              8EFFF2F7E8FFFFFFFFFFFDFEFBFFC7DC9FFF9CC053FF96BC4AFF96BC4AFF96BC
              4AFF96BC4AEA96BC4ABD96BC4AFF96BC4AFF96BC4AFF96BC4AFF95BB47FF95BB
              47FF95BB47FF95BB47FF9CC053FFE3EDCEFFFFFFFFFFFDFEFBFFC7DC9FFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4ABD96BC4A6F96BC4AFC96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF95BB47FFB3CF7CFFFDFE
              FBFFFDFEFBFFC7DC9FFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFC96BC4A6F96BC4A1D96BC4ACF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF9CC053FFC7DC9FFFBDD58EFF9CC053FF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4ACF96BC4A1D4C70470096BC4A5F96BC
              4AF896BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF95BB
              47FF95BB47FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AF896BC
              4A5F4C7047004C7047004C70470096BC4A8F96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4A8F4C7047004C7047004C7047004C70470096BC
              4A0E96BC4A8F96BC4AF896BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AF896BC4A8F96BC4A0E4C70
              47004C7047004C7047004C7047004C7047004C70470096BC4A5F96BC4ACF96BC
              4AFC96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFC96BC
              4ACF96BC4A5F4C7047004C7047004C7047004C7047004C7047004C7047004C70
              47004C7047004C70470096BC4A1D96BC4A6F96BC4ABD96BC4AEA96BC4AFC96BC
              4AFC96BC4AEA96BC4ABD96BC4A6F96BC4A1D4C7047004C7047004C7047004C70
              47004C704700}
            Layout = blGlyphRight
            TabOrder = 0
            OnClick = bbtnNextPageClick
            ExplicitLeft = 522
          end
          object bbtnPrevPage: TBitBtn
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 112
            Height = 34
            Margins.Left = 5
            Margins.Bottom = 0
            Align = alLeft
            Caption = '  Prev'
            Enabled = False
            Glyph.Data = {
              82060000424D8206000000000000420000002800000014000000140000000100
              20000300000040060000000000000000000000000000000000000000FF0000FF
              0000FF0000004C7047004C7047004C7047004C7047004C70470096BC4A1D96BC
              4A6F96BC4ABD96BC4AEA96BC4AFB96BC4AFB96BC4AEA96BC4ABD96BC4A6F96BC
              4A1D4C7047004C7047004C7047004C7047004C7047004C7047004C7047004C70
              470096BC4A0696BC4A5F96BC4ACF96BC4AFB96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFB96BC4ACF96BC4A5F96BC4A064C7047004C70
              47004C7047004C7047004C70470096BC4A0E96BC4A8F96BC4AFB96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFB96BC4A8F96BC4A0E4C7047004C7047004C70470096BC4A0696BC
              4A8F96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4A8F96BC
              4A064C7047004C70470096BC4A5F96BC4AFB96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF95BB47FF95BB47FF96BC49FF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFB96BC4A5F4C70470096BC4A1D96BC4ACF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC49FF96BC4AFFBDD58EFFC7DC9FFF9CC0
              53FF96BC49FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4ACF96BC4A1D96BC4A6F96BC4AFB96BC4AFF96BC4AFF96BC4AFF96BC49FF96BC
              4AFFC7DC9FFFFCFDFAFFFCFDFAFFB3CF7CFF95BB47FF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFB96BC4A6F96BC4ABD96BC4AFF96BC
              4AFF96BC4AFF96BC49FF96BC4AFFC7DC9FFFFCFDFAFFFFFFFFFFE3EDCEFFA6C6
              65FF95BB47FF95BB47FF95BB47FF95BB47FF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4ABD96BC4AEA96BC4AFF96BC4AFF96BC4AFF96BC4AFFC7DC9FFFFCFD
              FAFFFFFFFFFFF2F7E8FFBDD58EFFACCA70FFACCA70FFACCA70FFACCA70FFA6C6
              65FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AEA96BC4AFB96BC4AFF96BC
              4AFF95BB47FFB3CF7CFFFCFDFAFFFFFFFFFFFFFFFFFFFCFDFAFFFCFDFAFFFCFD
              FAFFFCFDFAFFFCFDFAFFFCFDFAFFF2F7E8FFA6C665FF95BB47FF96BC4AFF96BC
              4AFF96BC4AFB96BC4AFB96BC4AFF96BC4AFF95BB47FFBDD58EFFFCFDFAFFFFFF
              FFFFFFFFFFFFFCFDFAFFFCFDFAFFFCFDFAFFFCFDFAFFFCFDFAFFFCFDFAFFF2F7
              E8FFA6C665FF95BB47FF96BC4AFF96BC4AFF96BC4AFB96BC4AEA96BC4AFF96BC
              4AFF96BC4AFF9CC053FFC7DC9FFFFCFDFAFFFFFFFFFFF2F7E8FFBDD58EFFB3CF
              7CFFB3CF7CFFB3CF7CFFB3CF7CFFA6C665FF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AEA96BC4ABD96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFFC7DC
              9FFFFCFDFAFFFFFFFFFFE3EDCEFF9CC053FF95BB47FF95BB47FF95BB47FF95BB
              47FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4ABD96BC4A6F96BC4AFB96BC
              4AFF96BC4AFF96BC4AFF96BC49FF96BC4AFFC7DC9FFFFCFDFAFFFFFFFFFFB3CF
              7CFF95BB47FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFB96BC4A6F96BC4A1D96BC4ACF96BC4AFF96BC4AFF96BC4AFF96BC4AFF95BB
              47FF9CC053FFBDD58EFFC7DC9FFF9CC053FF96BC49FF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4ACF96BC4A1D4C70470096BC4A5F96BC
              4AFB96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF95BB47FF95BB47FF96BC
              49FF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFB96BC
              4A5F4C7047004C70470096BC4A0696BC4A8F96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4A8F96BC4A064C7047004C7047004C70470096BC
              4A0E96BC4A8F96BC4AFB96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC
              4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFB96BC4A8F96BC4A0E4C70
              47004C7047004C7047004C7047004C70470096BC4A0696BC4A5F96BC4ACF96BC
              4AFB96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFF96BC4AFB96BC
              4ACF96BC4A5F96BC4A064C7047004C7047004C7047004C7047004C7047004C70
              47004C7047004C70470096BC4A1D96BC4A6F96BC4ABD96BC4AEA96BC4AFB96BC
              4AFB96BC4AEA96BC4ABD96BC4A6F96BC4A1D4C7047004C7047004C7047004C70
              47004C704700}
            TabOrder = 1
            OnClick = bbtnPrevPageClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'New User'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object pnlUserInfo: TPanel
        Left = 0
        Top = 0
        Width = 651
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object lblID: TLabel
          Left = 114
          Top = 41
          Width = 14
          Height = 15
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object lblEmail: TLabel
          Left = 99
          Top = 82
          Width = 32
          Height = 15
          Alignment = taRightJustify
          Caption = 'Email:'
        end
        object lblPassword: TLabel
          Left = 75
          Top = 128
          Width = 53
          Height = 15
          Alignment = taRightJustify
          Caption = 'Password:'
        end
        object btnSave: TButton
          Left = 239
          Top = 172
          Width = 107
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = btnSaveClick
        end
        object edtID: TEdit
          Left = 137
          Top = 38
          Width = 113
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 1
        end
        object edtEmail: TEdit
          Left = 138
          Top = 79
          Width = 208
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
        end
        object edtPassword: TEdit
          Left = 137
          Top = 125
          Width = 208
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          PasswordChar = '*'
          TabOrder = 3
        end
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Raw Data'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object pnlRawData: TPanel
        Left = 0
        Top = 0
        Width = 651
        Height = 538
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 0
        object memRawResponse: TMemo
          Left = 1
          Top = 1
          Width = 649
          Height = 536
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Lines.Strings = (
            '')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object dsUser: TDataSource
    DataSet = fdmemUser
    Left = 40
    Top = 449
  end
  object fdmemUser: TFDMemTable
    BeforeDelete = fdmemUserBeforeDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 385
    object fdmemUserid: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemUserEmail: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Required = True
    end
    object fdmemUserlastLogin: TDateTimeField
      DisplayLabel = 'Last Login'
      FieldName = 'last_login'
    end
  end
end
