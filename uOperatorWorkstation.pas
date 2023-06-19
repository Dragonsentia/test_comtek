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
//�������� ����� ���������� ������� � ���������� �����
  Application.CreateForm(TFrmAddMedReport, FrmAddMedReport);
//��� ������� ��������������� ��� ���������� ������� ������������ � �������� EditFIO � ������ read-only
  FrmAddMedReport.EditFIO.Text:= View_person.FieldByName('��� ��������').AsString;
  FrmAddMedReport.CalendarPickerDateMrep.Date:=Now; //��������� ������� ���� (���� ������ �������)
  FrmAddMedReport.Caption:='���������� ������� '+ '['+  View_person.FieldByName('��� ��������').AsString+ ']';//� ��������� ����� ����������� ��� ���������� �������
  BitBtnAddMedReport.Enabled:=False; //������ �������� ������� � ��� �������� ���������� ���������� �� �������� ����� FrmAddMedReport
  FrmAddMedReport.Show;
end;

procedure TFrmOperator.BitBtnAddPersonClick(Sender: TObject);
begin
//�������� ����� ���������� ������� � ���������� �����
  Application.CreateForm(TFrmAddPerson, FrmAddPerson);
  FrmAddPerson.CalendarPickerDateE.Date:=Now;//��������� ������� ���� (���� ��������)
  FrmAddPerson.Show;
  BitBtnAddPerson.Enabled:=False;//������ �������� �������� � ��� �������� ���������� ���������� �� �������� ����� FrmAddPerson
end;

procedure TFrmOperator.CheckBox_AllPersonClick(Sender: TObject);
begin
//���� ������� �������, ���������� ������� ���� ������� �� ������������� View_person (�� ��������� ������������ 10 ��������� �������� �������)
  if CheckBox_allPerson.Checked=True then
    begin
      View_person.Close;
      View_person.SQL.Clear;
      View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person order by "���� ��������" desc');
      View_person.Open;
      View_person.Close;
      View_person.Active:=True;
    end
//���� ������� �� �������, ���������� ������� 10 ��������� �������� ������� ������� �� ������������� View_person
 else
   begin
     View_person.Close;
     View_person.SQL.Clear;
     View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person order by "���� ��������" desc fetch first 10 rows only');
     View_person.Open;
     View_person.Close;
     View_person.Active:=True;
    end;
//������� ������� �� ������������� View_medreport ��� �������� �� View_person, �� ������� ����� � ������ ������
View_medreport.Close;
View_medreport.SQL.Clear;
View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
View_medreport.Open;
View_medreport.Close;
View_medreport.Active:=True;
end;

procedure TFrmOperator.DBGrid1CellClick(Column: TColumn);
begin
//�� ����� �� ������ DBGrid ���������� ������� ������� �� ������������� View_medreport ��� �������� �� View_person, �� ������� ����� � ������ ������
  View_medreport.Close;
  View_medreport.SQL.Clear;
  View_medreport.SQL.Add('select ID_PERSON, "��� �������", "���� ������" from View_medreport where id_person='+View_person.FieldByName('id_person').AsString+' order by "���� ������" DESC');
  View_medreport.Open;
  View_medreport.Close;
  View_medreport.Active:=True;
end;

procedure TFrmOperator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //������������ ������ ��� �������� �����
end;

procedure TFrmOperator.FormCreate(Sender: TObject);
begin
//�������� ����� � ������� �� ��� (FrmFind) � ����������� � ������������� ��������
  FrmFind:= TFrmFind.Create(self);
  FrmFind.Parent:= StackPanelStatFind;
//��������� ������� ������ 10 ��������� �������� ��������� �� ������������� View_person
  View_person.Close;
  View_person.SQL.Clear;
  View_person.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person order by "���� ��������" desc fetch first 10 rows only');
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
end;

procedure TFrmOperator.FormPaint(Sender: TObject);
var
  R: TRect;
begin
//����������� ������� ���� �����
  SetRect(R, 0, 0, ClientWidth, ClientHeight);
  GradientFillCanvas(Canvas,  $00FAFAFF,$00FFF8F8, R, gdVertical);
end;

end.
