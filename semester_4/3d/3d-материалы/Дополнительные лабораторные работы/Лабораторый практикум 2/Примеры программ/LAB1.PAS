Program Lab1;
 { Демонстрация основных приемов работы с графической библиотекой }
 { Моделирование плоских геометрических объектов в мировых координатах }
 { и отображение их на экран компьютера }

uses Crt, Graph;

Const
 { размеры двухмерной области видимости }
 { в мировых координатах }
 Xmax : real = 700.5;
 Ymax : real = 500.75;

var
 { переменные для инициализации графического режима }
 Gd, Gm: Integer;
 { переменные для моделирования графических объектов }
 { в мировых координатах }
 PLine   : array[1..2, 1..2] of real; { отрезок прямой }
 PRect   : array[1..2, 1..2] of real; { прямоугольник  }
 { коэффициенты преобразования мировых координат в экранные }
 hx,           { координаты X }
 hy : real;    { координаты Y }

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

begin
  { инициализация графического режима }
  Gd := Detect;
  InitGraph(Gd, Gm, '');
  { неудачная инициализация }
  if GraphResult <> grOk then
    Halt(1);
  { удачная инициализация }
  Randomize;
  { Вычисление коэффициентов преобразования координат }
  hx := Xmax/GetMaxX;
  hy := Ymax/GetMaxY;
  repeat
   Randomize;
   { случайный выбор объекта }
   { 0..10 - прямая, 11..20 - прямоугольник }
   case Random(20) of
    0..10 : begin
         { случайный выбор цвета }
         SetColor(Random(15));
         { определение мировых координат концов отрезка прямой }
         PLine[1,1] := Random(Round(Xmax)) + 0.5; { X1 }
         PLine[1,2] := Random(Round(Ymax)) + 0.5; { Y1 }
         PLine[2,1] := Random(Round(Xmax)) + 0.5; { X2 }
         PLine[2,2] := Random(Round(Ymax)) + 0.5; { Y2 }
         { преобразование к экранным координатам и вывод }
         Line(IX(PLine[1,1],hx), IY(PLine[1,2],hy), IX(PLine[2,1],hx), IX(PLine[2,2],hy));
        end;
    11..20 : begin
         { случайный выбор цвета }
         SetColor(Random(15));
         { определение мировых координат вершин прямоугольника }
         PRect[1,1] := Random(Round(Xmax)) + 0.5; { X1 }
         PRect[1,2] := Random(Round(Ymax)) + 0.5; { Y1 }
         PRect[2,1] := Random(Round(Xmax)) + 0.5; { X2 }
         PRect[2,2] := Random(Round(Ymax)) + 0.5; { Y2 }
         { преобразование к экранным координатам и вывод }
         Rectangle(IX(PRect[1,1],hx), IY(PRect[1,2],hy), IX(PRect[2,1],hx), IX(PRect[2,2],hy));
        end;
    end;
   Delay(2000);
  until KeyPressed;
  Readln;
  CloseGraph;
end.
