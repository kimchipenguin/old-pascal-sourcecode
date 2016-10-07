program mittelwert;
uses crt;
var zahl:integer;summe,i:real;
begin
  clrscr;
  i:=0;summe:=0;
  gotoxy(15,1);writeln('Mittelwert aus beliebig vielen Zahlen');
  repeat
     i:=i+1;
     summe:=summe+zahl;
     gotoxy(20,6);write(i:3:0,'. Zahl:');
     readln(zahl);
  until zahl=0;
  i:=i-1;
  writeln('Mittelwert aus ',i:3:0,' Zahlen: ',summe/i:4:2);
  readln;
end.
