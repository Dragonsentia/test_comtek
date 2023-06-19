unit uStatistWorkstation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCalendars, Vcl.WinXCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, GraphUtil;

type
  TFrmStatist = class(TForm)
    StackPanelStatFind: TStackPanel;
    StackPanel1: TStackPanel;
    StackPanel2: TStackPanel;
    DataSource_Person: TDataSource;
    DataSource_MedReport: TDataSource;
    StackPanel4: TStackPanel;
    Label2: TLabel;
    CalendPickerStartDateE: TCalendarPicker;
    Label1: TLabel;
    CalendPickerEndDateE: TCalendarPicker;
    StackPanel5: TStackPanel;
    Label3: TLabel;
    CalendPickerStartDateB: TCalendarPicker;
    Label5: TLabel;
    CalendPickerEndDateB: TCalendarPicker;
    CheckBox_DateEntry: TCheckBox;
    CheckBox_DateBirth: TCheckBox;
    StackPanel6: TStackPanel;
    StackPanel7: TStackPanel;
    StackPanel3: TStackPanel;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    BitBtn_FindPerson: TBitBtn;
    BitBtnResetAll: TBitBtn;
    View_medreport: TFDQuery;
    View_person: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_FindPersonClick(Sender: TObject);
    procedure BitBtnResetAllClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox_DateEntryClick(Sender: TObject);
    procedure CheckBox_DateBirthClick(Sender: TObject);
    procedure CalendPickerEndDateEChange(Sender: TObject);
    procedure CalendPickerStartDateEChange(Sender: TObject);
    procedure CalendPickerEndDateBChange(Sender: TObject);
    procedure CalendPickerStartDateBChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatist: TFrmStatist;

implementation

uses uFindPerson;

{$R *.dfm}

procedure TFrmStatist.BitBtnResetAllClick(Sender: TObject);
begin
//сброс параметров для поиска по ФИО
  FrmFind.EditFindPerson.Text:='';
  FrmFind.FDQuery_SearchFIO.Active:=False;
  FrmFind.BitBtnClearEditFIO.Enabled:=False;
//сброс параметров для поиска по датам (чекбоксы становтся неотмеченными, даты во всех CalendarPicker обнуляются)
  CheckBox_DateEntry.Checked:=False;
  CheckBox_DateBirth.Checked:=False;
  CalendPickerStartDateE.IsEmpty:=True;
  CalendPickerEndDateE.IsEmpty:=True;
  CalendPickerStartDateB.IsEmpty:=True;
  CalendPickerEndDateB.IsEmpty:=True;
//выборка "по умолчанию", выводятся все записи из представления View_person, отсортированные по Дате внесения по убыванию (от самой поздней даты к ранним)
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person order by "Дата внесения" DESC');
  View_person.Open;
  View_person.Close;
  View_person.Active:=True;
//выборка справок из представления View_medreport для пациента из View_person, на котором фокус в данный момент (если в View_person есть записи)
  if View_person.RecordCount<>0 then
    begin
      View_medreport.Close;
      View_medreport.SQL.Clear;
      View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
      View_medreport.Open;
      View_medreport.Close;
      View_medreport.Active:=True;
    end;
end;

procedure TFrmStatist.BitBtn_FindPersonClick(Sender: TObject);
begin
//поиск пациентов в зависимости от введённых параметров поиска
  if (CheckBox_DateEntry.Checked=True and CheckBox_DateBirth.Checked=True) then
    begin
      //если одновременно отмечены оба чекбокса (по датам внесения и по датам рождения), в результирующую выборку попадают записи соответствующие обоим критериям поиска
      View_person.Close;
      View_person.SQL.Clear;
      View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person where "Дата внесения" between :datestart_e and :dateend_e and "Дата рождения" between :datestart_b and :dateend_b order by "Дата внесения"');
      View_person.Params.ParamByName('datestart_e').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateE.Date);
      View_person.Params.ParamByName('dateend_e').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateE.Date);
      View_person.Params.ParamByName('datestart_b').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateB.Date);
      View_person.Params.ParamByName('dateend_b').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateB.Date);
      View_person.Open;
      View_person.Close;
      View_person.Active:=True;
    end
  else
    if CheckBox_DateEntry.Checked=True then
      begin
        //если отмечен чекбокс CheckBox_DateEntry (поиск по датам внесения), в результирующую выборку попадают записи соответствующие критерию поиска по датам внесения
        View_person.Close;
        View_person.SQL.Clear;
        View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person where "Дата внесения" between :datestart_e and :dateend_e order by "Дата внесения"');
        View_person.Params.ParamByName('datestart_e').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateE.Date);
        View_person.Params.ParamByName('dateend_e').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateE.Date);
        View_person.Open;
        View_person.Close;
        View_person.Active:=True;
      end
  else
    if CheckBox_DateBirth.Checked=True then
      begin
        //если отмечен чекбокс CheckBox_DateBirth (поиск по датам рождения), в результирующую выборку попадают записи соответствующие критерию поиска по датам рождения
        View_person.Close;
        View_person.SQL.Clear;
        View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person where "Дата рождения" between :datestart_b and :dateend_b order by "Дата внесения"');
        View_person.Params.ParamByName('datestart_b').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateB.Date);
        View_person.Params.ParamByName('dateend_b').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateB.Date);
        View_person.Open;
        View_person.Close;
        View_person.Active:=True;
      end;
  //выборка справок из представления View_medreport для пациента из View_person(если в нём есть записи), на котором фокус в данный момент
  if View_person.RecordCount<>0 then
     begin
       View_medreport.Close;
       View_medreport.SQL.Clear;
       View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
       View_medreport.Open;
       View_medreport.Close;
       View_medreport.Active:=True;
      end;
end;

procedure TFrmStatist.CalendPickerStartDateBChange(Sender: TObject);
begin
//проверка ввода корректной даты рождения(начальной даты диапазона) пациента в БД
  if CalendPickerEndDateB.IsEmpty=False then
    begin
      if (CalendPickerStartDateB.Date > CalendPickerEndDateB.Date) then
        begin
        //если начальная дата диапазона позднее конечной даты, то кнопка поиска по датам становится недоступной для нажатия, с чекбокса снимается отметка и появляется сообщение с предупреждением
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateBirth.Checked:=False;
          ShowMessage('Начальная дата не может быть позднее конечной даты, введите корректную дату.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerEndDateBChange(Sender: TObject);
begin
//проверка ввода корректной даты рождения(конечной даты диапазона) пациента в БД
  if CalendPickerStartDateB.IsEmpty=False then
    begin
      if (CalendPickerEndDateB.Date < CalendPickerStartDateB.Date) then
        begin
          //если конечная дата диапазона ранее начальной даты, то кнопка поиска по датам становится недоступной для нажатия, с чекбокса снимается отметка и появляется сообщение с предупреждением
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateBirth.Checked:=False;
          ShowMessage('Конечная дата не может быть ранее начальной даты, введите корректную дату.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerStartDateEChange(Sender: TObject);
begin
//проверка ввода корректной даты внесения(начальной даты диапазона) пациента в БД
  if CalendPickerEndDateE.IsEmpty=False then
    begin
      if (CalendPickerStartDateE.Date > CalendPickerEndDateE.Date) then
        begin
          //если начальная дата диапазона позднее конечной даты, то кнопка поиска по датам становится недоступной для нажатия, с чекбокса снимается отметка и появляется сообщение с предупреждением
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateEntry.Checked:=False;
          ShowMessage('Начальная дата не может быть позднее конечной даты, введите корректную дату.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerEndDateEChange(Sender: TObject);
begin
//проверка ввода корректной даты внесения(конечной даты диапазона) пациента в БД
  if CalendPickerStartDateE.IsEmpty=False then
    begin
      if (CalendPickerEndDateE.Date < CalendPickerStartDateE.Date) then
        begin
          //если конечная дата диапазона ранее начальной даты, то кнопка поиска по датам становится недоступной для нажатия, с чекбокса снимается отметка и появляется сообщение с предупреждением
          CheckBox_DateEntry.Checked:=False;
          BitBtn_FindPerson.Enabled:=False;
          ShowMessage('Конечная дата не может быть ранее начальной даты, введите корректную дату.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CheckBox_DateBirthClick(Sender: TObject);
begin
//обработка разных состояний чекбокса с датами рождения (для корректного поиска по датам рождения)
  if (CheckBox_DateBirth.Checked=False) then
    begin
     //если чекбокс не отмечен, то элементы для ввода дат становятся неактивными,
      CalendPickerStartDateB.Enabled:=False;
      CalendPickerEndDateB.Enabled:=False;
      //даты в них обнуляются,
      CalendPickerStartDateB.IsEmpty:=True;
      CalendPickerEndDateB.IsEmpty:=True;
      //кнопка поиска по датам становится недоступной для нажатия
      BitBtn_FindPerson.Enabled:=False;
      //для корректной обработки состояний кнопки BitBtn_FindPerson запускаются события OnChange для элементов для ввода дат внесения
      CalendPickerStartDateE.OnChange(nil);
      CalendPickerEndDateE.OnChange(nil);
    end
  else
    begin
     //если чекбокс отмечен, то элементы для ввода дат становятся активными,
      CalendPickerStartDateB.Enabled:=True;
      CalendPickerEndDateB.Enabled:=True;
      //в них устанавливается текущая дата
      CalendPickerStartDateB.Date:=Now;
      CalendPickerEndDateB.Date:=Now;
      //кнопка поиска по датам становится доступной для нажатия
      BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CheckBox_DateEntryClick(Sender: TObject);
begin
//обработка разных состояний чекбокса с датами внесения (для корректного поиска по датам внесения)
  if (CheckBox_DateEntry.Checked=False) then
    begin
      //если чекбокс не отмечен, то элементы для ввода дат становятся неактивными,
      CalendPickerStartDateE.Enabled:=False;
      CalendPickerEndDateE.Enabled:=False;
      //даты в них обнуляются,
      CalendPickerStartDateE.IsEmpty:=True;
      CalendPickerEndDateE.IsEmpty:=True;
      //кнопка поиска по датам становится недоступной для нажатия
      BitBtn_FindPerson.Enabled:=False;
      //для корректной обработки состояний кнопки BitBtn_FindPerson запускаются события OnChange для элементов для ввода дат рождения
      CalendPickerStartDateB.OnChange(nil);
      CalendPickerEndDateB.OnChange(nil);
    end
  else
    begin
      //если чекбокс отмечен, то элементы для ввода дат становятся активными,
      CalendPickerStartDateE.Enabled:=True;
      CalendPickerEndDateE.Enabled:=True;
      //в них устанавливается текущая дата
      CalendPickerStartDateE.Date:=Now;
      CalendPickerEndDateE.Date:=Now;
      //кнопка поиска по датам становится доступной для нажатия
      BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.DBGrid1CellClick(Column: TColumn);
begin
//по клику по ячейке DBGrid происходит выборка справок из представления View_medreport для пациента из View_person(если в нём есть записи), на котором фокус в данный момент
  if View_person.RecordCount<>0 then
    begin
      View_medreport.Close;
      View_medreport.SQL.Clear;
      View_medreport.SQL.Add('select ID_PERSON, "Код справки", "Дата выдачи" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "Дата выдачи" DESC');
      View_medreport.Open;
      View_medreport.Close;
      View_medreport.Active:=True;
    end;
end;

procedure TFrmStatist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //освобождение памяти при закрытии формы
end;

procedure TFrmStatist.FormCreate(Sender: TObject);
begin
//Создание формы с поиском по ФИО (FrmFind) и определение её родительского элемента
  FrmFind:= TFrmFind.Create(self);
  FrmFind.Parent:= StackPanelStatFind;
//стартовая выборка данных пациентов из представления View_person
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person order by "Дата внесения" DESC');
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
  FrmFind.Show;
end;

procedure TFrmStatist.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//градиентная заливка фона формы
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
