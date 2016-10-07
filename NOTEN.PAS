program noten;
uses crt;
var note,x,i,zeile:integer;s,name:string[15];
procedure schreibe_note(var x:integer);
begin
  if x=1 then name:='Sehr gut.';
  if x=2 then name:='Gut.';
  if x=3 then name:='Befriedigend.';
  if x=4 then name:='Ausreichend.';
  if x=5 then name:='Mangelhaft.';
  if x=6 then name:='UngenÅgend.';
end;

begin
  clrscr;
  writeln('Zensurenliste');
  write('Wie viele FÑcher? ');readln(i);
  z:=0;
  for x:=1 to i do
  begin
    zeile:=wherey;
    write('Fach: ');readln(s);
    gotoxy(30,zeile);write('Note: ');readln(note);
    gotoxy(50,zeile);schreibe_note(note);writeln(name);
  end;
  readln;
end.
