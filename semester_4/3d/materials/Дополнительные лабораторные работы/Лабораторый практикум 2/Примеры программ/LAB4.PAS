Program Delete_No_Visual_Line;
 { ���������� �����⬠ 㤠����� ��������� ����� }
 { ��⮤�� ��।������ ��ଠ�� �� �ਬ�� ��p����� }
 { ������஢���� ��ꥪ� � ��䨭�� �८�ࠧ������ }
 { �������� � ����筮� ���� � ����த��� ���न���� }
 { �p����� - �p⮣p���᪠�: ����⥫� ��室���� }
 { � ��᪮��筮�� �� ������⥫쭮� ���p������� �� z }
Uses Crt, Graph;

Const
 { ����⠭�� ��� 㤮����� ���饭�� � ᮮ⢥�����騬 ���न��⠬ }
 { ���設 ��ࠬ��� � ������ ��ꥪ� }
 x = 1;
 y = 2;
 z = 3;
 { ࠧ��� ������ 䨣��� }
 l = 4; { ������⢮ �祪     }
 n = 4; { ������⢮ ���न��� }
 alpha = 10/180; { 㣮� ������ � ࠤ����� }
 { ��६�饭�� �� ���न��� X, Y � Z }
 Dx = 0.87;
 Dy = 0.5;
 Dz = 0.5;

Type
 { ⨯ ������ ��ꥪ� � ����த��� ��஢�� ���न���� }
 TKoord_World = array[1..l, 1..n] of real;
 { ⨯ ������ ��䨭���� �८�ࠧ������ � ����த��� ���न���� }
 TMatrix = array[1..n, 1..n] of real;
 { ⨯ ������ �࠭�� ��ꥪ� }
 TPoligon = array[1..l, 1..3] of integer;


Const
 { ��஢� ����த�� ���न���� ��ꥪ� }
 K_W : TKoord_World = ((220, 100,   0, 1),
                       (400, 100,   0, 1),
                       (450,  50, 150, 1),
                       (350, 300,  50, 1));

 { ��।������ ������ ��६�饭�� }
 M_Trans : TMatrix = ((1,  0,  0,  0),
                      (0,  1,  0,  0),
                      (0,  0,  1,  0),
                      (Dx, Dy, Dz, 1)
                     );
 { ����� �࠭��, ������� ����� ���設 }
 { �� ������ ��஢�� ����த��� ���न��� ��ꥪ�, }
 { ��ࠧ���� ᮮ⢥�����騥 �࠭�� }
 Poligon : TPoligon = ((1, 2, 3),
                       (1, 2, 4),
                       (1, 3, 4),
                       (2, 3, 4)
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

 { �⮡ࠦ���� ��ࠬ��� �� ��࠭ � 㤠������ ��������� ����� }
 procedure Show;
  Const
   { ����� ���ࠢ����� ������� }
   Ez : array[1..n-1] of real = (0, 0, -1);
  Var
   { ����� ��ଠ�� � ⥪�饩 �࠭� ��� ��।������ �������� �࠭� }
   normal : array[1..n-1] of real;
   { ���न���� ����७��� �窨 ��ࠬ���, }
   { � ����⢥ ���ன ��࠭ ���業��   }
   p : array[1..n-1] of real;
   { ࠡ�稥 ��६����, �����騥 ����� ���設 � ����� �࠭�� }
   v1, v2, v3 : integer;
   { ᢮����� 童� � �ࠢ����� ���᪮��, ��室�饩 �१ �࠭� }
   d,
   { ᪠��୮� �ந�������� ����� ��ଠ�� � ����� ���ࠢ����� ����鸞 }
   Lf : real;
   i,j : integer;
  begin
   { ��।������ ���न��� ����७��� �窨 }
   p[x] := 0; p[y] := 0; p[z] := 0;
   for i := 1 to l do
    begin
     p[x] := p[x] + K_W[i, x];
     p[y] := p[y] + K_W[i, y];
     p[z] := p[z] + K_W[i, z];
    end;
   p[x] := p[x]/l; p[y] := p[y]/l; p[z] := p[z]/l;

   { ��।������ ����� ��ଠ�� }
   for i := 1 to l do
    begin
     v1 := Poligon[i,1];
     v2 := Poligon[i,2];
     v3 := Poligon[i,3];
     normal[x] := (K_W[v1,y]-K_W[v2,y])*(K_W[v2,z]-K_W[v3,z])-
                  (K_W[v1,z]-K_W[v2,z])*(K_W[v2,y]-K_W[v3,y]);
     normal[y] := (K_W[v1,z]-K_W[v2,z])*(K_W[v2,x]-K_W[v3,x])-
                  (K_W[v1,x]-K_W[v2,x])*(K_W[v2,z]-K_W[v3,z]);
     normal[z] := (K_W[v1,x]-K_W[v2,x])*(K_W[v2,y]-K_W[v3,y])-
                  (K_W[v1,y]-K_W[v2,y])*(K_W[v2,x]-K_W[v3,x]);

     { ��।������ ��୮�� ���ࠢ����� ����� ��ଠ�� }
     { ��।������ ᢮������� 童�� �ࠢ����� ���᪮��, ��室�饩 �१ �࠭� }
     d := -(normal[x]*K_W[v1,x]+normal[y]*K_W[v1,y]+normal[z]*K_W[v1,z]);
     { ���᫥��� ᪠��୮�� �ந�������� ����� ��ଠ�� � ����� ���ࠢ����� ����鸞 }
     Lf := normal[x]*p[x]+normal[y]*p[y]+normal[z]*p[z]+d;
     { ��।������ ����� ᪠��୮�� �ந�������� �, � ��砥 ����室����� }
     { ��������� ���ࠢ����� ��ଠ�� }
     if Lf > 0 then
       normal[z] := -normal[z];
     { ���ᮢ�� ॡ�� �࠭�, �᫨ ����� ��ଠ�� ���ࠢ��� �� ����⥫� }
     if -normal[z] < 0 then
      begin
       setcolor(Red);
       Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
       Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v3,x],hx),IY(K_W[v3,y],hy));
       Line(IX(K_W[v3,x],hx),IY(K_W[v3,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
      end;
    end;
  end;

 { �������� ����ࠦ���� ��ࠬ��� }
 { �⮡ࠦ���� ��ࠬ��� �� ��࠭ 梥⮬ 䮭� }
 procedure Hidden;
  Var
   v1, v2, v3 : integer;
   i : integer;
  begin
   for i := 1 to l do
    begin
     v1 := Poligon[i,1];
     v2 := Poligon[i,2];
     v3 := Poligon[i,3];
     setcolor(GetBkColor);
     Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
     Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v3,x],hx),IY(K_W[v3,y],hy));
     Line(IX(K_W[v3,x],hx),IY(K_W[v3,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
    end;
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
   X0 := 250;
   Y0 := 200;
   z0 := 50;

   { ������� ⨯� ����� }
   setlinestyle(SolidLn, 0, 3);

   { �뢮� ⥪�� }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 3-D Rotate&Transform&Delete_Line');

   repeat
    { �⮡ࠦ���� ��ࠬ��� }
    Show;
    Delay(1500);
    {��࠭��  ��ࠬ��� }
    Hidden;

    { �ਬ������ ����樨 ��६�饭�� 䨣��� }
    { ॠ������� 㬭������� ������ 䨣���  }
    { �� ������ ��६�饭�� }
    MultMatrix(K_W, M_Trans, K_W);

    { ���᫥��� ���न��� �窨, �p�� ���p�� �p�室�� �pﬠ�, }
    { ���p� ���p�� �����⢫���� ����p�� }
    { � ����⢥ ⠪�� �窨 �롨ࠥ��� ���� �� ��p設 ��p����� }
    x0 := x0 + Dx; { X }
    y0 := y0 + Dy; { Y }
    z0 := z0 + Dz; { Z }

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