program schleife;
uses crt;
var i,k:integer;
begin
  clrscr;
  k:=10;i:=0;
  while i<10 do
  begin
     i:=i+1;
     writeln(i,') ',i*k);
  end;
  readln;
end.
