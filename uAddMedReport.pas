unit uAddMedReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.WinXPickers,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.CheckLst, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GraphUtil;

type
  TFrmAddMedReport = class(TForm)
    StackPanel1: TStackPanel;
    LabelFIO: TLabel;
    EditFIO: TEdit;
    LabelDateEntry: TLabel;
    CalendarPickerDateMrep: TCalendarPicker;
    LabelMedReports: TLabel;
    StackPanel2: TStackPanel;
    BtnSaveAddMedReport: TButton;
    BtnCancel: TButton;
    ComboBox_NameMrep: TComboBox;
    FDStoredProc_AddMedReport: TFDStoredProc;
    procedure BtnSaveAddMedReportClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddMedReport: TFrmAddMedReport;

implementation

uses uOperatorWorkstation;

{$R *.dfm}

procedure TFrmAddMedReport.BtnCancelClick(Sender: TObject);
begin
//������ ������ �� ����� ���������� �������
  FrmAddMedReport.Close;
  FrmOperator.BitBtnAddMedReport.Enabled:=True;//������ �������� ������� � ��� �������� ����� ���������� ��������� ��� �������
end;

procedure TFrmAddMedReport.BtnSaveAddMedReportClick(Sender: TObject);
begin
//���������� ������� ���������� ��������
//���� ���� � �������� ���������� �������� �� ������ � ��������� ���� ������ �������, �� ����������� �������� ��������� PROC_ADDMEDREPORT (���������� �������)
 if (EditFIO.Text<>null) and (CalendarPickerDateMrep.IsEmpty=False) then
    begin
    //�������� ��������� � ����� ������� � ���������
    FDStoredProc_AddMedReport.Params.ParamValues['PNAME_MREP']:=ComboBox_NameMrep.Text;
    //�������� ��������� � id ��������, �������� ������� ������� � ���������
    FDStoredProc_AddMedReport.Params.ParamValues['PID_PERSON']:=FrmOperator.View_person.FieldByName('ID_PERSON').AsInteger;;
    //�������� ��������� � ����� ������ ������� � ���������
    FDStoredProc_AddMedReport.Params.ParamValues['PDATE_MREP']:=CalendarPickerDateMrep.Date;
    //���������� ���������
    FDStoredProc_AddMedReport.ExecProc;
    //������� ������� �� ������������� View_medreport, �������� ��������, �� ������� ���������� ����� � ������������� View_person
    FrmOperator.View_medreport.Close;
    FrmOperator.View_medreport.SQL.Clear;
    FrmOperator.View_medreport.SQL.Add('select * from View_medreport where id_person='+FrmOperator.View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
    FrmOperator.View_medreport.Open;
    FrmOperator.View_medreport.Close;
    FrmOperator.View_medreport.Active:=True;
    FrmOperator.BitBtnAddMedReport.Enabled:=True;//������ �������� ������� � ��� �������� ����� ���������� ��������� ��� �������
    FrmAddMedReport.Close;
    end
  else ShowMessage('������� ���� ������ �������');
end;

procedure TFrmAddMedReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmOperator.BitBtnAddMedReport.Enabled:=True;//������ �������� ������� � ��� �������� ����� ���������� ��������� ��� �������
  Action := caFree;//������������ ������ ��� �������� �����
end;

procedure TFrmAddMedReport.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//����������� ������� ���� �����
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
