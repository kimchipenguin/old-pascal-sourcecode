program string1;
uses crt;
var satz:string;vorname,nachname:string[20];i:integer;
begin
  clrscr;
  write('Vorname  = '); readln(vorname);
  write('Nachname = '); readln(Nachname);
  satz:='Ñrgert Joohsie';
  writeln;
  for i:=1 to 100 do
  begin
     writeln(vorname,' ',nachname,' ',satz);
  end;
  writeln('Programm fertig. DrÅcke <Enter>!');
  readln;
end.
