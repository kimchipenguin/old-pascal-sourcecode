program zaehle;
uses crt;
var i:integer;
begin
  clrscr;
  for i:=-32768 to 32767 do
  begin
    gotoxy(40,10);
    write(i);
  end;
  gotoxy(40,12);
  writeln('DrÅcke <Enter> !');
end.
