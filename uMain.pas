unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, GraphUtil;

type
  TFrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MenuItemOperator: TMenuItem;
    MenuItemStatist: TMenuItem;
    CloseWindows: TMenuItem;
    Orcl_connectConnection: TFDConnection;
    PersonTable: TFDQuery;
    MedreportTable: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure NewForm(InstanceClass: TComponentClass; var Reference);
    procedure MenuItemOperatorClick(Sender: TObject);
    procedure MenuItemStatistClick(Sender: TObject);
    procedure CloseWindowsClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmMain: TFrmMain;

implementation

uses  uSelectWorkstation, uOperatorWorkstation, uStatistWorkstation, uAddPerson;

{$R *.dfm}


procedure TFrmMain.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//градиентная заливка фона формы
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  FrmSelectWorkstation.ShowModal;
end;

procedure TFrmMain.MenuItemOperatorClick(Sender: TObject);
begin
//создание формы АРМ Сператор
  NewForm(TFrmOperator, FrmOperator);
end;

procedure TFrmMain.MenuItemStatistClick(Sender: TObject);
begin
//создание экземпляра формы АРМ Статист
  NewForm(TFrmStatist, FrmStatist);
end;

procedure TFrmMain.CloseWindowsClick(Sender: TObject);
var
  i: integer;
begin
//процедура закрытия всех открытых окон MDIChild
  for i:= 0 to MDIChildCount - 1 do
      MDIChildren[i].Close;
end;


procedure TFrmMain.NewForm(InstanceClass: TComponentClass; var Reference);
begin
//процедура создания формы
  Application.CreateForm(InstanceClass, Reference);
end;

end.
