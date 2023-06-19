object FrmAddMedReport: TFrmAddMedReport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmAddMedReport'
  ClientHeight = 309
  ClientWidth = 423
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
    Width = 423
    Height = 251
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
        Control = LabelMedReports
      end
      item
        Control = ComboBox_NameMrep
      end
      item
        Control = LabelDateEntry
      end
      item
        Control = CalendarPickerDateMrep
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
      Width = 382
      Height = 34
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object LabelMedReports: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 100
      Width = 151
      Height = 26
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1042#1099#1076#1072#1085#1072' '#1089#1087#1088#1072#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox_NameMrep: TComboBox
      Left = 20
      Top = 131
      Width = 125
      Height = 34
      BevelOuter = bvNone
      Style = csDropDownList
      ExtendedUI = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = '989/'#1085
      Items.Strings = (
        '989/'#1085
        '071/'#1091
        '086/'#1091
        '003-'#1042'/'#1059
        '002-'#1054'/'#1091
        '003-'#1054'/'#1091)
    end
    object LabelDateEntry: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 180
      Width = 116
      Height = 26
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Avenir Next Medium'
      Font.Style = []
      ParentFont = False
    end
    object CalendarPickerDateMrep: TCalendarPicker
      Left = 20
      Top = 211
      Width = 151
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
      ParentFont = False
      TabOrder = 1
      TextHint = #1074#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091
    end
  end
  object StackPanel2: TStackPanel
    Left = 139
    Top = 251
    Width = 284
    Height = 58
    Align = alRight
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = BtnSaveAddMedReport
      end
      item
        Control = BtnCancel
      end>
    HorizontalPositioning = sphpRight
    Orientation = spoHorizontal
    Spacing = 10
    TabOrder = 1
    object BtnSaveAddMedReport: TButton
      AlignWithMargins = True
      Left = 3
      Top = 12
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
      OnClick = BtnSaveAddMedReportClick
    end
    object BtnCancel: TButton
      AlignWithMargins = True
      Left = 145
      Top = 12
      Width = 126
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
  object FDStoredProc_AddMedReport: TFDStoredProc
    ConnectionName = 'orcl_connect'
    StoredProcName = 'PROC_ADDMEDREPORT'
    Left = 152
    Top = 232
    ParamData = <
      item
        Position = 1
        Name = 'PNAME_MREP'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'PID_PERSON'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'PDATE_MREP'
        DataType = ftDateTime
        FDDataType = dtDateTime
        NumericScale = 1000
        ParamType = ptInput
      end>
  end
end
