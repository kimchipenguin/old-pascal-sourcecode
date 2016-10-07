program fibonacci;
uses crt;
var g: integer;

function fibo(n:integer): integer;
begin
  if (n=1) or (n=2) then fibo:=1;
  gotoxy(1,20);writeln('n=',n);
  if n>2 then fibo:=fibo(n-1)+fibo(n-2);
end;

begin
  clrscr;
  write('Gib`mir eine Zahl!');readln(g);
  writeln('Danke!');
  writeln(fibo(g));
  readln;
end.
