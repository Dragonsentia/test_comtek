unit uAddPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.StdCtrls, Vcl.WinXPickers, Vcl.WinXCalendars, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GraphUtil;

type
  TFrmAddPerson = class(TForm)
    StackPanel1: TStackPanel;
    StackPanel2: TStackPanel;
    BtnSaveAddPerson: TButton;
    BtnCancel: TButton;
    LabelFIO: TLabel;
    EditFIO: TEdit;
    LabelDateBirth: TLabel;
    CalendarPickerDateB: TCalendarPicker;
    LabelDateEntry: TLabel;
    CalendarPickerDateE: TCalendarPicker;
    FDStoredProc_AddPerson: TFDStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveAddPersonClick(Sender: TObject);
    procedure EditFIOKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure CalendarPickerDateBChange(Sender: TObject);
    procedure CalendarPickerDateEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddPerson: TFrmAddPerson;

implementation

uses uOperatorWorkstation;

{$R *.dfm}

procedure TFrmAddPerson.BtnCancelClick(Sender: TObject);
begin
  FrmAddPerson.Close;
end;

procedure TFrmAddPerson.BtnSaveAddPersonClick(Sender: TObject);
  var rn:integer;
begin
//добавление нового пациента
//если поле с фамилией пациента не пустое, заполнены дата рождения и дата внесения, то выполняется хранимая процедура PROC_ADDPERSON (добавление пациента)
  if (trim(EditFIO.Text)<>'') and (CalendarPickerDateB.IsEmpty=False) and (CalendarPickerDateE.IsEmpty=False) then
    begin
     //передача параметра с ФИО пациента в процедуру
     FDStoredProc_AddPerson.Params.ParamValues['PFIO']:=trim(EditFIO.Text);
     //передача параметра с датой рождения пациента в процедуру
     FDStoredProc_AddPerson.Params.ParamValues['PDATEBIRTH']:=CalendarPickerDateB.Date;
     //передача параметра с датой внесения пациента в БД в процедуру
     FDStoredProc_AddPerson.Params.ParamValues['PDATE_ENTRY']:=CalendarPickerDateE.Date;
     //выполнение процедуры
     FDStoredProc_AddPerson.ExecProc;
     //обновление View_person, после вставки нового пациента
     FrmOperator.View_person.Active:=False;
     FrmOperator.View_person.Active:=True;
     //выборка справок из представления View_medreport, выданных пациенту, на котором установлен фокус в представлении View_person
     FrmOperator.View_medreport.Close;
     FrmOperator.View_medreport.SQL.Clear;
     FrmOperator.View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+FrmOperator.View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
     FrmOperator.View_medreport.Open;
     FrmOperator.View_medreport.Close;
     FrmOperator.View_medreport.Active:=True;
     FrmAddPerson.Close;
     FrmOperator.BitBtnAddPerson.Enabled:=True;
    end
  else ShowMessage('Заполните все поля!');
end;

procedure TFrmAddPerson.CalendarPickerDateBChange(Sender: TObject);
begin
//проверка ввода корректной даты рождения пациента
if CalendarPickerDateB.IsEmpty=False then
    begin
      if (CalendarPickerDateB.Date > CalendarPickerDateE.Date) then
        begin
          //если дата рождения пациента позднее даты внесения, то кнопка Добавить становится недоступной для нажатия и появляется сообщение с предупреждением
          BtnSaveAddPerson.Enabled:=False;
          ShowMessage('Дата рождения не может быть позднее даты внесения, введите корректную дату.');
        end
      else BtnSaveAddPerson.Enabled:=True;
    end;
end;

procedure TFrmAddPerson.CalendarPickerDateEChange(Sender: TObject);
begin
//проверка ввода корректной даты внесения пациента в БД
if CalendarPickerDateE.IsEmpty=False then
    begin
      if (CalendarPickerDateE.Date < CalendarPickerDateB.Date) then
        begin
          //если дата внесения ранее даты рождения пациента, то кнопка Добавить становится недоступной для нажатия и появляется сообщение с предупреждением
          BtnSaveAddPerson.Enabled:=False;
          ShowMessage('Дата внесения не может быть ранее даты рождения, введите корректную дату.');
        end
      else BtnSaveAddPerson.Enabled:=True;
    end;
end;

procedure TFrmAddPerson.EditFIOKeyPress(Sender: TObject; var Key: Char);
begin
//в поле ввода разрешено вводить только кириллические буквы, знак пробела и backspace
  case Key of
    'А'..'Я','а'..'я',#32,#8:;
  else Key := Chr(0);
  end;
end;

procedure TFrmAddPerson.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //освобождение памяти при закрытии формы
  FrmOperator.BitBtnAddPerson.Enabled:=True;//кнопка Добавить пациента в АРМ Оператор снова становится доступной для нажатия
end;

procedure TFrmAddPerson.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//градиентная заливка фона формы
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
