program rekursiv_1;
uses crt;
var zahl1, zahl2,zaehler: integer;
function rest(a,b:integer): integer;
begin
  inc(zaehler);
  if a<b then rest:=a else rest:= rest(a-b,b);
end;
begin
  clrscr;zaehler:=0;
  write('Zahl1='); readln(zahl1);
  write('Zahl2='); readln(zahl2);
  write('Rest beim Teilen von ',zahl1,' durch ',zahl2,' ist ');
  writeln(rest(zahl1,zahl2));
  writeln('Funktion rest wurde ',zaehler,'-mal durchlaufen');
  readln;
end.
