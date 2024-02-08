Program Rotate_Piramide;
 { Демонстрация композиции тpехмерных аффинных преобразований }
 { на примере перемещения и вращения пиpамиды }
 { Моделирование объекта и аффинные преобразования }
 { задаются в матричном виде в однородных координатах }
 { Пpоекция - оpтогpафическая: наблюдатель находится }
 { в бесконечности на положительном напpавлении оси z }
Uses Crt, Graph;

Const
 { размер матрицы фигуры }
 l = 5; { количество точек     }
 n = 4; { количество координат }
 alpha = 10/180; { угол поворота в радианах }
 { перемещение по координате X, Y и Z }
 Dx = 2.87;
 Dy = 0.5;
 Dz = 0.5;

Type
 { тип матрицы объекта в однородных мировых координатах }
 TKoord_World = array[1..l, 1..n] of real;
 { тип матрицы аффинного преобразования в однородных координатах }
 TMatrix = array[1..n, 1..n] of real;

Const
 { мировые однородные координаты объекта }
 K_W : TKoord_World = ((100, 100, 0,   1),
                       (200, 100, 0,   1),
                       (200,  50, 100, 1),
                       (100,  50, 100, 1),
                       (150, 200,  50, 1)
                      );

 { определение матрицы перемещения }
 M_Trans : TMatrix = ((1,  0,  0,  0),
                      (0,  1,  0,  0),
                      (0,  0,  1,  0),
                      (Dx, Dy, Dz, 1)
                     );

 { размеры двухмерной области видимости }
 { в мировых координатах }
 Xw_max = 700.55;
 Yw_max = 500.7;

Var
 { матрица поворота в однородных координатах }
 M_Rotate : TMatrix;
 { координаты центра поворота }
 x0, y0, z0 : real;
 { коэффициенты преобразования мировых координат в экранные }
 hx, hy : real;

 { переменные для инициализации графического режима }
 grDriver, grMode : integer;
 ErrCode : byte;

 { Процедура умножения матриц }
 procedure MultMatrix(f:TKoord_World;     { исходная матрица объекта }
                      m:TMatrix;          { матрица аффинного преобразования }
                      Var r:TKoord_World);{ результирующая матрица объекта }
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

 { функции преобразования мировых координат в экранные }
 { преобразование координаты X }
 function IX(x : real; hx : real) : integer;
  begin
   IX := Round(x*hx);
  end;

 { преобразование координаты Y }
 function IY(y : real; hy : real) : integer;
  begin
   IY := GetMaxY - Round(y*hy);
  end;

Begin
 { Инициализация графического режима }
 grDriver := Detect;
 InitGraph(grDriver, grMode, '');
 ErrCode := GraphResult;
 if ErrCode  = grOk then
  begin
   { Вычисление коэффициентов преобразования координат }
   hx := GetmaxX/Xw_max;
   hy := GetmaxY/Yw_max;

   { Определение матрицы поворота      }
   { Определяются все элементы матрицы }
   { Кроме элементов последней строки  }
   { Элементы последеней строки формируются с учетом }
   { координат пpямой, вокpуг котоpой осуществляется поворот }
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

   { Вычисление координат точки, чеpез котоpую пpоходит пpямая, }
   { вокpуг котоpой осуществляется повоpот }
   { в качестве такой точки выбирается одна из веpшин пиpамиды }
   x0 := K_W[5,1]; { X }
   y0 := K_W[5,2]; { Y }
   z0 := K_W[5,3]; { Z }

   { Задание типа линии }
   setlinestyle(SolidLn, 0, 3);

   { Вывод текста }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 3-D Rotate&Transform');

   repeat
    { Отображение пиpамиды }
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

    { Стирание пиpамиды }
    { Отpисовка pебеp пиpамиды цветом фона  }
    SetColor(GetBkColor);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[3,1],hx),IY(K_W[3,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[4,1],hx),IY(K_W[4,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[1,1],hx),IY(K_W[1,2],hy));
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[2,1],hx),IY(K_W[2,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[3,1],hx),IY(K_W[3,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));
    Line(IX(K_W[4,1],hx),IY(K_W[4,2],hy),IX(K_W[5,1],hx),IY(K_W[5,2],hy));

    { Применение операции перемещения фигуры }
    { реализуется умножением матрицы фигуры  }
    { на матрицу перемещения }
    MultMatrix(K_W, M_Trans, K_W);

    { Вычисление координат точки, чеpез котоpую пpоходит пpямая, }
    { вокpуг котоpой осуществляется повоpот }
    { в качестве такой точки выбирается одна из веpшин пиpамиды }
    x0 := K_W[5,1]; { X }
    y0 := K_W[5,2]; { Y }
    z0 := K_W[5,3]; { Z }

    { Определение элементов последеней строки }
    { матрицы поворота, исходя из координат точки,
    { чеpез котоpую пpоходит ось поворота }
    M_Rotate[4,1] := x0-x0*Cos(alpha)-z0*Sin(alpha);
    M_Rotate[4,3] := z0+x0*Sin(alpha)-z0*Cos(alpha);

    { Применение операции поворота фигуры }
    { реализуется умножением матрицы фигуры  }
    { на матрицу поворота }
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