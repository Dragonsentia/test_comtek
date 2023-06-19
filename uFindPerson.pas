unit uFindPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TFrmFind = class(TForm)
    EditFindPerson: TEdit;
    Label4: TLabel;
    BitBtnClearEditFIO: TBitBtn;
    FDQuery_SearchFIO: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource_SearchFIO: TDataSource;
    procedure EditFindPersonKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnClearEditFIOClick(Sender: TObject);
    procedure EditFindPersonChange(Sender: TObject);
    procedure EditFindPersonKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFind: TFrmFind;

implementation
 uses uOperatorWorkstation, uStatistWorkstation;
{$R *.dfm}


procedure TFrmFind.BitBtnClearEditFIOClick(Sender: TObject);
begin
//������� ���� ��� ����� ���������� ������� � ������� FDQuery_SearchFIO(��������� ������) � ���������� ���������
  EditFindPerson.Text:='';
  FDQuery_SearchFIO.Active:=False;
end;

procedure TFrmFind.EditFindPersonChange(Sender: TObject);
begin
//���� � ���� ��� ����� ���������� ������� ���� �����(�� ����������� ���������� � ����������� ��������), �� ������ �������� �������� ��� �������
  if Trim(EditFindPerson.Text)<>'' then
    BitBtnClearEditFIO.Enabled:=True
  else
//����� ������ �������� ���������� ��� ������� � FDQuery_SearchFIO(��������� ������) ����������� � ���������� ���������
    BitBtnClearEditFIO.Enabled:=False;
    FDQuery_SearchFIO.Active:=False;
end;

procedure TFrmFind.EditFindPersonKeyPress(Sender: TObject; var Key: Char);
begin
//� ���� ����� ��������� ������� ������ ������������� �����, ���� ������� � backspace
  case Key of
    '�'..'�','�'..'�',#32,#8:;
  else Key := Chr(0);
  end;
end;

procedure TFrmFind.EditFindPersonKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//���� ���� ����� �� ������, ����������� ������������� ����� �� ���
  if EditFindPerson.Text<>'' then
    begin
      FDQuery_SearchFIO.Close;
      FDQuery_SearchFIO.SQL.Clear;
      {������� ������� �������������� �������� �������� (� ������� ������������ �������� fio,
       �������� �������� ������������� ���� � ������� upper ���������� ��� � �������� �������� ��� �������� ���������) }
      FDQuery_SearchFIO.SQL.Add('select ID_PERSON, "��� ��������", "���� ��������", "���� ��������" from View_person where upper("��� ��������") like upper(:fio) order by "��� ��������"');
      FDQuery_SearchFIO.Params.ParamByName('fio').Value:=Trim(EditFindPerson.Text) + '%';//���������� ��������� fio ������ �� ���� ����� (�� ����������� ���������� � ����������� ��������) � ������� % (���������, ����� ��������� ������������� ������ ����� ���� ����� �������)
      FDQuery_SearchFIO.Open;
      FDQuery_SearchFIO.Close;
      FDQuery_SearchFIO.Active:=True;
    end;
end;

end.
