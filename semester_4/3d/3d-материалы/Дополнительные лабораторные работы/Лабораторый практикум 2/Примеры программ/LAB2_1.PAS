Program Rotate_Line;
 { Демонстрация композиции двухмерных аффинных преобразований }
 { на примере перемещения и вращения отрезка прямой }
 { Моделирование объекта и аффинные преобразования }
 { задаются в матричном виде в однородных координатах }
Uses Crt, Graph;

Const
 { размер матрицы фигуры }
 l = 2; { количество точек     }
 n = 3; { количество координат }
 alpha = 10/180; { угол поворота в радианах }
 { перемещение по координате X и Y }
 Dx = 2.87;
 Dy = 0.5;

Type
 { тип матрицы фигуры в однородных мировых координатах }
 TKoord_World = array[1..l, 1..n] of real;
 { тип матрицы аффинного преобразования в однородных координатах }
 TMatrix = array[1..n, 1..n] of real;

Const
 { мировые однородные координаты фигуры }
 K_W : TKoord_World = ((  45.5, 300.33, 1),
                       (105.75,    200, 1));

 { определение матрицы перемещения }
 M_Trans : TMatrix = ((1,  0,  0),
                      (0,  1,  0),
                      (Dx, Dy, 1)
                     );

 { размеры двухмерной области видимости }
 { в мировых координатах }
 Xw_max = 700.55;
 Yw_max = 500.7;

Var
 { матрица поворота в однородных координатах }
 M_Rotate : TMatrix;
 { координаты центра поворота }
 x0, y0 : real;
 { размеры области вывода на экране }
 Xs_max, Ys_max : integer;
 { коэффициенты преобразования мировых координат в экранные }
 hx, hy : real;

 { переменные для инициализации графического режима }
 grDriver, grMode : integer;
 ErrCode : byte;

 { Процедура умножения матриц }
 procedure MultMatrix(f:TKoord_World;     { исходная матрица фигуры }
                      m:TMatrix;          { матрица аффинного преобразования }
                      Var r:TKoord_World);{ результирующая матрица фигуры }
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
   Xs_max := GetmaxX;
   Ys_max := GetmaxY;
   hx := Xs_max/Xw_max;
   hy := Ys_max/Yw_max;

   { Определение матрицы поворота      }
   { Определяются все элементы матрицы }
   { Кроме элементов последней строки  }
   { Элементы последеней строки формируются с учетом }
   { координат центра поворота          }
   M_Rotate[1,1] := Cos(alpha);
   M_Rotate[1,2] := Sin(alpha);
   M_Rotate[1,3] := 0;
   M_Rotate[2,1] := -Sin(alpha);
   M_Rotate[2,2] := Cos(alpha);
   M_Rotate[2,3] := 0;
   M_Rotate[3,3] := 1;

   { Задание пользовательского типа линии }
   setlinestyle(UserBitLn, 153, 3);

   { Вывод текста }
   settextstyle(gothicFont, Horizdir, 3);
   setcolor(Yellow);
   OutTextXY(25, getmaxy - 40, ' Example 2-D Rotate&Transform');

   repeat
    { Отображение линии }
    SetColor(Red);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));
    Delay(1500);

    { Стирание линии }
    { Отрисовка линии цветом фона }
    SetColor(GetBkColor);
    Line(IX(K_W[1,1],hx),IY(K_W[1,2],hy),IX(K_W[2,1],hx),IY(K_W[2,2],hy));

    { Применение операции перемещения фигуры }
    { реализуется умножением матрицы фигуры  }
    { на матрицу перемещения }
    MultMatrix(K_W, M_Trans, K_W);

    { Вычисление координат центра поворота }
    { в качестве центра выбирается середина отрезка}
    x0 := K_W[1,1]+(K_W[2,1]-K_W[1,1])/2; { X }
    y0 := K_W[1,2]+(K_W[2,2]-K_W[1,2])/2; { Y }

    { Определение элементов последеней строки }
    { матрицы поворота, исходя из координат центра поворота }
    M_Rotate[3,1] := -x0*Cos(alpha)+y0*Sin(alpha)+x0;
    M_Rotate[3,2] := -x0*Sin(alpha)-y0*Cos(alpha)+y0;

    { Применение операции поворота фигуры }
    { реализуется умножением матрицы фигуры  }
    { на матрицу поворота }
    MultMatrix(K_W, M_Rotate, K_W);

    { Рисование следов от концов отрезка }
    PutPixel(IX(K_W[1,1],hx), IY(K_W[1,2],hy), Green);
    PutPixel(IX(K_W[2,1],hx), IY(K_W[2,2],hy), Blue);
    Delay(1500);
   until KeyPressed;

   CloseGraph;
  end
 else Writeln('Graphics error:', GraphErrorMsg(ErrCode));
End.