unit AuthorFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrame1 = class(TFrame)
    fdmemAuthor: TFDMemTable;
    fdmemAuthorid: TIntegerField;
    fdmemAuthorFullname: TStringField;
    fdmemAuthorDOB: TDateField;
    pnlGrid: TPanel;
    dbgAuthors: TDBGrid;
    pnlActions: TPanel;
    lblAuthorName: TLabel;
    btnSearch: TButton;
    edtName: TEdit;
    dbnAuthor: TDBNavigator;
    pnlNavigation: TPanel;
    lblPageInfo: TLabel;
    bbtnNextPage: TBitBtn;
    bbtnPrevPage: TBitBtn;
    dsAuthor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
