program wuerfel6;
uses crt;
var sechs:real;i,zahl:word;
begin
   clrscr;
   gotoxy(15,1);writeln('HÑufigkeit der 6er in 6000 Zufallszahlen');
   gotoxy(15,2);writeln('----------------------------------------');
   gotoxy(25,11);writeln('Anzahl der 6er:');
   sechs:=0;
   for i:=1 to 6000 do
   begin
      zahl:=1+random(6);
      if zahl=6 then
         sechs:=sechs+1;
         gotoxy(30,12);writeln(sechs:5:0);
      end;
   gotoxy(1,24);writeln('Fertig! <Enter> drÅcken!');
   readln;
end.

