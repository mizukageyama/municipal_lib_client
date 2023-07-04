object AuthorForm: TAuthorForm
  Left = 0
  Top = 0
  Caption = 'Authors'
  ClientHeight = 540
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlActions: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 89
    Align = alTop
    TabOrder = 0
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
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 89
    Width = 527
    Height = 410
    Align = alClient
    TabOrder = 1
    ExplicitTop = 145
    ExplicitWidth = 622
    ExplicitHeight = 247
    object dbgAuthors: TDBGrid
      Left = 1
      Top = 1
      Width = 525
      Height = 408
      Align = alClient
      DataSource = LibDataModule.dsAuthor
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
  end
  object pnlNavigation: TPanel
    Left = 0
    Top = 499
    Width = 527
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 392
    ExplicitWidth = 622
    object dbnAuthor: TDBNavigator
      Left = 152
      Top = 1
      Width = 374
      Height = 39
      DataSource = LibDataModule.dsAuthor
      Align = alRight
      TabOrder = 0
      OnClick = dbnAuthorClick
    end
  end
end
