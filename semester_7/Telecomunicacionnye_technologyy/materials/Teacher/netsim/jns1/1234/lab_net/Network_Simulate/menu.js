//=============================================================

function Main_Menu() {
  document.write('<h3 style="margin-top:-10;">Моделирование функционирования IP-сетей.</h3>');
  document.write('Лабораторный практикум');
  document.write("<div style='text-align:left; margin-top:5px; margin-bottom:-10px;'>");
  document.write("Cоставитель: к.т.н., доц. Хабаров С.П.<br>Содержание:</div>");
   document.write("<div style='margin:-13px 0px 0px 80px; text-align:justify;'>");
    document.write("            &nbsp;<a href='../NetSimulate/lab0.htm'   title=' Общие сведения о лабораторном практикуме '        >Введение</a>");
    document.write("&nbsp;&nbsp;&nbsp;<a href='../NetSimulate/lab1.htm'   title=' Адресация и простейшая маршрутизация в IP-сетях '  >Лаб.работа&nbsp;№1</a>");
    document.write("&nbsp;&nbsp;&nbsp;<a href='../NetSimulate/lab2.htm'   title=' Статическая маршрутизация в IP-сетях '             >Лаб.работа&nbsp;№2</a>");
    document.write("&nbsp;&nbsp;&nbsp;<a href='../NetSimulate/lab3.htm'   title=' Протоколы транспортного уровня TCP и UDP '         >Лаб.работа&nbsp;№3</a>");
    document.write("&nbsp;&nbsp;&nbsp;<a href='../NetSimulate/lab4.htm'   title=' Уровень приложений: протоколы TELNET И SNMP '>Лаб.работа&nbsp;№4</a>");
    document.write("&nbsp;&nbsp;&nbsp;<a href='../NetSimulate/manual.htm' title=' Назначения и описание работы имитатора javaNetSim '>Описание&nbsp;имитатора</a>");
   document.write("</div>");
  document.write("<div style='margin-bottom:-5px;'><hr></div></div>");
}

function Ris(dir, zagl, h) {
        document.write("<br /><div align='center'>");
        document.write("<IMG border=0 src='"+dir+"' title='"+zagl+"' height="+h+"><br>");
        document.write("<p>"+zagl +"</p>");
        document.write("</div>");
}

function LinkUpDown(Link_UP, Link_DOWN) {
        document.write("<hr>© Сергей Хабаров, 2011 г.<p align='right'>");
        document.write("<A href='"+Link_UP+  "'> &lt; Предыдущий раздел - - </A>");
        document.write("<A href='"+Link_DOWN+"'> - - Следующий раздел &gt;</A>");
        document.write("</p>");
} 
//42
function Link_Menu(glava) {
        var p="../NetSimulate/";
        switch (glava) {
        case "0":  
                LinkUpDown('#'          , p+'lab1.htm')  ; break
        case "1":  
                LinkUpDown(p+'lab0.htm' , p+'lab2.htm')  ; break
        case "2":  
                LinkUpDown(p+'lab1.htm' , p+'lab3.htm')  ; break
        case "3":  
                LinkUpDown(p+'lab2.htm' , p+'lab4.htm')  ; break 
        case "4":  
                LinkUpDown(p+'lab3.htm' , p+'manual.htm') ; break 
        case "5":  
                LinkUpDown(p+'lab4.htm' , p+'lab0.htm') ; break 
        default: 
                LinkUpDown(p+'lab0.htm', '#') 
        }
}

//===================================================================================================
// My Service Function
//===================================================================================================


function tbl_stroka(stroka,bgrd) {
        var txt="";
        var txt_style;
        for (i=0; i<stroka.length; i++) txt=txt +"<td>"+stroka[i]+"</td>"
        switch (bgrd) {
        case "":  
                txt_style = ""; break
        case "1":  
                txt_style = "style='background:#EEEEEE;'"; break
        case "2":  
                txt_style = "style='background:#FFFFBB;'"; break
        default: 
                txt_style = "style='background:#"+bgrd+";'"
        }
        document.write("<tr class=MainText valign=top align=left "+txt_style+">"+txt+"</tr>")  
}

// ---------------------------------------------------------- 
  function bigwin(big_img,w,h)
// ---------------------------------------------------------- 
{
  var parwin="top=20,left=20,width="+w+",height="+h+",status=no,toolbar=no,menubar=no"
  myWin= open("", "imgwin", parwin);
  myWin.document.open(); 
  myWin.document.write("<html><head><title>View image</title></head>");
  myWin.document.write("<body onblur=self.close() bgcolor='fffeef'><center>");
  myWin.document.write("<img border='0' src='"+big_img+"' valign='middle'>");
  myWin.document.write("</center></body></html>");
  myWin.document.close();  
}

// ---------------------------------------------------------- 
  function myRisBig(imgName, text, border, IsBig, Width)
// ---------------------------------------------------------- 
{
  var x="";
  var y="";
  document.write("<div class='ris'>");
  x = x+"<IMG border=" + border + " src='Image/"+imgName+"' ";
  if (IsBig !== undefined) {
    var y= "'Image/big" + imgName + "'"
    x = x + ' onclick="bigwin('+y+',840, 690); "';
        y = " (Сlick - для увеличения)";
  }
  x = x + " title='" + text + y +"' "
  if (Width !== undefined) {
    var y= " width='" + Width + "' "
    x = x + y;
  }
  //alert(x);
  document.write( x + " > " );
  document.write("<p style='margin-bottom:5;'>"+text+"</p>");
  document.write("</div>");  
}        

function variant(nLab, n, stroka, NotViewRis) {
        var txt="Структура исследуемой сетевой архитектуры - вариант №"+n;
        var ris=nLab+"_"+n+".gif";
        var nris=n+1;
        var nris="Рис. "+nLab+"."+nris;
        document.write("<br><p><u>Вариант "+n+"</u></p>");
        if (NotViewRis == undefined) {
            myRisBig(ris,nris+". "+txt,0);
            document.write("<ul><li>Файл со схемой сети: lab"+nLab+"_var"+n+".jfst.");
        }       
        for (i=0; i<stroka.length; i++) document.write("</li><li>"+stroka[i]);
        document.write("</li></ul>");
}
