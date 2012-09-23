unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs,  Grids, ExtCtrls, ComCtrls, XPMan, ToolWin, Mask, math,
  globals, logic,  Classes, StdCtrls, syncobjs, TeEngine, TeeFunci, Series,
  TeeProcs, Chart;
type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    StatusBar: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    LeftTrackBar: TTrackBar;
    GroupBox1: TGroupBox;
    HeightEdit: TEdit;
    WidthEdit: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    TopEdit: TEdit;
    LeftEdit: TEdit;
    GroupBox3: TGroupBox;
    LeftLabel: TLabel;
    RightLabel: TLabel;
    RightTrackBar: TTrackBar;
    UpLabel: TLabel;
    UpTrackBar: TTrackBar;
    DownLabel: TLabel;
    DownTrackBar: TTrackBar;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    NumberEdit: TEdit;
    SimulateButton: TButton;
    HereLabel: TLabel;
    HereTrackBar: TTrackBar;
    ProgressBar: TProgressBar;
    Chart3D: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Chart2DLeft: TChart;
    Chart2DBottom: TChart;
    Chart2DTop: TChart;
    Chart2DRight: TChart;
    ChartDisp: TChart;
    Series3: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SimulateButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function GetActiveProcessAmount():integer;
    procedure Visualize();
  private
     TestAmount: integer;
  public
     FieldHeight, FieldWidth, X0, Y0: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  style: cardinal;
begin
  style := GetWindowLong(WidthEdit.Handle, GWL_STYLE);
  SetWindowLong(WidthEdit.Handle, GWL_STYLE, style + ES_NUMBER);
  style := GetWindowLong(HeightEdit.Handle, GWL_STYLE);
  SetWindowLong(HeightEdit.Handle, GWL_STYLE, style + ES_NUMBER);

  style := GetWindowLong(LeftEdit.Handle, GWL_STYLE);
  SetWindowLong(LeftEdit.Handle, GWL_STYLE, style + ES_NUMBER);
  style := GetWindowLong(TopEdit.Handle, GWL_STYLE);
  SetWindowLong(TopEdit.Handle, GWL_STYLE, style + ES_NUMBER);

  style := GetWindowLong(NumberEdit.Handle, GWL_STYLE);
  SetWindowLong(NumberEdit.Handle, GWL_STYLE, style + ES_NUMBER);

  heretrackbar.OnChange( heretrackbar );
  X0 := StrToInt(leftEdit.Text);
  Y0 := Strtoint(topedit.Text);
  TestAmount := strtoint(NumberEdit.Text);

  //setLength(matrix, grid.RowCount, grid.ColCount);
  //matrix :=TGlobalMatrix.Create(0,0);

  progressbar.Parent := statusbar;
  progressbar.Top := 2;
  with ProgressBar do
  begin
    Parent := StatusBar;
    Top := 2;
    Left := statusbar.Panels[0].Width;
    Height := StatusBar.Height - Top;
    Width := StatusBar.Width - Left;
  end;
  globals.APsection := tcriticalsection.Create;
  RESsection :=  tcriticalsection.Create;
  Randomize;
end;

procedure TForm1.TrackBarChange(Sender: TObject);
var
  TrackBars: array [1..5] of ^TTrackBar;
  i, j, sum, oldsum: integer;
begin
  TrackBars[1] := @lefttrackbar;
  TrackBars[2] := @righttrackbar;
  TrackBars[3] := @uptrackbar;
  TrackBars[4] := @downtrackbar;
  Trackbars[5] := @HereTrackBar;

  sum:= 100;
  j:=0;
  for i:=1 to length(Trackbars) do
    if  trackbars[i]^ <> Sender then sum := sum - trackbars[i].Position
    else
      begin
        j := i+1;
        break;
      end;
  if (sender as TTrackBar).Position > sum then
    (sender as TTrackBar).Position := sum;
  sum := sum - (sender as TTrackBar).Position;

  oldsum:=0;
  for i:=j to length(TrackBars) do
    oldsum := oldsum + trackbars[i].Position;

  for i:=j to length(TrackBars) do
    if oldsum>0 then
      trackbars[i].Position := trackbars[i].Position*sum div oldsum
    else
      trackbars[i].Position := sum div (length(TrackBars) - j + 1);

  sum:=0;
  for i:=1 to length(trackbars) do
    sum:=sum+trackbars[i].Position;
  trackbars[length(trackbars)].Position := trackbars[length(trackbars)].Position + 100 - sum;

  leftlabel.Caption := 'Left: '+inttostr(leftTrackBar.Position)+'%';
  rightlabel.Caption := 'Right: '+inttostr(RightTrackBar.Position)+'%';
  Uplabel.Caption := 'Up: '+inttostr(UpTrackBar.Position)+'%';
  Downlabel.Caption := 'Down: '+inttostr(DownTrackBar.Position)+'%';
  Herelabel.Caption := 'Here: '+inttostr(HereTrackBar.Position)+'%';
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  statusbar.Width:=form1.ClientWidth;
  statusbar.Panels[0].Width := form1.ClientWidth div 2;
  progressbar.Left := statusbar.Panels[0].Width;
  progressbar.Width := statusbar.ClientWidth - progressbar.Left - 20;

  Chart3D.Top:=GroupBox1.Top;
  Chart3D.Left:=GroupBox1.Width+GroupBox1.Left*2;
  Chart3D.Width:=(form1.ClientWidth - Chart3D.Left)*2 div 3;
  Chart3D.Height:=(form1.ClientHeight-statusbar.Height)*2 div 3;

  Chart2DTop.Top:=Chart3D.Top;
  Chart2DTop.Left:=Chart3D.Left+Chart3D.Width;
  Chart2DTop.Width:=form1.ClientWidth - Chart3D.Left - Chart3D.Width;
  Chart2DTop.Height:=Chart3D.Height div 2;

  Chart2DRight.Top:=Chart2DTop.Top+Chart2DTop.Height;
  Chart2DRight.Left:=Chart2DTop.Left;
  Chart2DRight.Width:=Chart2DTop.Width;
  Chart2DRight.Height:=Chart3D.Height - Chart2DTop.Height;

  Chart2DLeft.Top:=Chart3D.Top+Chart3D.Height;
  Chart2DLeft.Left:=Chart3D.Left;
  Chart2DLeft.Width:=Chart3D.Width div 2;
  Chart2DLeft.Height:=form1.ClientHeight - statusbar.Height - Chart3D.Height - Chart3D.top;

  Chart2DBottom.Top:=Chart2Dleft.Top;
  Chart2DBottom.Left:=Chart3D.Left+Chart2DLeft.Width;
  Chart2DBottom.Width:=Chart3D.Width - Chart2Dleft.Width;
  Chart2DBottom.Height:=Chart2Dleft.Height;

  Chart2DBottom.Top:=Chart2Dleft.Top;
  Chart2DBottom.Left:=Chart3D.Left+Chart2DLeft.Width;
  Chart2DBottom.Width:=Chart3D.Width - Chart2Dleft.Width;
  Chart2DBottom.Height:=Chart2Dleft.Height;

  ChartDisp.Top:=Chart2Dleft.Top;
  ChartDisp.Left:=Chart2Dtop.Left;
  ChartDisp.Width:=Chart2DTop.Width;
  ChartDisp.Height:=Chart2Dleft.Height;
end;

function TForm1.GetActiveProcessAmount():integer;
begin
  APsection.Enter;
  result:=ActiveProcesses;
  APsection.Leave;
end;

procedure TForm1.SimulateButtonClick(Sender: TObject);
var
i, j:integer;
sim: TSim;
s: TSystemInfo;
begin
if simulatebutton.Tag = 0 then
begin
  try
    FieldWidth := strtoint(widthedit.Text);
    FieldHeight := strtoint(Heightedit.Text);
    X0 := StrToInt(LeftEdit.Text);
    Y0 := StrToInt(TopEdit.Text);
    TestAmount := StrToInt(NumberEdit.Text);

    if (FieldWidth <=0) or (FieldHeight <=0) or
        (X0 < 0) or (y0<0) or
        (x0>= FieldWidth) or (y0 >= FieldHeight) or
        (TestAmount <=0)
        then raise Exception.Create('');
  except
    MessageDlg('Wrong input', mtError, [mbOK], 0);
    exit;
  end;

  simulatebutton.Tag := 1;
  simulatebutton.Caption := 'Stop';
  progressbar.Position := 0;
  ready:=0;
  progressbar.Max := TestAmount;

  heightedit.Enabled:=false;
  widthedit.Enabled:=false;
  numberedit.Enabled:=false;

  statusbar.Panels[0].Text:='Working...';

  RESsection.Enter;
  setLength(matrix, FieldHeight, FieldWidth);
  //matrix.resize(FieldHeight, FieldWidth);
  RESsection.Leave;

  for i:=0 to FieldHeight - 1 do
    for j:=0 to FieldWidth -1 do
      matrix[i,j]:=0;
      //matrix.mas[i,j]:=0;
  maxvalue := 0;

  GetSystemInfo(s);

  stop := false;
  for i:=1 to TestAmount do
    if stop then break
    else
    begin
      repeat
        progressbar.Position := ready;
        //statusbar.Panels[0].Text:='Working... ('+inttostr(ready)+'/'+inttostr(testamount)+')';
        application.ProcessMessages;
      until GetActiveProcessAmount<5*integer(s.dwNumberOfProcessors);

      sim := TSim.Create(true);
      sim.FreeOnTerminate:=true;
      sim.Priority:=tpNormal;
      APsection.Enter;
      inc(ActiveProcesses);
      APsection.Leave;
      sim.Resume;
    end;
  while GetActiveProcessAmount>0 do application.ProcessMessages;
  if simulatebutton.Tag = 1 then simulatebutton.Click;
end
else
begin
  stop:= true;
  simulatebutton.Enabled:=false;
  statusbar.Panels[0].Text:='Stopping...';
  while GetActiveProcessAmount>0 do application.ProcessMessages;
  simulatebutton.Enabled:=true;
  RESsection.Enter;
  //for i:=0 to FieldHeight - 1 do
  //  matrix[i]:=nil;
  //matrix:=nil;
  Visualize;
  SetLength(matrix, 0, 0);
  //matrix.resize(0,0);
  RESsection.Leave;
  progressbar.Position:=0;

  simulatebutton.Tag := 0;
  simulatebutton.Caption := 'Simulate';
  heightedit.Enabled:=true;
  widthedit.Enabled:=true;
  numberedit.Enabled:=true;
  statusbar.Panels[0].Text:='Ready';
end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  APsection.Free;
  RESsection.Free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if(simulatebutton.Tag = 1) then
    simulatebutton.Click;
  while (GetActiveProcessAmount>0) do
    application.ProcessMessages;
end;

procedure TForm1.Visualize;
var
M, D: Real;
i, j, n: integer;
begin
chart3D.FreeAllSeries;
for i:=0 to fieldHeight-1 do
begin
  chart3d.AddSeries(TLineSeries.Create(Self));
  for j:=0 to fieldWidth-1 do
    chart3d.Series[i].AddXY(j, matrix[i,j]);
end;

Chart2DTop.FreeAllSeries;
chart2DTop.AddSeries(TLineSeries.Create(Self));
for i:=0 to fieldWidth-1 do
  chart2DTop.Series[0].AddXY(i, matrix[0,i]);

Chart2DRight.FreeAllSeries;
chart2DRight.AddSeries(TLineSeries.Create(Self));
for i:=0 to fieldHeight-1 do
  chart2dRight.Series[0].AddXY(i, matrix[i,FieldWidth-1]);

Chart2DBottom.FreeAllSeries;
chart2DBottom.AddSeries(TLineSeries.Create(Self));
for i:=0 to fieldWidth-1 do
  chart2DBottom.Series[0].AddXY(i, matrix[FieldHeight-1,i]);

Chart2DLeft.FreeAllSeries;
chart2DLeft.AddSeries(TLineSeries.Create(Self));
for i:=0 to fieldHeight-1 do
  chart2dLeft.Series[0].AddXY(i, matrix[i,0]);

ChartDisp.FreeAllSeries;
ChartDisp.AddSeries(TBarSeries.Create(self));
ChartDisp.Series[0].Title:='Top';
m:=0;
d:=0;
n:=0;
for i:=0 to FieldWidth-1 do
begin
  m:=m+matrix[0, i]*i;
  d := d + matrix[0,i]*i*i;
  n:= n+matrix[0,i];
end;
m := m / n;
d := d / n - m*m;
ChartDisp.series[0].Add(d);

ChartDisp.AddSeries(TBarSeries.Create(self));
ChartDisp.Series[1].Title:='Right';
m:=0;
d:=0;
n:=0;
for i:=0 to FieldHeight-1 do
begin
  m:=m+matrix[i, FieldWidth-1]*i;
  d := d + matrix[i, FieldWidth-1]*i*i;
  n := n + matrix[i, FieldWidth-1];
end;
m := m / n;
d := d / n - m*m;
ChartDisp.series[1].Add(d);

ChartDisp.AddSeries(TBarSeries.Create(self));
ChartDisp.Series[2].Title:='Bottom';
m:=0;
d:=0;
n:=0;
for i:=0 to FieldWidth-1 do
begin
  m:=m+matrix[FieldHeight-1, i]*i;
  d := d + matrix[FieldHeight-1,i]*i*i;
  n:= n+matrix[FieldHeight-1,i];
end;
m := m / n;
d := d / n - m*m;
ChartDisp.series[2].Add(d);

ChartDisp.AddSeries(TBarSeries.Create(self));
ChartDisp.Series[3].Title:='Left';
m:=0;
d:=0;
n:=0;
for i:=0 to FieldHeight-1 do
begin
  m:=m+matrix[i, 0]*i;
  d := d + matrix[i, 0]*i*i;
  n := n + matrix[i, 0];
end;
m := m / n;
d := d / n - m*m;
ChartDisp.series[3].Add(d);

end;

end.
