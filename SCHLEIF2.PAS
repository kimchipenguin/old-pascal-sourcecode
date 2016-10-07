program schleife;
uses crt;
var i,k:integer;
begin
  clrscr;
  k:=10;i:=0;
  repeat
     i:=i+1;
     writeln(i,') ',i*k);
  until i=10;
  readln;
end.
