unit uSelectWorkstation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, GraphUtil;

type
  TFrmSelectWorkstation = class(TForm)
    BitBtnWorkOperator: TBitBtn;
    BitBtnWorkStatist: TBitBtn;
    procedure BitBtnWorkOperatorClick(Sender: TObject);
    procedure BitBtnWorkStatistClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelectWorkstation: TFrmSelectWorkstation;

implementation

uses uOperatorWorkstation, uStatistWorkstation;
{$R *.dfm}

procedure TFrmSelectWorkstation.BitBtnWorkOperatorClick(Sender: TObject);
begin
//создание экземпляра формы АРМ Оператор
Application.CreateForm(TFrmOperator, FrmOperator);
FrmSelectWorkstation.Close;
end;

procedure TFrmSelectWorkstation.BitBtnWorkStatistClick(Sender: TObject);
begin
//создание экземпляра формы АРМ Статист
Application.CreateForm(TFrmStatist, FrmStatist);
FrmSelectWorkstation.Close;
end;

procedure TFrmSelectWorkstation.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//градиентная заливка фона формы
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
