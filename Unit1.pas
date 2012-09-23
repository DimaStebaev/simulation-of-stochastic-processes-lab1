unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls, XPMan, ToolWin, Mask, math,  syncobjs;

type
  TForm1 = class(TForm)
    grid: TStringGrid;
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
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure HeightEditChange(Sender: TObject);
    procedure WidthEditChange(Sender: TObject);
    procedure TopEditChange(Sender: TObject);
    procedure LeftEditChange(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure NumberEditChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SimulateButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  APsection, RESsection: tcriticalsection;

implementation

{$R *.dfm}

var
  X0, Y0, TestAmount: integer;
  //matrix: array of array of integer;
  matrix : array[0 .. 1000, 0..1000] of integer;
  ActiveProcesses: integer;
  stop, waitrepaint: boolean;
  maxValue: integer;

type TSim = class(tthread)
  private
    { private declarations }
  protected
    procedure execute; override;
  end;

procedure tsim.execute;
var
rand: integer;
x, y:integer;
begin
x := x0;
y:=y0;

while (x>0) and (x<form1.grid.RowCount-1) and (y>0) and (y<form1.grid.ColCount) do
begin
  if stop then
  begin
    APsection.Enter;
    dec(ActiveProcesses);
    APsection.Leave;
    exit;
  end;
  rand := Random(100);
  if(rand < form1.lefttrackbar.Position) then dec(y)
  else
  begin
    rand := rand - form1.lefttrackbar.Position;
    if rand < form1.RightTrackBar.Position then inc(y)
    else
    begin
        rand := rand - form1.RightTrackBar.Position;
        if rand < form1.UpTrackBar.Position then dec(x)
        else
        begin
            rand := rand - form1.UpTrackBar.Position;
            if rand < form1.DownTrackBar.Position then inc(x)
            else break;
        end;
    end;
  end;
end;
RESsection.Enter;
inc(matrix[x,y]);
if matrix[x,y]>maxvalue then maxvalue :=matrix[x,y]; 
form1.progressbar.Position := form1.progressbar.Position +1;
//form1.grid.Rows[x][y] := inttostr(matrix[x,y]);
if not waitrepaint then
begin
  waitrepaint:=true;
  form1.grid.Repaint;
end;
RESsection.Leave;
APsection.Enter;
dec(ActiveProcesses);
APsection.Leave;
end;

function HSV(Hue, Saturation, Value: integer): COLORREF;
var
Hi:integer;
Vmin, a, Vinc, Vdec: Real;
begin
if (Hue <0) or (Hue > 360) or
    (Saturation < 0) or (Saturation > 100) or
    (Value < 0) or (Value > 100) then
    begin
        result := clBlack;
        exit;
    end;

Hi := Hue div 60;
Vmin := (100 - Saturation)*Value/100.0;
a := (Value - Vmin)*(Hue mod 60)/60.0;
Vinc := Vmin + a;
Vdec := Value - a;

case Hi of
  0: result := RGB(Round(Value), Round(Vinc), Round(Vmin));
  1: result := RGB(Round(Vdec), Round(Value), Round(Vmin));
  2: result := RGB(Round(Vmin), Round(Value), Round(Vinc));
  3: result := RGB(Round(Vmin), Round(Vdec), Round(Value));
  4: result := RGB(Round(Vinc), Round(Vmin), Round(Value));
  5: result:= RGB(Round(Value), Round(Vmin), Round(Vdec));
  else result := clBlack;
end;
end;

procedure TForm1.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if maxvalue >0 then
  begin
    //Grid.Canvas.Brush.Color:=HSV(240 - matrix[Arow, Acol]*240 div maxvalue , 100, 100);
    //Grid.Canvas.Brush.Color:= HSV(240 - (Acol+grid.ColCount*Arow)*240 div (grid.RowCount*grid.ColCount) , 100, 100);
    Grid.Canvas.Brush.Color:=HSV(round(240 - 240 * log10(1+matrix[Arow, Acol])/log10(1+maxvalue)) , 100, 100);
    Grid.Canvas.FillRect(rect);
    waitrepaint := false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  heretrackbar.OnChange( heretrackbar );
  X0 := StrToInt(leftEdit.Text);
  Y0 := Strtoint(topedit.Text);
  TestAmount := strtoint(NumberEdit.Text);
  grid.DoubleBuffered:= true;
//  setLength(matrix, grid.RowCount, grid.ColCount);



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

  APsection:= tcriticalsection.Create;
  RESsection :=  tcriticalsection.Create;
  Randomize;
end;

procedure TForm1.HeightEditChange(Sender: TObject);
var
new: integer;
begin
try
   new := strtoint(HeightEdit.Text);
   if (new < 1) or (new>1000) then raise Exception.Create('Bad h');
  grid.RowCount:= new;
  form1.Resize;
//   SetLength(matrix,grid.RowCount,grid.ColCount);
except
  HeightEdit.Text := inttostr(grid.RowCount);
end;
end;

procedure TForm1.WidthEditChange(Sender: TObject);
var
new: integer;
begin
try
  new := strtoint(WidthEdit.Text);
     if (new < 1) or (new>1000) then raise Exception.Create('Bad w');
  grid.ColCount := new;
  form1.Resize;
//  SetLength(matrix,grid.RowCount,grid.ColCount);
except
  WidthEdit.Text := inttostr(grid.ColCount);
end;
end;

procedure TForm1.LeftEditChange(Sender: TObject);
begin
try
  Y0 := strtoint(LeftEdit.Text);
  if (Y0 <0) or ( y0 >= grid.RowCount) then raise Exception.Create('Bad initial point');
except
  LeftEdit.Text := inttostr(y0);
end;
end;

procedure TForm1.TopEditChange(Sender: TObject);
begin
try
  X0 := strtoint(TopEdit.Text);
  if (x0 <0) or ( x0 >= grid.ColCount) then raise Exception.Create('Bad initial point');
except
  topEdit.Text := inttostr(x0);
end;
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
for i:=1 to length(Trackbars) do
  if  trackbars[i]^ <> Sender then sum := sum - trackbars[i].Position
  else
  begin
    j := i+1;
    break;
  end;

if (sender as TTrackBar).Position > sum then (sender as TTrackBar).Position := sum;
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

procedure TForm1.NumberEditChange(Sender: TObject);
var
new: integer;
begin
try
  new := strtoint(NumberEdit.Text);
  if (new <0) then raise Exception.Create('Bad number of simulations');
  testamount:= new;
except
  NumberEdit.Text := inttostr(testamount);
end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
CellLenght:integer;
begin
grid.Left:=200;
grid.Width := form1.ClientWidth - grid.Left;
grid.Height:=form1.ClientHeight- statusbar.Height;
statusbar.Width:=form1.ClientWidth;
progressbar.Left := statusbar.Panels[0].Width;
progressbar.Width := statusbar.ClientWidth - progressbar.Left - 20;

celllenght := min(grid.Width div grid.ColCount, grid.Height div grid.RowCount);
celllenght := celllenght - 2;
grid.DefaultRowHeight := celllenght;
grid.DefaultColWidth:= celllenght;

statusbar.Panels[0].Width := form1.ClientWidth div 2;
end;

function GetActiveProcessAmount():integer;
begin
APsection.Enter;
result:=ActiveProcesses;
APsection.Leave;
end;

procedure TForm1.SimulateButtonClick(Sender: TObject);
var
i, j:integer;
sim: TSim;
begin
if simulatebutton.Tag = 0 then
begin
  simulatebutton.Tag := 1;
  simulatebutton.Caption := 'Stop';
  progressbar.Position := 0;
  progressbar.Max := testamount;

  heightedit.Enabled:=false;
  widthedit.Enabled:=false;
  numberedit.Enabled:=false;

  statusbar.Panels[0].Text:='Working...';
  
  for i:=0 to grid.RowCount - 1 do
    for j:=0 to grid.ColCount -1 do
      matrix[i,j]:=0;
  maxvalue := 0;

  stop := false;
  for i:=1 to TestAmount do
    if stop then break
    else
    begin
      while GetActiveProcessAmount>10 do application.ProcessMessages;
      sim := TSim.Create(true);
      sim.FreeOnTerminate:=true;
      sim.Priority:=tplower;
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

end.
