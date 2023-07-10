object BookForm: TBookForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Books'
  ClientHeight = 571
  ClientWidth = 945
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
  object pgcBook: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 3
    Width = 945
    Height = 568
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 939
    ExplicitHeight = 559
    object TabSheet1: TTabSheet
      Caption = 'Book Table'
      OnShow = TabSheet1Show
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 937
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 931
        ExplicitHeight = 529
        object dbgBooks: TDBGrid
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 925
          Height = 414
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          Align = alClient
          DataSource = dsBook
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
          OnDblClick = dbgBooksDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'title'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pub_year'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'author'
              Visible = True
            end>
        end
        object pnlActions: TPanel
          Left = 0
          Top = 0
          Width = 937
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 931
          object lblBookTitle: TLabel
            Left = 9
            Top = 13
            Width = 304
            Height = 20
            AutoSize = False
            Caption = 'Book Title'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object btnSearch: TButton
            Left = 192
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
          object edtBookTitle: TEdit
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
          object dbnBook: TDBNavigator
            Left = 319
            Top = 39
            Width = 74
            Height = 27
            DataSource = dsBook
            VisibleButtons = [nbDelete, nbRefresh]
            TabOrder = 2
            OnClick = dbnBookClick
          end
        end
        object pnlNavigation: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 496
          Width = 937
          Height = 37
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 487
          ExplicitWidth = 931
          object lblPageInfo: TLabel
            Left = 120
            Top = 0
            Width = 691
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
            Left = 814
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
            ExplicitLeft = 808
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
      Caption = 'New Book'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object pnlBookInfo: TPanel
        Left = 0
        Top = 0
        Width = 435
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = True
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object lblID: TLabel
          Left = 134
          Top = 39
          Width = 14
          Height = 15
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object lblYear: TLabel
          Left = 70
          Top = 108
          Width = 80
          Height = 15
          Alignment = taRightJustify
          Caption = 'Year Published:'
        end
        object lblAuthor: TLabel
          Left = 107
          Top = 140
          Width = 43
          Height = 15
          Alignment = taRightJustify
          Caption = 'Author: '
        end
        object lblTitle: TLabel
          Left = 125
          Top = 73
          Width = 25
          Height = 15
          Alignment = taRightJustify
          Caption = 'Title:'
        end
        object btnSave: TButton
          Left = 258
          Top = 194
          Width = 107
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = btnSaveClick
        end
        object edtID: TEdit
          Left = 157
          Top = 36
          Width = 113
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 1
        end
        object edtTitle: TEdit
          Left = 157
          Top = 67
          Width = 208
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
        end
        object sedYear: TSpinEdit
          Left = 157
          Top = 105
          Width = 89
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 2023
        end
        object dblcAuthor: TDBLookupComboBox
          Left = 157
          Top = 137
          Width = 208
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          KeyField = 'id'
          ListField = 'full_name'
          ListSource = dsAuthorOpt
          TabOrder = 4
        end
      end
      object pnlBookLendingHistory: TPanel
        Left = 435
        Top = 0
        Width = 502
        Height = 538
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alRight
        TabOrder = 1
        object dbgLendingHistory: TDBGrid
          Left = 1
          Top = 34
          Width = 500
          Height = 503
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          DataSource = dsLendingHistory
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
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'customer_name'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lending_start'
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lending_end'
              Visible = True
            end>
        end
        object pnlSubGridTitle: TPanel
          Left = 1
          Top = 1
          Width = 500
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' Book'#39's Lending History'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
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
        Width = 937
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
          Width = 935
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
  object dsBook: TDataSource
    DataSet = fdmemBook
    Left = 40
    Top = 449
  end
  object fdmemBook: TFDMemTable
    BeforeDelete = fdmemBookBeforeDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 385
    object fdmemBookId: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemBookAuthor: TStringField
      DisplayLabel = 'Author'
      FieldName = 'author'
      Required = True
    end
    object fdmemBookTitle: TStringField
      DisplayLabel = 'Title'
      FieldName = 'title'
      Size = 200
    end
    object fdmemBookAuthorId: TIntegerField
      DisplayLabel = 'Author ID'
      FieldName = 'author_id'
    end
    object fdmemBookPubYear: TIntegerField
      DisplayLabel = 'Year Published'
      FieldName = 'pub_year'
    end
  end
  object fdmemAuthorOpt: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 172
    Top = 381
    object fdmemAuthorOptid: TIntegerField
      FieldName = 'id'
    end
    object fdmemAuthorOptfull_name: TStringField
      FieldName = 'full_name'
    end
  end
  object dsAuthorOpt: TDataSource
    DataSet = fdmemAuthorOpt
    Left = 172
    Top = 453
  end
  object fdmemLendingHistory: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 652
    Top = 253
    object fdmemLendingHistoryLendingID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemLendingHistoryCustomerName: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'customer_name'
    end
    object fdmemLendingHistoryLendingStart: TDateTimeField
      DisplayLabel = 'Lending Start'
      FieldName = 'lending_start'
    end
    object fdmemLendingHistoryLendingEnd: TDateTimeField
      DisplayLabel = 'Lending End'
      FieldName = 'lending_end'
    end
  end
  object dsLendingHistory: TDataSource
    DataSet = fdmemLendingHistory
    Left = 652
    Top = 341
  end
end
