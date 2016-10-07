program quadwurz;
uses crt;
var p,q,d,x1,x2:real;
begin
  clrscr;
  writeln('Dieses Program rechnet die m”glichen L”sungen fr x der Gleichung');
  writeln;
  writeln('xı+ p*x +q = 0          aus.');
  gotoxy(15,5);write('p = ');readln(p);
  gotoxy(30,5);write('q = ');readln(q);
  gotoxy(25,7);writeln('xı + ',p:7:3,'*x + ',q:7:3,' = 0');
  d:=p*p/4-q;
  if d>0 then
  begin
     x1:=-p/2+sqrt(d);
     x2:=-p/2-sqrt(d);
     writeln('Es gibt zwei L”sungen fr x. x=',x1:7:3,' und x=',x2:7:3,'.');
  end
  else
     if d=0 then
     begin
        x1:=-1*p/2;
        writeln('Es gibt eine L”sung, x=',x1:7:3);
     end
     else
     begin
        writeln('Es existieren keine L”sungen.');
  end;
  readln;
end.
