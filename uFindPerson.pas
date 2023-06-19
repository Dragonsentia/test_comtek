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
//очистка поля для ввода поискового запроса и перевод FDQuery_SearchFIO(результат поиска) в неактивное состояние
  EditFindPerson.Text:='';
  FDQuery_SearchFIO.Active:=False;
end;

procedure TFrmFind.EditFindPersonChange(Sender: TObject);
begin
//если в поле для ввода поискового запроса есть текст(за исключением пробельных и управляющих символов), то кнопка Очистить доступна для нажатия
  if Trim(EditFindPerson.Text)<>'' then
    BitBtnClearEditFIO.Enabled:=True
  else
//иначе кнопка Очистить недоступна для нажатия и FDQuery_SearchFIO(результат поиска) переводится в неактивное состояние
    BitBtnClearEditFIO.Enabled:=False;
    FDQuery_SearchFIO.Active:=False;
end;

procedure TFrmFind.EditFindPersonKeyPress(Sender: TObject; var Key: Char);
begin
//в поле ввода разрешено вводить только кириллические буквы, знак пробела и backspace
  case Key of
    'А'..'Я','а'..'я',#32,#8:;
  else Key := Chr(0);
  end;
end;

procedure TFrmFind.EditFindPersonKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//если поле ввода не пустое, запускается интерактивный поиск по ФИО
  if EditFindPerson.Text<>'' then
    begin
      FDQuery_SearchFIO.Close;
      FDQuery_SearchFIO.SQL.Clear;
      {выборка записей соответсвующих заданным условиям (в запросе используется параметр fio,
       значение которому присваивается ниже и функция upper приводящая ФИО к верхнему регистру для удобного сравнения) }
      FDQuery_SearchFIO.SQL.Add('select ID_PERSON, "ФИО пациента", "Дата рождения", "Дата внесения" from View_person where upper("ФИО пациента") like upper(:fio) order by "ФИО пациента"');
      FDQuery_SearchFIO.Params.ParamByName('fio').Value:=Trim(EditFindPerson.Text) + '%';//присвоение параметру fio текста из поля ввода (за исключением пробельных и управляющих символов) и символа % (указывает, после введённого пользователем текста могут быть любые символы)
      FDQuery_SearchFIO.Open;
      FDQuery_SearchFIO.Close;
      FDQuery_SearchFIO.Active:=True;
    end;
end;

end.
