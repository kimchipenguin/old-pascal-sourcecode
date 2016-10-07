program ascii;
uses crt;
var s:char;i:integer;
begin
  clrscr;
  for i:=31 to 255 do
  begin
    write(i:4,chr(i):2,' ');
    if i mod 10=0 then writeln;
  end;
  readln;
end.