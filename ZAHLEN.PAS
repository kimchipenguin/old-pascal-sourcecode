program zahlen;
uses crt;
var i,zahl1,zahl2:integer;
begin
  clrscr;
  zahl1:=100; zahl2:=200;
  for i:=zahl1 to zahl2 do
  begin
    write(i:5);
  end;
  gotoxy(3,10);
  writeln('Drcke <Enter> !');
  readln;
end.
