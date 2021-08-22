object Main: TMain
  Left = 221
  Top = 552
  AutoScroll = False
  Caption = 'Main'
  ClientHeight = 315
  ClientWidth = 477
  Color = clBtnFace
  Constraints.MinHeight = 234
  Constraints.MinWidth = 378
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Terminal'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object ing_ngimg: TImage
    Left = 424
    Top = 8
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      000010000000010018000000000000030000120B0000120B0000000000000000
      0000FFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFF0000FF000080
      000080808080FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000
      80808080FFFFFF0000FF000080000080000080000080808080FFFFFFFFFFFFFF
      FFFFFFFFFF0000FF000080000080000080000080808080000080000080000080
      000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000
      80000080000080000080000080000080000080808080FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080000080000080
      808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      80000080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080808080
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
      80000080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FF000080000080000080808080000080000080000080
      808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000
      80808080FFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF0000FF000080000080808080FFFFFFFFFFFFFFFFFF0000FF000080
      000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FF0000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Transparent = True
    Visible = False
  end
  object ing_okimg: TImage
    Left = 408
    Top = 8
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      000010000000010018000000000000030000120B0000120B0000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000
      00800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF800000008000008000800000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000080000080
      00008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF800000008000008000008000008000008000008000800000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000800000800000800000FF
      00008000008000008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF00800000800000800000FF00FFFFFF00FF00008000008000008000800000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000800000FF00FFFFFFFFFF
      FFFFFFFF00FF00008000008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00008000008000
      008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00FF00008000008000008000800000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00
      008000008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00008000008000008000800000FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF00FF00008000008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000800000800080
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FF00008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00FF
      FFFF}
    Transparent = True
    Visible = False
  end
  object OutputPathLbl: TLabel
    Left = 88
    Top = 8
    Width = 78
    Height = 13
    Caption = 'OutputPathLbl'
  end
  object prgbar: TProgressBar
    Left = 8
    Top = 32
    Width = 385
    Height = 15
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 296
    Width = 477
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QueueGrid: TStringGrid
    Left = 8
    Top = 56
    Width = 385
    Height = 233
    ColCount = 2
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRowSelect, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 2
    OnDrawCell = QueueGridDrawCell
    OnKeyUp = QueueGridKeyUp
    OnMouseDown = QueueGridMouseDown
    OnMouseUp = QueueGridMouseUp
  end
  object OutputPathChangeBtn: TButton
    Left = 320
    Top = 5
    Width = 75
    Height = 20
    Caption = 'Change'
    TabOrder = 3
    OnClick = OutputPathChangeBtnClick
  end
  object Button1: TButton
    Left = 8
    Top = 5
    Width = 75
    Height = 20
    Caption = 'Get YouTube'
    TabOrder = 4
    OnClick = Button1Click
  end
  object EncodeProcTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = EncodeProcTimerTimer
    Left = 440
    Top = 176
  end
  object StartupTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StartupTimerTimer
    Left = 408
    Top = 32
  end
  object EncodeStartTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = EncodeStartTimerTimer
    Left = 408
    Top = 176
  end
  object PreencodeffmpegTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = PreencodeffmpegTimerTimer
    Left = 440
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 64
    object MainMenu_Option: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Option'
      OnClick = MainMenu_OptionClick
    end
    object MainMenu_ShowLog: TMenuItem
      Caption = 'ShowLog'
      OnClick = MainMenu_ShowLogClick
    end
    object MainMenu_Language: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Language'
      object MainMenu_Language_Template: TMenuItem
        Caption = 'Menu_Language_Template'
        OnClick = MainMenu_Language_TemplateClick
      end
    end
    object MainMenu_About: TMenuItem
      AutoHotkeys = maManual
      Caption = 'About'
      OnClick = MainMenu_AboutClick
    end
    object MainMenu_AutoShutdown: TMenuItem
      Caption = 'AutoShutdown'
      OnClick = MainMenu_AutoShutdownClick
    end
  end
  object StandbyTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StandbyTimerTimer
    Left = 408
    Top = 112
  end
  object QueuePopup: TPopupMenu
    AutoPopup = False
    Left = 440
    Top = 32
    object QueuePopup_Delete: TMenuItem
      Caption = 'Cancel this'
      OnClick = QueuePopup_DeleteClick
    end
  end
  object OutputPathDlg: TSaveDialog
    Left = 440
    Top = 64
  end
  object EncodeEndTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = EncodeEndTimerTimer
    Left = 408
    Top = 208
  end
  object PreencodeAutoDetectTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = PreencodeAutoDetectTimerTimer
    Left = 408
    Top = 144
  end
end