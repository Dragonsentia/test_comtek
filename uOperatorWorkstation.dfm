object FrmOperator: TFrmOperator
  Left = 0
  Top = 0
  AlphaBlendValue = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1056#1052' '#1054#1087#1077#1088#1072#1090#1086#1088#1072
  ClientHeight = 609
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Avenir Next'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 26
  object StackPanelStatFind: TStackPanel
    Left = 0
    Top = 0
    Width = 1133
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <>
    TabOrder = 0
    ExplicitWidth = 1137
  end
  object StackPanel1: TStackPanel
    Left = 0
    Top = 167
    Width = 1137
    Height = 66
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = StackPanel5
      end
      item
        Control = StackPanel7
      end>
    Orientation = spoHorizontal
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 1
    VerticalPositioning = spvpTop
    object StackPanel5: TStackPanel
      Left = 10
      Top = 10
      Width = 703
      Height = 83
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = StackPanel2
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end>
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      object StackPanel2: TStackPanel
        Left = 10
        Top = 10
        Width = 683
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = StackPanel4
            HorizontalPositioning = sphpFill
            VerticalPositioning = spvpTop
          end
          item
            Control = StackPanel6
            HorizontalPositioning = sphpRight
            VerticalPositioning = spvpFill
          end>
        Orientation = spoHorizontal
        TabOrder = 0
        object StackPanel4: TStackPanel
          Left = 0
          Top = 0
          Width = 393
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          ControlCollection = <
            item
              Control = BitBtnAddPerson
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpCenter
            end>
          Orientation = spoHorizontal
          TabOrder = 1
          object BitBtnAddPerson: TBitBtn
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 205
            Height = 40
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Avenir Next Medium'
            Font.Style = []
            ParentFont = False
            Style = bsNew
            TabOrder = 0
            OnClick = BitBtnAddPersonClick
          end
        end
        object StackPanel6: TStackPanel
          Left = 395
          Top = 0
          Width = 295
          Height = 55
          Align = alRight
          BevelOuter = bvNone
          ControlCollection = <
            item
              Control = CheckBox_AllPerson
              HorizontalPositioning = sphpRight
              VerticalPositioning = spvpFill
            end>
          TabOrder = 0
          object CheckBox_AllPerson: TCheckBox
            AlignWithMargins = True
            Left = 64
            Top = 3
            Width = 228
            Height = 46
            Align = alRight
            Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Avenir Next'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = CheckBox_AllPersonClick
          end
        end
      end
    end
    object StackPanel7: TStackPanel
      Left = 715
      Top = 10
      Width = 424
      Height = 453
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = StackPanel8
          HorizontalPositioning = sphpFill
          VerticalPositioning = spvpTop
        end
        item
          Control = StackPanel3
        end>
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      object StackPanel8: TStackPanel
        Left = 10
        Top = 10
        Width = 404
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = BitBtnAddMedReport
          end>
        TabOrder = 1
        object BitBtnAddMedReport: TBitBtn
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 205
          Height = 40
          Margins.Left = 8
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1088#1072#1074#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Avenir Next Medium'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtnAddMedReportClick
        end
      end
      object StackPanel3: TStackPanel
        Left = 10
        Top = 67
        Width = 393
        Height = 38
        BevelOuter = bvNone
        ControlCollection = <>
        TabOrder = 0
      end
    end
  end
  object StackPanel9: TStackPanel
    Left = 0
    Top = 232
    Width = 1137
    Height = 369
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = StackPanel10
      end
      item
        Control = StackPanel11
      end>
    Orientation = spoHorizontal
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 2
    object StackPanel10: TStackPanel
      Left = 10
      Top = -5
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
    object StackPanel11: TStackPanel
      Left = 723
      Top = 4
      Width = 385
      Height = 362
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
        Height = 345
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
  object View_person: TFDQuery
    ConnectionName = 'orcl_connect'
    Left = 210
    Top = 362
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
end
