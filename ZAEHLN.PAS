program zaehlen;
uses crt;
var i,durchlauf,s:integer;
begin
  clrscr;
  durchlauf:=0;
  s:=1;
  repeat
     durchlauf:=durchlauf+1;
     repeat
        i:=i+s;
        gotoxy(30,10);writeln(i:7);
     until i=10000 or i=0;
     s:=s*-1;
  until durchlauf=5;
end.
