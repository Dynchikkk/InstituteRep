Program Lab1;
 { ���������� �᭮���� �ਥ��� ࠡ��� � ����᪮� ������⥪�� }
 { ������஢���� ���᪨� ��������᪨� ��ꥪ⮢ � ��஢�� ���न���� }
 { � �⮡ࠦ���� �� �� ��࠭ �������� }

uses Crt, Graph;

Const
 { ࠧ���� ���嬥୮� ������ �������� }
 { � ��஢�� ���न���� }
 Xmax : real = 700.5;
 Ymax : real = 500.75;

var
 { ��६���� ��� ���樠����樨 ����᪮�� ०��� }
 Gd, Gm: Integer;
 { ��६���� ��� ������஢���� ����᪨� ��ꥪ⮢ }
 { � ��஢�� ���न���� }
 PLine   : array[1..2, 1..2] of real; { ��१�� ��אַ� }
 PRect   : array[1..2, 1..2] of real; { ��אַ㣮�쭨�  }
 { �����樥��� �८�ࠧ������ ��஢�� ���न��� � ��࠭�� }
 hx,           { ���न���� X }
 hy : real;    { ���न���� Y }

 { �㭪樨 �८�ࠧ������ ��஢�� ���न��� � ��࠭�� }
 { �८�ࠧ������ ���न���� X }
 function IX(x : real; hx : real) : integer;
  begin
   IX := Round(x*hx);
  end;

 { �८�ࠧ������ ���न���� Y }
 function IY(y : real; hy : real) : integer;
  begin
   IY := GetMaxY - Round(y*hy);
  end;

begin
  { ���樠������ ����᪮�� ०��� }
  Gd := Detect;
  InitGraph(Gd, Gm, '');
  { ��㤠筠� ���樠������ }
  if GraphResult <> grOk then
    Halt(1);
  { 㤠筠� ���樠������ }
  Randomize;
  { ���᫥��� �����樥�⮢ �८�ࠧ������ ���न��� }
  hx := Xmax/GetMaxX;
  hy := Ymax/GetMaxY;
  repeat
   Randomize;
   { ��砩�� �롮� ��ꥪ� }
   { 0..10 - ��ﬠ�, 11..20 - ��אַ㣮�쭨� }
   case Random(20) of
    0..10 : begin
         { ��砩�� �롮� 梥� }
         SetColor(Random(15));
         { ��।������ ��஢�� ���न��� ���殢 ��१�� ��אַ� }
         PLine[1,1] := Random(Round(Xmax)) + 0.5; { X1 }
         PLine[1,2] := Random(Round(Ymax)) + 0.5; { Y1 }
         PLine[2,1] := Random(Round(Xmax)) + 0.5; { X2 }
         PLine[2,2] := Random(Round(Ymax)) + 0.5; { Y2 }
         { �८�ࠧ������ � ��࠭�� ���न��⠬ � �뢮� }
         Line(IX(PLine[1,1],hx), IY(PLine[1,2],hy), IX(PLine[2,1],hx), IX(PLine[2,2],hy));
        end;
    11..20 : begin
         { ��砩�� �롮� 梥� }
         SetColor(Random(15));
         { ��।������ ��஢�� ���न��� ���設 ��אַ㣮�쭨�� }
         PRect[1,1] := Random(Round(Xmax)) + 0.5; { X1 }
         PRect[1,2] := Random(Round(Ymax)) + 0.5; { Y1 }
         PRect[2,1] := Random(Round(Xmax)) + 0.5; { X2 }
         PRect[2,2] := Random(Round(Ymax)) + 0.5; { Y2 }
         { �८�ࠧ������ � ��࠭�� ���न��⠬ � �뢮� }
         Rectangle(IX(PRect[1,1],hx), IY(PRect[1,2],hy), IX(PRect[2,1],hx), IX(PRect[2,2],hy));
        end;
    end;
   Delay(2000);
  until KeyPressed;
  Readln;
  CloseGraph;
end.
