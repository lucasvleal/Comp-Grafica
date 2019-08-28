unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  Form1: TForm1;
  x1, y1, xc, yc, xa, ya : Integer;
  raio : Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     xc := X;
     yc := Y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var inc : Real;
begin
    x1 := X;
    y1 := Y;
    xa := x1 - xc;
    ya := y1 - yc;

    raio := round(sqrt((xa * xa) + (ya * ya)));

    for x := -raio to raio do
      begin
           y := round(sqrt((raio * raio) - (x * x)));
           Image1.Canvas.Pixels[x+xc,y+yc] := clred;
           Image1.Canvas.Pixels[xc-x,yc-y] := clyellow;
      end;
end;

end.

