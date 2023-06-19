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
//���������� ������ ��������
//���� ���� � �������� �������� �� ������, ��������� ���� �������� � ���� ��������, �� ����������� �������� ��������� PROC_ADDPERSON (���������� ��������)
  if (trim(EditFIO.Text)<>'') and (CalendarPickerDateB.IsEmpty=False) and (CalendarPickerDateE.IsEmpty=False) then
    begin
     //�������� ��������� � ��� �������� � ���������
     FDStoredProc_AddPerson.Params.ParamValues['PFIO']:=trim(EditFIO.Text);
     //�������� ��������� � ����� �������� �������� � ���������
     FDStoredProc_AddPerson.Params.ParamValues['PDATEBIRTH']:=CalendarPickerDateB.Date;
     //�������� ��������� � ����� �������� �������� � �� � ���������
     FDStoredProc_AddPerson.Params.ParamValues['PDATE_ENTRY']:=CalendarPickerDateE.Date;
     //���������� ���������
     FDStoredProc_AddPerson.ExecProc;
     //���������� View_person, ����� ������� ������ ��������
     FrmOperator.View_person.Active:=False;
     FrmOperator.View_person.Active:=True;
     //������� ������� �� ������������� View_medreport, �������� ��������, �� ������� ���������� ����� � ������������� View_person
     FrmOperator.View_medreport.Close;
     FrmOperator.View_medreport.SQL.Clear;
     FrmOperator.View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+FrmOperator.View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
     FrmOperator.View_medreport.Open;
     FrmOperator.View_medreport.Close;
     FrmOperator.View_medreport.Active:=True;
     FrmAddPerson.Close;
     FrmOperator.BitBtnAddPerson.Enabled:=True;
    end
  else ShowMessage('��������� ��� ����!');
end;

procedure TFrmAddPerson.CalendarPickerDateBChange(Sender: TObject);
begin
//�������� ����� ���������� ���� �������� ��������
if CalendarPickerDateB.IsEmpty=False then
    begin
      if (CalendarPickerDateB.Date > CalendarPickerDateE.Date) then
        begin
          //���� ���� �������� �������� ������� ���� ��������, �� ������ �������� ���������� ����������� ��� ������� � ���������� ��������� � ���������������
          BtnSaveAddPerson.Enabled:=False;
          ShowMessage('���� �������� �� ����� ���� ������� ���� ��������, ������� ���������� ����.');
        end
      else BtnSaveAddPerson.Enabled:=True;
    end;
end;

procedure TFrmAddPerson.CalendarPickerDateEChange(Sender: TObject);
begin
//�������� ����� ���������� ���� �������� �������� � ��
if CalendarPickerDateE.IsEmpty=False then
    begin
      if (CalendarPickerDateE.Date < CalendarPickerDateB.Date) then
        begin
          //���� ���� �������� ����� ���� �������� ��������, �� ������ �������� ���������� ����������� ��� ������� � ���������� ��������� � ���������������
          BtnSaveAddPerson.Enabled:=False;
          ShowMessage('���� �������� �� ����� ���� ����� ���� ��������, ������� ���������� ����.');
        end
      else BtnSaveAddPerson.Enabled:=True;
    end;
end;

procedure TFrmAddPerson.EditFIOKeyPress(Sender: TObject; var Key: Char);
begin
//� ���� ����� ��������� ������� ������ ������������� �����, ���� ������� � backspace
  case Key of
    '�'..'�','�'..'�',#32,#8:;
  else Key := Chr(0);
  end;
end;

procedure TFrmAddPerson.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //������������ ������ ��� �������� �����
  FrmOperator.BitBtnAddPerson.Enabled:=True;//������ �������� �������� � ��� �������� ����� ���������� ��������� ��� �������
end;

procedure TFrmAddPerson.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//����������� ������� ���� �����
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
