Program Delete_No_Visual_Line;
 { Демонстрация алгоритма удаления невидимых линий }
 { методом определения нормали на примере пиpамиды }
 { Моделирование объекта и аффинные преобразования }
 { задаются в матричном виде в однородных координатах }
 { Пpоекция - оpтогpафическая: наблюдатель находится }
 { в бесконечности на положительном напpавлении оси z }
Uses Crt, Graph;

Const
 { константы для удобного обращения к соответствующим координатам }
 { вершин пирамиды в матрицы объекта }
 x = 1;
 y = 2;
 z = 3;
 { размер матрицы фигуры }
 l = 4; { количество точек     }
 n = 4; { количество координат }
 alpha = 10/180; { угол поворота в радианах }
 { перемещение по координате X, Y и Z }
 Dx = 0.87;
 Dy = 0.5;
 Dz = 0.5;

Type
 { тип матрицы объекта в однородных мировых координатах }
 TKoord_World = array[1..l, 1..n] of real;
 { тип матрицы аффинного преобразования в однородных координатах }
 TMatrix = array[1..n, 1..n] of real;
 { тип матрицы граней объекта }
 TPoligon = array[1..l, 1..3] of integer;


Const
 { мировые однородные координаты объекта }
 K_W : TKoord_World = ((220, 100,   0, 1),
                       (400, 100,   0, 1),
                       (450,  50, 150, 1),
                       (350, 300,  50, 1));

 { определение матрицы перемещения }
 M_Trans : TMatrix = ((1,  0,  0,  0),
                      (0,  1,  0,  0),
                      (0,  0,  1,  0),
                      (Dx, Dy, Dz, 1)
                     );
 { матрица граней, задающая номера вершин }
 { из матрицы мировых однородных координат объекта, }
 { образующих соответствующие граней }
 Poligon : TPoligon = ((1, 2, 3),
                       (1, 2, 4),
                       (1, 3, 4),
                       (2, 3, 4)
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

 { отображение пирамиды на экран с удалением невидимых линий }
 procedure Show;
  Const
   { вектор направления наблюдения }
   Ez : array[1..n-1] of real = (0, 0, -1);
  Var
   { вектор нормали к текущей грани для определения видимости грани }
   normal : array[1..n-1] of real;
   { координаты внутренней точки пирамиды, }
   { в качестве которой выбран барицентр   }
   p : array[1..n-1] of real;
   { рабочие переменные, задающие номера вершин в матрице граней }
   v1, v2, v3 : integer;
   { свободный член в уравнении плоскости, проходящей через грань }
   d,
   { скалярное произведение вектора нормали и вектора направления взгляда }
   Lf : real;
   i,j : integer;
  begin
   { определение координат внутренней точки }
   p[x] := 0; p[y] := 0; p[z] := 0;
   for i := 1 to l do
    begin
     p[x] := p[x] + K_W[i, x];
     p[y] := p[y] + K_W[i, y];
     p[z] := p[z] + K_W[i, z];
    end;
   p[x] := p[x]/l; p[y] := p[y]/l; p[z] := p[z]/l;

   { определение вектора нормали }
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

     { определение верного направления вектора нормали }
     { определение свободного члена уравнения плоскости, проходящей через грань }
     d := -(normal[x]*K_W[v1,x]+normal[y]*K_W[v1,y]+normal[z]*K_W[v1,z]);
     { вычисление скалярного произведения вектора нормали и вектора направления взгляда }
     Lf := normal[x]*p[x]+normal[y]*p[y]+normal[z]*p[z]+d;
     { определение знака скалярного произведения и, в случае необходимости }
     { изменение направления нормали }
     if Lf > 0 then
       normal[z] := -normal[z];
     { отрисовка ребер грани, если вектор нормали направлен на наблюдателя }
     if -normal[z] < 0 then
      begin
       setcolor(Red);
       Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
       Line(IX(K_W[v1,x],hx),IY(K_W[v1,y],hy),IX(K_W[v3,x],hx),IY(K_W[v3,y],hy));
       Line(IX(K_W[v3,x],hx),IY(K_W[v3,y],hy),IX(K_W[v2,x],hx),IY(K_W[v2,y],hy));
      end;
    end;
  end;

 { Удаление изображения пирамиды }
 { отображение пирамиды на экран цветом фона }
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
   X0 := 250;
   Y0 := 200;
   z0 := 50;

   { Задание типа линии }
   setlinestyle(SolidLn, 0, 3);

   { Вывод текста }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 3-D Rotate&Transform&Delete_Line');

   repeat
    { Отображение пирамиды }
    Show;
    Delay(1500);
    {Стирание  пирамиды }
    Hidden;

    { Применение операции перемещения фигуры }
    { реализуется умножением матрицы фигуры  }
    { на матрицу перемещения }
    MultMatrix(K_W, M_Trans, K_W);

    { Вычисление координат точки, чеpез котоpую пpоходит пpямая, }
    { вокpуг котоpой осуществляется повоpот }
    { в качестве такой точки выбирается одна из веpшин пиpамиды }
    x0 := x0 + Dx; { X }
    y0 := y0 + Dy; { Y }
    z0 := z0 + Dz; { Z }

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