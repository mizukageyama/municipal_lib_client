object LendingForm: TLendingForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Lendings'
  ClientHeight = 571
  ClientWidth = 968
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
  object pgcLending: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 3
    Width = 968
    Height = 568
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 962
    ExplicitHeight = 559
    object TabSheet1: TTabSheet
      Caption = 'Lending Table'
      OnShow = TabSheet1Show
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 960
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgLendings: TDBGrid
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 948
          Height = 414
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          Align = alClient
          DataSource = dsLending
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
          OnDblClick = dbgLendingsDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'book_title'
              Width = 309
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'customer_name'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lending_start'
              Width = 162
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lending_end'
              Width = 157
              Visible = True
            end>
        end
        object pnlActions: TPanel
          Left = 0
          Top = 0
          Width = 960
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblLendingStatus: TLabel
            Left = 9
            Top = 13
            Width = 129
            Height = 20
            AutoSize = False
            Caption = 'Lending Status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object btnSearch: TButton
            Left = 144
            Top = 39
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
          object dbnLending: TDBNavigator
            Left = 271
            Top = 39
            Width = 58
            Height = 27
            DataSource = dsLending
            VisibleButtons = [nbRefresh]
            TabOrder = 1
            OnClick = dbnLendingClick
          end
          object cmbStatus: TComboBox
            Left = 9
            Top = 40
            Width = 128
            Height = 28
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              'Open'
              'Closed')
          end
        end
        object pnlNavigation: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 496
          Width = 960
          Height = 37
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object lblPageInfo: TLabel
            Left = 120
            Top = 0
            Width = 714
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
            Left = 837
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
      Caption = 'New Lending'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object pnlLendingInfo: TPanel
        Left = 0
        Top = 0
        Width = 960
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = True
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        ExplicitWidth = 954
        ExplicitHeight = 529
        object lblID: TLabel
          Left = 27
          Top = 33
          Width = 60
          Height = 15
          Alignment = taRightJustify
          Caption = 'Lending ID:'
        end
        object btnSave: TButton
          Left = 217
          Top = 391
          Width = 107
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = btnSaveClick
        end
        object gbBookDetails: TGroupBox
          Left = 27
          Top = 76
          Width = 297
          Height = 141
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Book Details'
          TabOrder = 1
          object lblBookID: TLabel
            Left = 53
            Top = 62
            Width = 44
            Height = 15
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Book ID:'
          end
          object lblBookAuthor: TLabel
            Left = 57
            Top = 85
            Width = 40
            Height = 15
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Author:'
          end
          object lblBookYear: TLabel
            Left = 17
            Top = 108
            Width = 80
            Height = 15
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Year Published:'
          end
          object dbtForSelectedBookID: TDBText
            Left = 118
            Top = 62
            Width = 163
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'id'
            DataSource = dsBookOpt
          end
          object dbtForSelectedAuthor: TDBText
            Left = 118
            Top = 85
            Width = 163
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'author'
            DataSource = dsBookOpt
          end
          object dbtForSelectedYear: TDBText
            Left = 118
            Top = 108
            Width = 163
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'pub_year'
            DataSource = dsBookOpt
          end
          object dblcBook: TDBLookupComboBox
            Left = 17
            Top = 25
            Width = 264
            Height = 23
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            KeyField = 'id'
            ListField = 'title'
            ListSource = dsBookOpt
            TabOrder = 0
          end
        end
        object gbCustomerDetails: TGroupBox
          Left = 27
          Top = 240
          Width = 297
          Height = 133
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Customer Details'
          TabOrder = 2
          object lblCustomerID: TLabel
            Left = 28
            Top = 74
            Width = 69
            Height = 15
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Customer ID:'
          end
          object lblLastName: TLabel
            Left = 38
            Top = 97
            Width = 59
            Height = 15
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Last Name:'
          end
          object dbtForSelectedCustomerID: TDBText
            Left = 118
            Top = 74
            Width = 163
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'id'
            DataSource = dsCustomerOpt
          end
          object dbtForSelectedLastName: TDBText
            Left = 118
            Top = 97
            Width = 163
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'last_name'
            DataSource = dsCustomerOpt
          end
          object dblcCustomer: TDBLookupComboBox
            Left = 16
            Top = 25
            Width = 265
            Height = 23
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            KeyField = 'id'
            ListField = 'first_name'
            ListSource = dsCustomerOpt
            TabOrder = 0
          end
        end
        object btnTerminateLending: TButton
          Left = 27
          Top = 391
          Width = 169
          Height = 25
          Caption = 'Terminate Lending'
          TabOrder = 3
          OnClick = btnTerminateLendingClick
        end
        object edtID: TEdit
          Left = 105
          Top = 30
          Width = 113
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 4
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
        Width = 960
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
          Width = 958
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
  object dsLending: TDataSource
    DataSet = fdmemLending
    Left = 600
    Top = 489
  end
  object fdmemLending: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 425
    object fdmemLendingid: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemLendingBookTitle: TStringField
      DisplayLabel = 'Book'
      FieldName = 'book_title'
      Size = 200
    end
    object fdmemLendingCustomerName: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'customer_name'
    end
    object fdmemLendinLendingStart: TDateTimeField
      DisplayLabel = 'Lending Start'
      FieldName = 'lending_start'
    end
    object fdmemLendingLendingEnd: TDateTimeField
      DisplayLabel = 'Lending End'
      FieldName = 'lending_end'
    end
    object fdmemLendingBookID: TIntegerField
      FieldName = 'book_id'
    end
    object fdmemLendingCustomerID: TIntegerField
      FieldName = 'customer_id'
    end
  end
  object fdmemCustomerOpt: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 732
    Top = 421
    object fdmemCustomerOptid: TIntegerField
      FieldName = 'id'
    end
    object fdmemCustomerOptFirstName: TStringField
      FieldName = 'first_name'
    end
    object fdmemCustomerOptLastName: TStringField
      FieldName = 'last_name'
    end
  end
  object dsCustomerOpt: TDataSource
    DataSet = fdmemCustomerOpt
    Left = 732
    Top = 493
  end
  object fdmemBookOpt: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 852
    Top = 421
    object fdmemBookOptid: TIntegerField
      FieldName = 'id'
    end
    object fdmemBookOpttitle: TStringField
      FieldName = 'title'
    end
    object fdmemBookOptauthor: TStringField
      FieldName = 'author'
    end
    object fdmemBookOptPubYear: TIntegerField
      FieldName = 'pub_year'
    end
  end
  object dsBookOpt: TDataSource
    DataSet = fdmemBookOpt
    Left = 852
    Top = 493
  end
end
