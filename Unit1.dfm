object Form1: TForm1
  Left = 193
  Top = 113
  Width = 871
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
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTop: TLabel
    Left = 664
    Top = 480
    Width = 22
    Height = 13
    Caption = 'Top:'
  end
  object LabelRight: TLabel
    Left = 664
    Top = 496
    Width = 28
    Height = 13
    Caption = 'Right:'
  end
  object LabelBottom: TLabel
    Left = 664
    Top = 520
    Width = 36
    Height = 13
    Caption = 'Bottom:'
  end
  object LabelLeft: TLabel
    Left = 664
    Top = 536
    Width = 21
    Height = 13
    Caption = 'Left:'
  end
  object LabelInside: TLabel
    Left = 672
    Top = 568
    Width = 31
    Height = 13
    Caption = 'Inside:'
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 640
    Width = 863
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
    TabOrder = 1
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
    end
    object WidthEdit: TEdit
      Left = 72
      Top = 45
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '10'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 185
    Height = 73
    Caption = 'Initial point'
    TabOrder = 2
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
    end
    object LeftEdit: TEdit
      Left = 67
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 1
      Text = '5'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 176
    Width = 185
    Height = 345
    Caption = 'Probabilities'
    TabOrder = 3
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
    TabOrder = 4
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
    Left = 696
    Top = 616
    Width = 150
    Height = 17
    TabOrder = 5
  end
  object Chart2DLeft: TChart
    Left = 208
    Top = 376
    Width = 201
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Left border distribution')
    Legend.Visible = False
    View3D = False
    TabOrder = 6
  end
  object Chart2DBottom: TChart
    Left = 416
    Top = 376
    Width = 233
    Height = 257
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Bottom border distribution')
    Legend.Visible = False
    View3D = False
    TabOrder = 7
  end
  object Chart2DTop: TChart
    Left = 656
    Top = 8
    Width = 201
    Height = 169
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Top border distribution')
    Legend.Visible = False
    View3D = False
    TabOrder = 8
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Chart2DRight: TChart
    Left = 656
    Top = 184
    Width = 201
    Height = 185
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Right border distribution')
    Legend.Visible = False
    View3D = False
    TabOrder = 9
  end
  object ChartDisp: TChart
    Left = 656
    Top = 376
    Width = 161
    Height = 89
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Dispersion')
    TabOrder = 10
    Visible = False
  end
  object Chart3D: TChart
    Left = 200
    Top = 8
    Width = 449
    Height = 361
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Distribution'
      '')
    Legend.Visible = False
    TabOrder = 11
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      MultiBar = mbNone
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clGreen
      MultiBar = mbNone
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series4: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clYellow
      MultiBar = mbNone
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object XPManifest1: TXPManifest
    Left = 824
    Top = 544
  end
end
