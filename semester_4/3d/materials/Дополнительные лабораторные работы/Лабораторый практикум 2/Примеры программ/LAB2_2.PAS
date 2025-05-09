Program Rotate_Rect;
 { ���������� �������樨 ���嬥��� ��䨭��� �८�ࠧ������ }
 { �� �ਬ�� ��६�饭�� � ��饭�� ��אַ㣮�쭨�� }
 { ������஢���� ��ꥪ� � ��䨭�� �८�ࠧ������ }
 { �������� � ����筮� ���� � ����த��� ���न���� }
Uses Crt, Graph;

Const
 { ࠧ��� ������ 䨣��� }
 l = 4; { ������⢮ �祪     }
 n = 3; { ������⢮ ���न��� }
 alpha = 10/180; { 㣮� ������ � ࠤ����� }
 { ��६�饭�� �� ���न��� X � Y }
 Dx = 2.87;
 Dy = 0.5;
 { ������ "����" ��� ����訢���� ��אַ㣮�쭨�� }
 Pattern : FillPatternType = (134,
                              134,
                              134,
                              134,
                              134,
                              134,
                              134,
                              134 );

Type
 { ⨯ ������ 䨣��� � ����த��� ��஢�� ���न���� }
 TKoord_World = array[1..l, 1..n] of real;
 { ⨯ ������ ��䨭���� �८�ࠧ������ � ����த��� ���न���� }
 TMatrix = array[1..n, 1..n] of real;

Const
 { ��஢� ����த�� ���न���� 䨣��� }
 K_W : TKoord_World = ((175, 175, 1),
                       (250, 175, 1),
                       (250, 100, 1),
                       (175, 100, 1)
                      );

 { ��।������ ������ ��६�饭�� }
 M_Trans : TMatrix = ((1,  0,  0),    { Matrix Transform }
                      (0,  1,  0),
                      (Dx, Dy, 1)
                     );

 { ࠧ���� ���嬥୮� ������ �������� }
 { � ��஢�� ���न���� }
 Xw_max = 700.55;
 Yw_max = 500.7;

Var
 { ����� ������ � ����த��� ���न���� }
 M_Rotate : TMatrix;
 { ���न���� 業�� ������ }
 x0, y0 : real;
 { �����樥��� �८�ࠧ������ ��஢�� ���न��� � ��࠭�� }
 hx, hy : real;

 { ��६���� ��� ���樠����樨 ����᪮�� ०��� }
 grDriver, grMode : integer;
 ErrCode : byte;

 { ��楤�� 㬭������ ����� }
 procedure MultMatrix(f:TKoord_World;     { ��室��� ����� 䨣��� }
                      m:TMatrix;          { ����� ��䨭���� �८�ࠧ������ }
                      Var r:TKoord_World);{ १�������� ����� 䨣��� }
  var
   i,j,k : byte;
   t : TKoord_World;
  begin
   for i := 1 to l do
    for j := 1 to n do
     begin
      t[i,j] := 0;
      for k := 1 to n do
       t[i,j] := t[i,j] + f[i,k]*m[k,j];
     end;
   r := t;
  end;

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

Begin
 { ���樠������ ����᪮�� ०��� }
 grDriver := Detect;
 InitGraph(grDriver, grMode, '');
 ErrCode := GraphResult;
 if ErrCode  = grOk then
  begin
   { ���᫥��� �����樥�⮢ �८�ࠧ������ ���न��� }
   hx := GetmaxX/Xw_max;
   hy := GetmaxY/Yw_max;

   { ��।������ ������ ������      }
   { ��।������� �� �������� ������ }
   { �஬� ������⮢ ��᫥���� ��ப�  }
   { �������� ��᫥����� ��ப� �ନ������ � ��⮬ }
   { ���न��� 業�� ������          }
   M_Rotate[1,1] := Cos(alpha);
   M_Rotate[1,2] := Sin(alpha);
   M_Rotate[1,3] := 0;
   M_Rotate[2,1] := -Sin(alpha);
   M_Rotate[2,2] := Cos(alpha);
   M_Rotate[2,3] := 0;
   M_Rotate[3,3] := 1;

   { ���᫥��� ���न��� 業�� ������ }
   { � ����⢥ 業�� �롨ࠥ��� �।��� ��१��}
   x0 := K_W[1,1]+(K_W[2,1]-K_W[1,1])/2; { X }
   y0 := K_W[1,2]+(K_W[3,2]-K_W[1,2])/2; { Y }

   { �뢮� ⥪�� }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 2-D Rotate&Transform');

   repeat
    { �⮡ࠦ���� ��אַ㣮�쭨�� }
    SetColor(Red);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[3,1],hx),IY(K_W[3,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[4,1],hx),IY(K_W[4,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[1,1],hx),IY(K_W[1,2],hy));

    { ����᪠ ��אַ㣮�쭨�� }
    { ������� ���짮��⥫�᪮�� ⨯� ���� }
    SetFillPattern(Pattern, Magenta);
    FloodFill(IX(x0,hx), IY(y0,hy), Red);
    Delay(1500);

    { ��࠭�� ��אַ㣮�쭨�� }
    { ����᪠ ��אַ㣮�쭨�� 梥⮬ 䮭�  }
    { ������� ���짮��⥫�᪮�� ⨯� ���� }
    SetFillPattern(Pattern, GetBkColor);
    FloodFill(IX(x0,hx), IY(y0,hy), Red);
    { ���ᮢ�� ��אַ㣮�쭨�� 梥⮬ 䮭� }
    SetColor(GetBkColor);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[3,1],hx),IY(K_W[3,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[4,1],hx),IY(K_W[4,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[1,1],hx),IY(K_W[1,2],hy));

    { �ਬ������ ����樨 ��६�饭�� 䨣��� }
    { ॠ������� 㬭������� ������ 䨣���  }
    { �� ������ ��६�饭�� }
    MultMatrix(K_W, M_Trans, K_W);

    { ��६�饭�� 業�� ������ - 業�� ��אַ㣮�쭨�� }
    x0 := x0 + Dx; { X }
    y0 := y0 + Dy; { Y }

    { ��।������ ������⮢ ��᫥����� ��ப� }
    { ������ ������, ��室� �� ���न��� 業�� ������ }
    M_Rotate[3,1] := -x0*Cos(alpha)+y0*Sin(alpha)+x0;
    M_Rotate[3,2] := -x0*Sin(alpha)-y0*Cos(alpha)+y0;

    { �ਬ������ ����樨 ������ 䨣��� }
    { ॠ������� 㬭������� ������ 䨣���  }
    { �� ������ ������ }
    MultMatrix(K_W, M_Rotate, K_W);

   until KeyPressed;
   CloseGraph;
  end
 else Writeln('Graphics error:', GraphErrorMsg(ErrCode));
End.