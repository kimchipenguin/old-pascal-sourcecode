program string2;
uses crt;
var satz:string[30];vorname,nachname:string[20];i:integer;
begin
  clrscr;
  writeln('Programm STRING II!');
  write('Vorname  = '); readln(vorname);
  write('Nachname = '); readln(Nachname);
  write('Satz     = '); readln(satz);
  writeln;
  for i:=1 to 100 do
  begin
     writeln(vorname,' ',nachname,' ',satz);
  end;
  writeln('Programm fertig. DrÅcke <Enter>!');
  readln;
end.
