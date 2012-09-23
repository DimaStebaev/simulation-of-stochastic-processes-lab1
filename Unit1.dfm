object Form1: TForm1
  Left = 241
  Top = 199
  Width = 872
  Height = 693
  Caption = 'Form1'
  Color = clBtnFace
  Constraints.MinHeight = 693
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TStringGrid
    Left = 200
    Top = 0
    Width = 662
    Height = 640
    ColCount = 10
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goVertLine, goHorzLine]
    ParentFont = False
    TabOrder = 0
    OnDrawCell = gridDrawCell
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 640
    Width = 864
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 500
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 81
    Caption = 'Field'
    TabOrder = 2
    object Label1: TLabel
      Left = 33
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Height'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 34
      Top = 49
      Width = 28
      Height = 13
      Caption = 'Width'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object HeightEdit: TEdit
      Left = 72
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '10'
      OnChange = HeightEditChange
    end
    object WidthEdit: TEdit
      Left = 72
      Top = 45
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '10'
      OnChange = WidthEditChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 185
    Height = 73
    Caption = 'Initial point'
    TabOrder = 3
    object Label3: TLabel
      Left = 38
      Top = 18
      Width = 19
      Height = 13
      Caption = 'Top'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 39
      Top = 42
      Width = 18
      Height = 13
      Caption = 'Left'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TopEdit: TEdit
      Left = 67
      Top = 14
      Width = 80
      Height = 21
      TabOrder = 0
      Text = '5'
      OnChange = TopEditChange
    end
    object LeftEdit: TEdit
      Left = 67
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 1
      Text = '5'
      OnChange = LeftEditChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 176
    Width = 185
    Height = 345
    Caption = 'Probabilities'
    TabOrder = 4
    object LeftLabel: TLabel
      Left = 12
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Left: 20%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object RightLabel: TLabel
      Left = 12
      Top = 88
      Width = 51
      Height = 13
      Caption = 'Right: 20%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object UpLabel: TLabel
      Left = 12
      Top = 152
      Width = 40
      Height = 13
      Caption = 'Up: 20%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DownLabel: TLabel
      Left = 12
      Top = 216
      Width = 54
      Height = 13
      Caption = 'Down: 20%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object HereLabel: TLabel
      Left = 12
      Top = 276
      Width = 49
      Height = 13
      Caption = 'Here: 20%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LeftTrackBar: TTrackBar
      Left = 12
      Top = 40
      Width = 157
      Height = 45
      Max = 100
      Frequency = 10
      Position = 20
      TabOrder = 0
      OnChange = TrackBarChange
    end
    object RightTrackBar: TTrackBar
      Left = 12
      Top = 104
      Width = 157
      Height = 45
      Max = 100
      Frequency = 10
      Position = 20
      TabOrder = 1
      OnChange = TrackBarChange
    end
    object UpTrackBar: TTrackBar
      Left = 12
      Top = 168
      Width = 157
      Height = 45
      Max = 100
      Frequency = 10
      Position = 20
      TabOrder = 2
      OnChange = TrackBarChange
    end
    object DownTrackBar: TTrackBar
      Left = 12
      Top = 232
      Width = 157
      Height = 45
      Max = 100
      Frequency = 10
      Position = 20
      TabOrder = 3
      OnChange = TrackBarChange
    end
    object HereTrackBar: TTrackBar
      Left = 12
      Top = 292
      Width = 157
      Height = 45
      Max = 100
      Frequency = 10
      Position = 20
      TabOrder = 4
      OnChange = TrackBarChange
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 528
    Width = 185
    Height = 105
    Caption = 'Simulation'
    TabOrder = 5
    object Label9: TLabel
      Left = 4
      Top = 32
      Width = 103
      Height = 13
      Caption = 'Number of simulations'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NumberEdit: TEdit
      Left = 116
      Top = 28
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '1000'
      OnChange = NumberEditChange
    end
    object SimulateButton: TButton
      Left = 55
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Simulate'
      TabOrder = 1
      OnClick = SimulateButtonClick
    end
  end
  object ProgressBar: TProgressBar
    Left = 544
    Top = 576
    Width = 150
    Height = 17
    TabOrder = 6
  end
  object XPManifest1: TXPManifest
    Left = 824
    Top = 544
  end
end
