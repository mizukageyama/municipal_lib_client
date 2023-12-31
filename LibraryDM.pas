unit LibraryDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient, TokenManagerU;

type
  TLibDataModule = class(TDataModule)
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
