Program Rotate_Piramide;
 { ���������� �������樨 �p�嬥��� ��䨭��� �८�ࠧ������ }
 { �� �ਬ�� ��६�饭�� � ��饭�� ��p����� }
 { ������஢���� ��ꥪ� � ��䨭�� �८�ࠧ������ }
 { �������� � ����筮� ���� � ����த��� ���न���� }
 { �p����� - �p⮣p���᪠�: ����⥫� ��室���� }
 { � ��᪮��筮�� �� ������⥫쭮� ���p������� �� z }
Uses Crt, Graph;

Const
 { ࠧ��� ������ 䨣��� }
 l = 5; { ������⢮ �祪     }
 n = 4; { ������⢮ ���न��� }
 alpha = 10/180; { 㣮� ������ � ࠤ����� }
 { ��६�饭�� �� ���न��� X, Y � Z }
 Dx = 2.87;
 Dy = 0.5;
 Dz = 0.5;

Type
 { ⨯ ������ ��ꥪ� � ����த��� ��஢�� ���न���� }
 TKoord_World = array[1..l, 1..n] of real;
 { ⨯ ������ ��䨭���� �८�ࠧ������ � ����த��� ���न���� }
 TMatrix = array[1..n, 1..n] of real;

Const
 { ��஢� ����த�� ���न���� ��ꥪ� }
 K_W : TKoord_World = ((100, 100, 0,   1),
                       (200, 100, 0,   1),
                       (200,  50, 100, 1),
                       (100,  50, 100, 1),
                       (150, 200,  50, 1)
                      );

 { ��।������ ������ ��६�饭�� }
 M_Trans : TMatrix = ((1,  0,  0,  0),
                      (0,  1,  0,  0),
                      (0,  0,  1,  0),
                      (Dx, Dy, Dz, 1)
                     );

 { ࠧ���� ���嬥୮� ������ �������� }
 { � ��஢�� ���न���� }
 Xw_max = 700.55;
 Yw_max = 500.7;

Var
 { ����� ������ � ����த��� ���न���� }
 M_Rotate : TMatrix;
 { ���न���� 業�� ������ }
 x0, y0, z0 : real;
 { �����樥��� �८�ࠧ������ ��஢�� ���न��� � ��࠭�� }
 hx, hy : real;

 { ��६���� ��� ���樠����樨 ����᪮�� ०��� }
 grDriver, grMode : integer;
 ErrCode : byte;

 { ��楤�� 㬭������ ����� }
 procedure MultMatrix(f:TKoord_World;     { ��室��� ����� ��ꥪ� }
                      m:TMatrix;          { ����� ��䨭���� �८�ࠧ������ }
                      Var r:TKoord_World);{ १�������� ����� ��ꥪ� }
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
   { ���न��� �pאַ�, ���p� ���p�� �����⢫���� ������ }
   M_Rotate[1,1] := Cos(alpha);
   M_Rotate[1,2] := 0;
   M_Rotate[1,3] := -Sin(alpha);
   M_Rotate[1,4] := 0;
   M_Rotate[2,1] := 0;
   M_Rotate[2,2] := 1;
   M_Rotate[2,3] := 0;
   M_Rotate[2,4] := 0;
   M_Rotate[3,1] := Sin(alpha);
   M_Rotate[3,2] := 0;
   M_Rotate[3,3] := Cos(alpha);
   M_Rotate[3,4] := 0;
   M_Rotate[4,2] := 0;
   M_Rotate[4,4] := 1;

   { ���᫥��� ���न��� �窨, �p�� ���p�� �p�室�� �pﬠ�, }
   { ���p� ���p�� �����⢫���� ����p�� }
   { � ����⢥ ⠪�� �窨 �롨ࠥ��� ���� �� ��p設 ��p����� }
   x0 := K_W[5,1]; { X }
   y0 := K_W[5,2]; { Y }
   z0 := K_W[5,3]; { Z }

   { ������� ⨯� ����� }
   setlinestyle(SolidLn, 0, 3);

   { �뢮� ⥪�� }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 3-D Rotate&Transform');

   repeat
    { �⮡ࠦ���� ��p����� }
    SetColor(Red);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[3,1],hx),IY(K_W[3,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[4,1],hx),IY(K_W[4,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[1,1],hx),IY(K_W[1,2],hy));
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Delay(1500);

    { ��࠭�� ��p����� }
    { ��p�ᮢ�� p���p ��p����� 梥⮬ 䮭�  }
    SetColor(GetBkColor);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[3,1],hx),IY(K_W[3,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[4,1],hx),IY(K_W[4,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[1,1],hx),IY(K_W[1,2],hy));
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));

    { �ਬ������ ����樨 ��६�饭�� 䨣��� }
    { ॠ������� 㬭������� ������ 䨣���  }
    { �� ������ ��६�饭�� }
    MultMatrix(K_W, M_Trans, K_W);

    { ���᫥��� ���न��� �窨, �p�� ���p�� �p�室�� �pﬠ�, }
    { ���p� ���p�� �����⢫���� ����p�� }
    { � ����⢥ ⠪�� �窨 �롨ࠥ��� ���� �� ��p設 ��p����� }
    x0 := K_W[5,1]; { X }
    y0 := K_W[5,2]; { Y }
    z0 := K_W[5,3]; { Z }

    { ��।������ ������⮢ ��᫥����� ��ப� }
    { ������ ������, ��室� �� ���न��� �窨,
    { �p�� ���p�� �p�室�� ��� ������ }
    M_Rotate[4,1] := x0-x0*Cos(alpha)-z0*Sin(alpha);
    M_Rotate[4,3] := z0+x0*Sin(alpha)-z0*Cos(alpha);

    { �ਬ������ ����樨 ������ 䨣��� }
    { ॠ������� 㬭������� ������ 䨣���  }
    { �� ������ ������ }
    MultMatrix(K_W, M_Rotate, K_W);

   until KeyPressed;
   CloseGraph;
  end
 else Writeln('Graphics error:', GraphErrorMsg(ErrCode));
End.















 { Init Graph Regime }
 grDriver := Detect;
 InitGraph(grDriver, grMode, 'c:\tpascal.71\bgi');
 ErrCode := GraphResult;
 if ErrCode  = grOk then
  begin
   { Max koord World }
   Xw_max := 700;
   Yw_max := 500;
   { Max koord Screen }
   Xs_max := GetmaxX;
   Ys_max := GetmaxY;
   { Koeff Change Koord World-->Screen }
   hx := Xs_max/Xw_max;
   hy := Ys_max/Yw_max;
   repeat
    { Change Koord World-->Screen }
    Koord_Screen[1,1] := Round(Koord_World[1,1]*hx);
    Koord_Screen[1,2] := Ys_max - Round(Koord_World[1,2]*hy);
    Koord_Screen[2,1] := Round(Koord_World[2,1]*hx);
    Koord_Screen[2,2] := Ys_max - Round(Koord_World[2,2]*hy);
    Koord_Screen[3,1] := Round(Koord_World[3,1]*hx);
    Koord_Screen[3,2] := Ys_max - Round(Koord_World[3,2]*hy);
    Koord_Screen[4,1] := Round(Koord_World[4,1]*hx);
    Koord_Screen[4,2] := Ys_max - Round(Koord_World[4,2]*hy);
    Koord_Screen[5,1] := Round(Koord_World[5,1]*hx);
    Koord_Screen[5,2] := Ys_max - Round(Koord_World[5,2]*hy);
    { Show Line }
    SetColor(Red);
    Line(Koord_Screen[1,1],Koord_Screen[1,2],Koord_Screen[2,1],Koord_Screen[2,2]);
    Line(Koord_Screen[2,1],Koord_Screen[2,2],Koord_Screen[3,1],Koord_Screen[3,2]);
    Line(Koord_Screen[3,1],Koord_Screen[3,2],Koord_Screen[4,1],Koord_Screen[4,2]);
    Line(Koord_Screen[4,1],Koord_Screen[4,2],Koord_Screen[1,1],Koord_Screen[1,2]);
    Line(Koord_Screen[1,1],Koord_Screen[1,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[2,1],Koord_Screen[2,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[3,1],Koord_Screen[3,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[4,1],Koord_Screen[4,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Delay(2500);
    { Rotate }
    Rotate(Koord_World, Matrix, Koord_World);
    SetColor(GetBkColor);
    Line(Koord_Screen[1,1],Koord_Screen[1,2],Koord_Screen[2,1],Koord_Screen[2,2]);
    Line(Koord_Screen[2,1],Koord_Screen[2,2],Koord_Screen[3,1],Koord_Screen[3,2]);
    Line(Koord_Screen[3,1],Koord_Screen[3,2],Koord_Screen[4,1],Koord_Screen[4,2]);
    Line(Koord_Screen[4,1],Koord_Screen[4,2],Koord_Screen[1,1],Koord_Screen[1,2]);
    Line(Koord_Screen[1,1],Koord_Screen[1,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[2,1],Koord_Screen[2,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[3,1],Koord_Screen[3,2],Koord_Screen[5,1],Koord_Screen[5,2]);
    Line(Koord_Screen[4,1],Koord_Screen[4,2],Koord_Screen[5,1],Koord_Screen[5,2]);
   until KeyPressed;
   CloseGraph;
  end
 else Writeln('Graphics error:', GraphErrorMsg(ErrCode));
End.