unit logic;

interface

uses
  Classes;

type TSim = class(tthread)
  private
    { private declarations }
  protected
    procedure execute; override;
  end;

implementation

uses
  unit1, globals;

procedure TSim.execute;
var
  rand: integer;
  x, y:integer;
begin
  x := form1.y0;
  y := form1.x0;

  while (x>0) and (x<form1.FieldHeight-1) and (y>0) and (y<form1.FieldWidth-1) do
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
  matrix[x,y]:=matrix[x,y]+1;
  RESsection.Leave;

  if matrix[x,y]>maxvalue then maxvalue := matrix[x,y];
  ready := ready+1;

  APsection.Enter;
  dec(ActiveProcesses);
  APsection.Leave;
end;

end.
