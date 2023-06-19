object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = #1040#1056#1052' '#1054#1087#1077#1088#1072#1090#1086#1088'/'#1057#1090#1072#1090#1080#1089#1090
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object MenuItemOperator: TMenuItem
        Caption = #1040#1056#1052' '#1054#1087#1077#1088#1072#1090#1086#1088#1072
        OnClick = MenuItemOperatorClick
      end
      object MenuItemStatist: TMenuItem
        Caption = #1040#1056#1052' '#1057#1090#1072#1090#1080#1089#1090#1072
        OnClick = MenuItemStatistClick
      end
    end
    object CloseWindows: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1086#1082#1085#1072
      OnClick = CloseWindowsClick
    end
  end
  object Orcl_connectConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=orcl_connect'
      'CharacterSet=<NLS_LANG>')
    Connected = True
    LoginPrompt = False
    Left = 559
    Top = 8
  end
end
