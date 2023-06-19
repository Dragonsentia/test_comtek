unit uOperatorWorkstation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.WinXPanels, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GraphUtil;

type
  TFrmOperator = class(TForm)
    StackPanelStatFind: TStackPanel;
    StackPanel1: TStackPanel;
    StackPanel7: TStackPanel;
    StackPanel8: TStackPanel;
    BitBtnAddMedReport: TBitBtn;
    StackPanel3: TStackPanel;
    StackPanel5: TStackPanel;
    StackPanel2: TStackPanel;
    StackPanel4: TStackPanel;
    BitBtnAddPerson: TBitBtn;
    StackPanel6: TStackPanel;
    CheckBox_AllPerson: TCheckBox;
    StackPanel9: TStackPanel;
    StackPanel10: TStackPanel;
    DBGrid1: TDBGrid;
    StackPanel11: TStackPanel;
    DBGrid2: TDBGrid;
    View_person: TFDQuery;
    DataSource_Person: TDataSource;
    DataSource_MedReport: TDataSource;
    View_medreport: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnAddPersonClick(Sender: TObject);
    procedure BitBtnAddMedReportClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox_AllPersonClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOperator: TFrmOperator;


implementation

uses uAddPerson, uAddMedReport, uFindPerson;

{$R *.dfm}

procedure TFrmOperator.BitBtnAddMedReportClick(Sender: TObject);
begin
//создание формы Добавление справки с элементами ввода
  Application.CreateForm(TFrmAddMedReport, FrmAddMedReport);
//для большей информативности ФИО выбранного пацента отображается в элементе EditFIO в режиме read-only
  FrmAddMedReport.EditFIO.Text:= View_person.FieldByName('ФИО пациента').AsString;
  FrmAddMedReport.CalendarPickerDateMrep.Date:=Now; //установка текущей даты (Дата выдачи справки)
  FrmAddMedReport.Caption:='Добавление справки '+ '['+  View_person.FieldByName('ФИО пациента').AsString+ ']';//в заголовке формы указывается ФИО выбранного пацента
  BitBtnAddMedReport.Enabled:=False; //кнопка Добавить справку в АРМ Оператор становится неактивной до закрытия формы FrmAddMedReport
  FrmAddMedReport.Show;
end;

procedure TFrmOperator.BitBtnAddPersonClick(Sender: TObject);
begin
//создание формы Добавление пацента с элементами ввода
  Application.CreateForm(TFrmAddPerson, FrmAddPerson);
  FrmAddPerson.CalendarPickerDateE.Date:=Now;//установка текущей даты (Дата внесения)
  FrmAddPerson.Show;
  BitBtnAddPerson.Enabled:=False;//кнопка Добавить пациента в АРМ Оператор становится неактивной до закрытия формы FrmAddPerson
end;

procedure TFrmOperator.CheckBox_AllPersonClick(Sender: TObject);
begin
//если чекбокс отмечен, происходит выборка всех записей из представления View_person (по умолчанию отображаются 10 последних введённых записей)
  if CheckBox_allPerson.Checked=True then
    begin
      View_person.Close;
      View_person.SQL.Clear;
      View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person order by "Дата внесения" desc');
      View_person.Open;
      View_person.Close;
      View_person.Active:=True;
    end
//если чекбокс не отмечен, происходит выборка 10 последних введённых записей записей из представления View_person
 else
   begin
     View_person.Close;
     View_person.SQL.Clear;
     View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person order by "Дата внесения" desc fetch first 10 rows only');
     View_person.Open;
     View_person.Close;
     View_person.Active:=True;
    end;
//выборка справок из представления View_medreport для пациента из View_person, на котором фокус в данный момент
View_medreport.Close;
View_medreport.SQL.Clear;
View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
View_medreport.Open;
View_medreport.Close;
View_medreport.Active:=True;
end;

procedure TFrmOperator.DBGrid1CellClick(Column: TColumn);
begin
//по клику по ячейке DBGrid происходит выборка справок из представления View_medreport для пациента из View_person, на котором фокус в данный момент
  View_medreport.Close;
  View_medreport.SQL.Clear;
  View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
  View_medreport.Open;
  View_medreport.Close;
  View_medreport.Active:=True;
end;

procedure TFrmOperator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //освобождение памяти при закрытии формы
end;

procedure TFrmOperator.FormCreate(Sender: TObject);
begin
//Создание формы с поиском по ФИО (FrmFind) и определение её родительского элемента
  FrmFind:= TFrmFind.Create(self);
  FrmFind.Parent:= StackPanelStatFind;
//стартовая выборка данных 10 последних введённых пациентов из представления View_person
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person order by "Дата внесения" desc fetch first 10 rows only');
  View_person.Open;
  View_person.Close;
  View_person.Active:=True;
//стартовая выборка справок из представления View_medreport для пациента из View_person, на котором фокус в данный момент
  View_medreport.Close;
  View_medreport.SQL.Clear;
  View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
  View_medreport.Open;
  View_medreport.Close;
  View_medreport.Active:=True;
end;

procedure TFrmOperator.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//градиентная заливка фона формы
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
