program simu_wuerf;
uses crt;
var s,h,i,r:integer;
    wartez:real;
    str:char;
begin
  randomize;
  clrscr;
  write('Wie viele Versuchsserien? ');
  readln(s);
  for i:=1 to s do
  begin
     h:=0;
     repeat
       h:=h+1;
       r:=random(6)+1;
       write(r:2);
     until r=6;
     gotoxy(60,i+1);writeln(h:2);
     wartez:=wartez+h;
  end;
  writeln;
  writeln('Mittlere Wartezeit: ',wartez/i:4:2);
  str:=readkey;
end.
