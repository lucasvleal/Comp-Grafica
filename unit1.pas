unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x,y,x1,x2,y1,y2 : integer;
  dx, dy : integer;
  a,b : real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    x1 := X;
    y1 := Y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin


  dx := x2 - x1;
  dy := y2 - y1;



  if(dx > 0) then
        x2 := X;
        y2 := Y;

        a := (y2 - y1) / (x2 - x1);
        b := y1 -   a * x1;

    begin
      if (dx > 100) then
            begin
              for x := x1 to x2 do
                  begin
                       y := round(a * x + b);
                       Image1.canvas.pixels[x,y] := clyellow;
                  end;
            end
      else
          begin
             for y := y1 to y2 do
                  begin
                       x := round((y - b) / a);
                       Image1.canvas.pixels[x,y] := clyellow;
                  end;
          end;
    end
  else
    begin
      xa := x1;
      ya := y1;

      x1 := X;
      y1 := Y;

      x2 := xa;
      y2 := ya;

      a := (y2 - y1) / (x2 - x1);
      b := y1 -   a * x1;

      if (dx > 100) then
            begin
              for x := x1 to x2 do
                  begin
                       y := round(a * x + b);
                       Image1.canvas.pixels[x,y] := clyellow;
                  end;
            end
      else
          begin
             for y := y1 to y2 do
                  begin
                       x := round((y - b) / a);
                       Image1.canvas.pixels[x,y] := clyellow;
                  end;
          end;
    end;
end;


end;

end.

