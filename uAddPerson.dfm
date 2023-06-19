object FrmAddPerson: TFrmAddPerson
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 305
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 241
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = LabelFIO
      end
      item
        Control = EditFIO
      end
      item
        Control = LabelDateBirth
      end
      item
        Control = CalendarPickerDateB
      end
      item
        Control = LabelDateEntry
      end
      item
        Control = CalendarPickerDateE
      end>
    Padding.Left = 20
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 20
    Spacing = 5
    TabOrder = 0
    object LabelFIO: TLabel
      Left = 20
      Top = 20
      Width = 139
      Height = 26
      Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
    end
    object EditFIO: TEdit
      Left = 20
      Top = 51
      Width = 325
      Height = 34
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditFIOKeyPress
    end
    object LabelDateBirth: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 100
      Width = 144
      Height = 26
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
    end
    object CalendarPickerDateB: TCalendarPicker
      Left = 20
      Top = 131
      Width = 325
      Height = 32
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -13
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -20
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Avenir Next'
      Font.Style = []
      OnChange = CalendarPickerDateBChange
      ParentFont = False
      TabOrder = 1
      TextHint = #1074#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091
    end
    object LabelDateEntry: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 178
      Width = 135
      Height = 26
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
    end
    object CalendarPickerDateE: TCalendarPicker
      Left = 20
      Top = 209
      Width = 325
      Height = 32
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -13
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -20
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      Color = clWindow
      Date = 45091.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Avenir Next'
      Font.Style = []
      IsEmpty = False
      OnChange = CalendarPickerDateEChange
      ParentFont = False
      TabOrder = 2
      TextHint = #1074#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091
    end
  end
  object StackPanel2: TStackPanel
    Left = 112
    Top = 241
    Width = 252
    Height = 64
    Align = alRight
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = BtnSaveAddPerson
      end
      item
        Control = BtnCancel
      end>
    HorizontalPositioning = sphpRight
    Orientation = spoHorizontal
    Spacing = 10
    TabOrder = 1
    object BtnSaveAddPerson: TButton
      AlignWithMargins = True
      Left = 3
      Top = 15
      Width = 126
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnSaveAddPersonClick
    end
    object BtnCancel: TButton
      AlignWithMargins = True
      Left = 145
      Top = 15
      Width = 88
      Height = 33
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
  end
  object FDStoredProc_AddPerson: TFDStoredProc
    ConnectionName = 'orcl_connect'
    StoredProcName = 'PROC_ADDPERSON'
    Left = 8
    Top = 248
    ParamData = <
      item
        Position = 1
        Name = 'PFIO'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'PDATEBIRTH'
        DataType = ftDateTime
        FDDataType = dtDateTime
        NumericScale = 1000
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'PDATE_ENTRY'
        DataType = ftDateTime
        FDDataType = dtDateTime
        NumericScale = 1000
        ParamType = ptInput
      end>
  end
end
