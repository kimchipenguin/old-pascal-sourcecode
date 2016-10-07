program zufi_chars;
uses crt;
var r,i,x,y:integer;
begin
  clrscr;
  for i:=1 to 300 do
  begin
      x:=random(79)+1;
      y:=random(20)+1;
      r:=random(26)+65;
      gotoxy(x,y);writeln(chr(r));
  end;
  readln;
end.
