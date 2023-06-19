object FrmSelectWorkstation: TFrmSelectWorkstation
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1040#1056#1052
  ClientHeight = 182
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnWorkOperator: TBitBtn
    Left = 40
    Top = 24
    Width = 200
    Height = 50
    Caption = #1040#1056#1052' '#1054#1087#1077#1088#1072#1090#1086#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = BitBtnWorkOperatorClick
  end
  object BitBtnWorkStatist: TBitBtn
    Left = 40
    Top = 98
    Width = 200
    Height = 50
    Caption = #1040#1056#1052' '#1057#1090#1072#1090#1080#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Avenir Next Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = BitBtnWorkStatistClick
  end
end
