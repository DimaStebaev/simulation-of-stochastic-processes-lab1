unit globals;

interface

uses
  syncobjs;

type
  TGlobalMatrix = class
    mas: array of array of integer;
    constructor Create(x, y: integer);
    procedure resize(x, y: integer);
  private
  public
end;

var
  APsection, RESsection: tcriticalsection;
  //matrix : array[0 .. 1000, 0..1000] of integer;
  matrix : array of array of integer;
  //matrix: TGlobalMatrix;
  maxValue, ActiveProcesses, ready: integer;
  stop: boolean;

implementation

uses SysUtils;

{function HSV(Hue, Saturation, Value: integer): COLORREF;
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
end;}

{ my }

constructor TGlobalMatrix.Create(x, y: integer);
begin
 SetLength(mas, x, y);
end;

procedure TGlobalMatrix.resize(x, y: integer);
begin
    SetLength(mas, x, y);
end;

end.
