program dr_zahl;
uses crt;
var x,i,ver,pengo:integer;
begin
  clrscr;
  randomize;
  gotoxy(20,1);writeln('Zahlenraten');
  write('Zufallszahlen von 1 bis...');readln (pengo);
  x:=random(pengo)+1;
  ver:=0;
  repeat
    ver:=ver+1;
    write('Zahl: ');readln(i);
    if i>x then writeln('Die gesuchte Zahl ist kleiner.');
    if i<x then writeln('Die gesuchte Zahl ist gr”áer.');
  until i=x;
  writeln('Die gesuchte Zahl war: ',x);
  writeln('Ben”tigte Versuche: ',ver);
  readln;
end.

