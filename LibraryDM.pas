unit LibraryDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TLibDataModule = class(TDataModule)
    fdmemAuthor: TFDMemTable;
    fdmemAuthorid: TIntegerField;
    fdmemAuthorfull_name: TStringField;
    fdmemAuthordate_of_birth: TDateField;
    dsAuthor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LibDataModule: TLibDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
