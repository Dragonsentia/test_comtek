object FrmFind: TFrmFind
  Left = 0
  Top = 0
  AlphaBlendValue = 100
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmFind'
  ClientHeight = 201
  ClientWidth = 1155
  Color = 16448255
  TransparentColorValue = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    AlignWithMargins = True
    Left = 24
    Top = 10
    Width = 161
    Height = 26
    Margins.Left = 11
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next Medium'
    Font.Style = []
    ParentFont = False
  end
  object EditFindPerson: TEdit
    Left = 24
    Top = 48
    Width = 353
    Height = 34
    HelpType = htKeyword
    HelpKeyword = ' '#1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102' '
    TabStop = False
    BevelEdges = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102
    OnChange = EditFindPersonChange
    OnKeyPress = EditFindPersonKeyPress
    OnKeyUp = EditFindPersonKeyUp
  end
  object BitBtnClearEditFIO: TBitBtn
    Left = 383
    Top = 47
    Width = 105
    Height = 37
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtnClearEditFIOClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 665
    Height = 63
    BorderStyle = bsNone
    Color = 16448255
    Ctl3D = True
    DataSource = DataSource_SearchFIO
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clWindow
        Expanded = False
        FieldName = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        Title.Caption = #1060#1048#1054
        Title.Color = 16448255
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Avenir Next Medium'
        Title.Font.Style = []
        Width = 350
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Title.Color = 16448255
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Avenir Next Medium'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
        Title.Color = 16448255
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Avenir Next Medium'
        Title.Font.Style = []
        Width = 146
        Visible = True
      end>
  end
  object FDQuery_SearchFIO: TFDQuery
    ConnectionName = 'orcl_connect'
    Left = 624
    Top = 32
  end
  object DataSource_SearchFIO: TDataSource
    DataSet = FDQuery_SearchFIO
    Left = 736
    Top = 24
  end
end
