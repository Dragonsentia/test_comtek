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
//����� ���������� ��� ������ �� ���
  FrmFind.EditFindPerson.Text:='';
  FrmFind.FDQuery_SearchFIO.Active:=False;
  FrmFind.BitBtnClearEditFIO.Enabled:=False;
//����� ���������� ��� ������ �� ����� (�������� ��������� �������������, ���� �� ���� CalendarPicker ����������)
  CheckBox_DateEntry.Checked:=False;
  CheckBox_DateBirth.Checked:=False;
  CalendPickerStartDateE.IsEmpty:=True;
  CalendPickerEndDateE.IsEmpty:=True;
  CalendPickerStartDateB.IsEmpty:=True;
  CalendPickerEndDateB.IsEmpty:=True;
//������� "�� ���������", ��������� ��� ������ �� ������������� View_person, ��������������� �� ���� �������� �� �������� (�� ����� ������� ���� � ������)
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person order by "���� ��������" DESC');
  View_person.Open;
  View_person.Close;
  View_person.Active:=True;
//������� ������� �� ������������� View_medreport ��� �������� �� View_person, �� ������� ����� � ������ ������ (���� � View_person ���� ������)
  if View_person.RecordCount<>0 then
    begin
      View_medreport.Close;
      View_medreport.SQL.Clear;
      View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
      View_medreport.Open;
      View_medreport.Close;
      View_medreport.Active:=True;
    end;
end;

procedure TFrmStatist.BitBtn_FindPersonClick(Sender: TObject);
begin
//����� ��������� � ����������� �� �������� ���������� ������
  if (CheckBox_DateEntry.Checked=True and CheckBox_DateBirth.Checked=True) then
    begin
      //���� ������������ �������� ��� �������� (�� ����� �������� � �� ����� ��������), � �������������� ������� �������� ������ ��������������� ����� ��������� ������
      View_person.Close;
      View_person.SQL.Clear;
      View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person where "���� ��������" between :datestart_e and :dateend_e and "���� ��������" between :datestart_b and :dateend_b order by "���� ��������"');
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
        //���� ������� ������� CheckBox_DateEntry (����� �� ����� ��������), � �������������� ������� �������� ������ ��������������� �������� ������ �� ����� ��������
        View_person.Close;
        View_person.SQL.Clear;
        View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person where "���� ��������" between :datestart_e and :dateend_e order by "���� ��������"');
        View_person.Params.ParamByName('datestart_e').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateE.Date);
        View_person.Params.ParamByName('dateend_e').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateE.Date);
        View_person.Open;
        View_person.Close;
        View_person.Active:=True;
      end
  else
    if CheckBox_DateBirth.Checked=True then
      begin
        //���� ������� ������� CheckBox_DateBirth (����� �� ����� ��������), � �������������� ������� �������� ������ ��������������� �������� ������ �� ����� ��������
        View_person.Close;
        View_person.SQL.Clear;
        View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person where "���� ��������" between :datestart_b and :dateend_b order by "���� ��������"');
        View_person.Params.ParamByName('datestart_b').Value:=FormatDateTime('DD.MM.YYYY', CalendPickerStartDateB.Date);
        View_person.Params.ParamByName('dateend_b').Value:=FormatDateTime('DD.MM.YYYY',CalendPickerEndDateB.Date);
        View_person.Open;
        View_person.Close;
        View_person.Active:=True;
      end;
  //������� ������� �� ������������� View_medreport ��� �������� �� View_person(���� � �� ���� ������), �� ������� ����� � ������ ������
  if View_person.RecordCount<>0 then
     begin
       View_medreport.Close;
       View_medreport.SQL.Clear;
       View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
       View_medreport.Open;
       View_medreport.Close;
       View_medreport.Active:=True;
      end;
end;

procedure TFrmStatist.CalendPickerStartDateBChange(Sender: TObject);
begin
//�������� ����� ���������� ���� ��������(��������� ���� ���������) �������� � ��
  if CalendPickerEndDateB.IsEmpty=False then
    begin
      if (CalendPickerStartDateB.Date > CalendPickerEndDateB.Date) then
        begin
        //���� ��������� ���� ��������� ������� �������� ����, �� ������ ������ �� ����� ���������� ����������� ��� �������, � �������� ��������� ������� � ���������� ��������� � ���������������
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateBirth.Checked:=False;
          ShowMessage('��������� ���� �� ����� ���� ������� �������� ����, ������� ���������� ����.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerEndDateBChange(Sender: TObject);
begin
//�������� ����� ���������� ���� ��������(�������� ���� ���������) �������� � ��
  if CalendPickerStartDateB.IsEmpty=False then
    begin
      if (CalendPickerEndDateB.Date < CalendPickerStartDateB.Date) then
        begin
          //���� �������� ���� ��������� ����� ��������� ����, �� ������ ������ �� ����� ���������� ����������� ��� �������, � �������� ��������� ������� � ���������� ��������� � ���������������
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateBirth.Checked:=False;
          ShowMessage('�������� ���� �� ����� ���� ����� ��������� ����, ������� ���������� ����.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerStartDateEChange(Sender: TObject);
begin
//�������� ����� ���������� ���� ��������(��������� ���� ���������) �������� � ��
  if CalendPickerEndDateE.IsEmpty=False then
    begin
      if (CalendPickerStartDateE.Date > CalendPickerEndDateE.Date) then
        begin
          //���� ��������� ���� ��������� ������� �������� ����, �� ������ ������ �� ����� ���������� ����������� ��� �������, � �������� ��������� ������� � ���������� ��������� � ���������������
          BitBtn_FindPerson.Enabled:=False;
          CheckBox_DateEntry.Checked:=False;
          ShowMessage('��������� ���� �� ����� ���� ������� �������� ����, ������� ���������� ����.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CalendPickerEndDateEChange(Sender: TObject);
begin
//�������� ����� ���������� ���� ��������(�������� ���� ���������) �������� � ��
  if CalendPickerStartDateE.IsEmpty=False then
    begin
      if (CalendPickerEndDateE.Date < CalendPickerStartDateE.Date) then
        begin
          //���� �������� ���� ��������� ����� ��������� ����, �� ������ ������ �� ����� ���������� ����������� ��� �������, � �������� ��������� ������� � ���������� ��������� � ���������������
          CheckBox_DateEntry.Checked:=False;
          BitBtn_FindPerson.Enabled:=False;
          ShowMessage('�������� ���� �� ����� ���� ����� ��������� ����, ������� ���������� ����.');
        end
      else BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CheckBox_DateBirthClick(Sender: TObject);
begin
//��������� ������ ��������� �������� � ������ �������� (��� ����������� ������ �� ����� ��������)
  if (CheckBox_DateBirth.Checked=False) then
    begin
     //���� ������� �� �������, �� �������� ��� ����� ��� ���������� �����������,
      CalendPickerStartDateB.Enabled:=False;
      CalendPickerEndDateB.Enabled:=False;
      //���� � ��� ����������,
      CalendPickerStartDateB.IsEmpty:=True;
      CalendPickerEndDateB.IsEmpty:=True;
      //������ ������ �� ����� ���������� ����������� ��� �������
      BitBtn_FindPerson.Enabled:=False;
      //��� ���������� ��������� ��������� ������ BitBtn_FindPerson ����������� ������� OnChange ��� ��������� ��� ����� ��� ��������
      CalendPickerStartDateE.OnChange(nil);
      CalendPickerEndDateE.OnChange(nil);
    end
  else
    begin
     //���� ������� �������, �� �������� ��� ����� ��� ���������� ���������,
      CalendPickerStartDateB.Enabled:=True;
      CalendPickerEndDateB.Enabled:=True;
      //� ��� ��������������� ������� ����
      CalendPickerStartDateB.Date:=Now;
      CalendPickerEndDateB.Date:=Now;
      //������ ������ �� ����� ���������� ��������� ��� �������
      BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.CheckBox_DateEntryClick(Sender: TObject);
begin
//��������� ������ ��������� �������� � ������ �������� (��� ����������� ������ �� ����� ��������)
  if (CheckBox_DateEntry.Checked=False) then
    begin
      //���� ������� �� �������, �� �������� ��� ����� ��� ���������� �����������,
      CalendPickerStartDateE.Enabled:=False;
      CalendPickerEndDateE.Enabled:=False;
      //���� � ��� ����������,
      CalendPickerStartDateE.IsEmpty:=True;
      CalendPickerEndDateE.IsEmpty:=True;
      //������ ������ �� ����� ���������� ����������� ��� �������
      BitBtn_FindPerson.Enabled:=False;
      //��� ���������� ��������� ��������� ������ BitBtn_FindPerson ����������� ������� OnChange ��� ��������� ��� ����� ��� ��������
      CalendPickerStartDateB.OnChange(nil);
      CalendPickerEndDateB.OnChange(nil);
    end
  else
    begin
      //���� ������� �������, �� �������� ��� ����� ��� ���������� ���������,
      CalendPickerStartDateE.Enabled:=True;
      CalendPickerEndDateE.Enabled:=True;
      //� ��� ��������������� ������� ����
      CalendPickerStartDateE.Date:=Now;
      CalendPickerEndDateE.Date:=Now;
      //������ ������ �� ����� ���������� ��������� ��� �������
      BitBtn_FindPerson.Enabled:=True;
    end;
end;

procedure TFrmStatist.DBGrid1CellClick(Column: TColumn);
begin
//�� ����� �� ������ DBGrid ���������� ������� ������� �� ������������� View_medreport ��� �������� �� View_person(���� � �� ���� ������), �� ������� ����� � ������ ������
  if View_person.RecordCount<>0 then
    begin
      View_medreport.Close;
      View_medreport.SQL.Clear;
      View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
      View_medreport.Open;
      View_medreport.Close;
      View_medreport.Active:=True;
    end;
end;

procedure TFrmStatist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //������������ ������ ��� �������� �����
end;

procedure TFrmStatist.FormCreate(Sender: TObject);
begin
//�������� ����� � ������� �� ��� (FrmFind) � ����������� � ������������� ��������
  FrmFind:= TFrmFind.Create(self);
  FrmFind.Parent:= StackPanelStatFind;
//��������� ������� ������ ��������� �� ������������� View_person
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person order by "���� ��������" DESC');
  View_person.Open;
  View_person.Close;
  View_person.Active:=True;
//��������� ������� ������� �� ������������� View_medreport ��� �������� �� View_person, �� ������� ����� � ������ ������
  View_medreport.Close;
  View_medreport.SQL.Clear;
  View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
  View_medreport.Open;
  View_medreport.Close;
  View_medreport.Active:=True;
  FrmFind.Show;
end;

procedure TFrmStatist.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//����������� ������� ���� �����
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
