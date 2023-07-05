object AuthorForm: TAuthorForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Authors'
  ClientHeight = 571
  ClientWidth = 574
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
  TextHeight = 15
  object pcAuthor: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 3
    Width = 574
    Height = 568
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 4
    ExplicitWidth = 572
    ExplicitHeight = 566
    object TabSheet1: TTabSheet
      Caption = 'Author Table'
      OnShow = TabSheet1Show
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 566
        Height = 538
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 564
        ExplicitHeight = 536
        object dbgAuthors: TDBGrid
          AlignWithMargins = True
          Left = 6
          Top = 77
          Width = 554
          Height = 414
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          Align = alClient
          DataSource = dsAuthor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
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
              ReadOnly = True
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'full_name'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_of_birth'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 179
              Visible = True
            end>
        end
        object pnlActions: TPanel
          Left = 0
          Top = 0
          Width = 566
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 564
          object lblAuthorName: TLabel
            Left = 9
            Top = 13
            Width = 304
            Height = 20
            AutoSize = False
            Caption = 'Author name:'
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
          object edtName: TEdit
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
          object dbnAuthor: TDBNavigator
            Left = 319
            Top = 39
            Width = 240
            Height = 28
            DataSource = dsAuthor
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            TabOrder = 2
            OnClick = dbnAuthorClick
          end
        end
        object pnlNavigation: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 496
          Width = 566
          Height = 37
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 494
          ExplicitWidth = 564
          object lblPageInfo: TLabel
            Left = 120
            Top = 0
            Width = 320
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
            Left = 443
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
            ExplicitLeft = 441
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
      Caption = 'New Author'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object pnlAuthorInfo: TPanel
        Left = 0
        Top = 0
        Width = 566
        Height = 225
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 57
          Top = 72
          Width = 14
          Height = 15
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object Label2: TLabel
          Left = 17
          Top = 113
          Width = 57
          Height = 15
          Alignment = taRightJustify
          Caption = 'Full Name:'
        end
        object Label3: TLabel
          Left = 19
          Top = 152
          Width = 55
          Height = 15
          Alignment = taRightJustify
          Caption = 'Birth Date:'
        end
        object dtpBirthDate: TDateTimePicker
          Left = 80
          Top = 148
          Width = 116
          Height = 23
          Date = 45112.000000000000000000
          Time = 0.874582719909085400
          TabOrder = 0
        end
        object btnSave: TButton
          Left = 429
          Top = 179
          Width = 107
          Height = 25
          Caption = 'Save'
          TabOrder = 1
        end
        object dbeID: TDBEdit
          Left = 80
          Top = 69
          Width = 68
          Height = 23
          ReadOnly = True
          TabOrder = 2
        end
        object dbeFullname: TDBEdit
          Left = 80
          Top = 110
          Width = 151
          Height = 23
          TabOrder = 3
        end
      end
      object pnlBooks: TPanel
        Left = 0
        Top = 225
        Width = 566
        Height = 313
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        Visible = False
        ExplicitTop = 231
        ExplicitHeight = 307
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 566
          Height = 313
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
  end
  object dsAuthor: TDataSource
    DataSet = fdmemAuthor
    Left = 736
    Top = 185
  end
  object fdmemAuthor: TFDMemTable
    BeforePost = fdmemAuthorBeforePost
    BeforeDelete = fdmemAuthorBeforeDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 632
    Top = 185
    object fdmemAuthorid: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemAuthorFullname: TStringField
      DisplayLabel = 'Full Name'
      FieldName = 'full_name'
      Required = True
    end
    object fdmemAuthorDOB: TDateField
      DisplayLabel = 'Date of Birth'
      FieldName = 'date_of_birth'
      Required = True
      DisplayFormat = 'mmm dd, yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
end
