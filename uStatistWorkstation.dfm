object FrmStatist: TFrmStatist
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1056#1052' '#1057#1090#1072#1090#1080#1089#1090#1072
  ClientHeight = 658
  ClientWidth = 1137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object StackPanelStatFind: TStackPanel
    Left = 0
    Top = 0
    Width = 1137
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <>
    TabOrder = 0
  end
  object StackPanel1: TStackPanel
    Left = 0
    Top = 161
    Width = 1137
    Height = 109
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = StackPanel4
        HorizontalPositioning = sphpFill
        VerticalPositioning = spvpFill
      end
      item
        Control = StackPanel5
      end
      item
        Control = StackPanel6
        HorizontalPositioning = sphpRight
        VerticalPositioning = spvpCenter
      end>
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 1
    ExplicitTop = 152
    object StackPanel4: TStackPanel
      Left = 10
      Top = 10
      Width = 1117
      Height = 51
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = CheckBox_DateEntry
          VerticalPositioning = spvpCenter
        end
        item
          Control = Label2
          VerticalPositioning = spvpCenter
        end
        item
          Control = CalendPickerStartDateE
          VerticalPositioning = spvpCenter
        end
        item
          Control = Label1
          VerticalPositioning = spvpCenter
        end
        item
          Control = CalendPickerEndDateE
          VerticalPositioning = spvpCenter
        end>
      Orientation = spoHorizontal
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      VerticalPositioning = spvpTop
      object CheckBox_DateEntry: TCheckBox
        AlignWithMargins = True
        Left = 15
        Top = 17
        Width = 186
        Height = 17
        Margins.Left = 5
        Margins.Right = 0
        Caption = #1055#1086' '#1076#1072#1090#1077' '#1074#1085#1077#1089#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox_DateEntryClick
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 206
        Top = 13
        Width = 10
        Height = 26
        Caption = #1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        ParentFont = False
      end
      object CalendPickerStartDateE: TCalendarPicker
        AlignWithMargins = True
        Left = 224
        Top = 10
        Width = 158
        Height = 32
        Margins.Right = 5
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
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        OnChange = CalendPickerStartDateEChange
        ParentFont = False
        TabOrder = 0
        TextHint = #1074#1085#1077#1089#1080#1090#1077' '#1076#1072#1090#1091
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 394
        Top = 14
        Width = 20
        Height = 22
        Margins.Left = 5
        Margins.Right = 5
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        ParentFont = False
      end
      object CalendPickerEndDateE: TCalendarPicker
        AlignWithMargins = True
        Left = 426
        Top = 10
        Width = 150
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
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
        Enabled = False
        FirstDayOfWeek = dwMonday
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        OnChange = CalendPickerEndDateEChange
        ParentFont = False
        TabOrder = 1
        TextHint = #1074#1085#1077#1089#1080#1090#1077' '#1076#1072#1090#1091
      end
    end
    object StackPanel5: TStackPanel
      Left = 10
      Top = 63
      Width = 1084
      Height = 54
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = CheckBox_DateBirth
          VerticalPositioning = spvpCenter
        end
        item
          Control = Label3
          VerticalPositioning = spvpCenter
        end
        item
          Control = CalendPickerStartDateB
          VerticalPositioning = spvpCenter
        end
        item
          Control = Label5
          VerticalPositioning = spvpCenter
        end
        item
          Control = CalendPickerEndDateB
          VerticalPositioning = spvpCenter
        end
        item
          Control = BitBtn_FindPerson
        end
        item
          Control = BitBtnResetAll
        end>
      Orientation = spoHorizontal
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      VerticalPositioning = spvpTop
      object CheckBox_DateBirth: TCheckBox
        AlignWithMargins = True
        Left = 15
        Top = 18
        Width = 190
        Height = 17
        Margins.Left = 5
        Margins.Right = 0
        Caption = #1055#1086' '#1076#1072#1090#1077' '#1088#1086#1078#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox_DateBirthClick
      end
      object Label3: TLabel
        Left = 207
        Top = 14
        Width = 10
        Height = 26
        Caption = #1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        ParentFont = False
      end
      object CalendPickerStartDateB: TCalendarPicker
        AlignWithMargins = True
        Left = 224
        Top = 11
        Width = 158
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
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
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        OnChange = CalendPickerStartDateBChange
        ParentFont = False
        TabOrder = 0
        TextHint = #1074#1085#1077#1089#1080#1090#1077' '#1076#1072#1090#1091
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 394
        Top = 16
        Width = 20
        Height = 22
        Margins.Left = 5
        Margins.Right = 5
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        ParentFont = False
      end
      object CalendPickerEndDateB: TCalendarPicker
        AlignWithMargins = True
        Left = 426
        Top = 11
        Width = 150
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
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
        Enabled = False
        FirstDayOfWeek = dwMonday
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Avenir Next '
        Font.Style = []
        OnChange = CalendPickerEndDateBChange
        ParentFont = False
        TabOrder = 1
        TextHint = #1074#1085#1077#1089#1080#1090#1077' '#1076#1072#1090#1091
      end
      object BitBtn_FindPerson: TBitBtn
        AlignWithMargins = True
        Left = 613
        Top = 10
        Width = 85
        Height = 35
        Margins.Left = 30
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Caption = #1055#1086#1080#1089#1082
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next Medium'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn_FindPersonClick
      end
      object BitBtnResetAll: TBitBtn
        Left = 710
        Top = 10
        Width = 147
        Height = 35
        Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1074#1089#1105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next Medium'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtnResetAllClick
      end
    end
    object StackPanel6: TStackPanel
      Left = 612
      Top = 119
      Width = 515
      Height = 31
      BevelOuter = bvNone
      ControlCollection = <>
      HorizontalPositioning = sphpRight
      Orientation = spoHorizontal
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 2
      VerticalPositioning = spvpTop
    end
  end
  object StackPanel2: TStackPanel
    Left = 0
    Top = 270
    Width = 1137
    Height = 388
    Align = alClient
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = StackPanel7
      end
      item
        Control = StackPanel3
      end>
    Orientation = spoHorizontal
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 2
    ExplicitHeight = 410
    object StackPanel7: TStackPanel
      Left = 10
      Top = 4
      Width = 711
      Height = 380
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = DBGrid1
        end>
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 13
        Top = 13
        Width = 682
        Height = 344
        DataSource = DataSource_Person
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -19
            Title.Font.Name = 'Avenir Next Medium'
            Title.Font.Style = []
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -19
            Title.Font.Name = 'Avenir Next Medium'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -19
            Title.Font.Name = 'Avenir Next Medium'
            Title.Font.Style = []
            Width = 146
            Visible = True
          end>
      end
    end
    object StackPanel3: TStackPanel
      Left = 723
      Top = 14
      Width = 403
      Height = 360
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = DBGrid2
        end>
      TabOrder = 1
      object DBGrid2: TDBGrid
        AlignWithMargins = True
        Left = 12
        Top = 3
        Width = 380
        Height = 344
        Margins.Left = 12
        DataSource = DataSource_MedReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Avenir Next'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = #1050#1086#1076' '#1089#1087#1088#1072#1074#1082#1080
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -19
            Title.Font.Name = 'Avenir Next Medium'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -19
            Title.Font.Name = 'Avenir Next Medium'
            Title.Font.Style = []
            Width = 195
            Visible = True
          end>
      end
    end
  end
  object DataSource_Person: TDataSource
    DataSet = View_person
    Left = 352
    Top = 345
  end
  object DataSource_MedReport: TDataSource
    DataSet = View_medreport
    Left = 824
    Top = 313
  end
  object View_medreport: TFDQuery
    ConnectionName = 'orcl_connect'
    Left = 919
    Top = 310
  end
  object View_person: TFDQuery
    ConnectionName = 'orcl_connect'
    Left = 210
    Top = 362
  end
end
