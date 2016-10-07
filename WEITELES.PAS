program weite_les;
uses crt,dos;
type weit = record
             name:     string[20];
             vorname:  string[20];
             weight:   real;
             end;
var i:integer;
    f: file of weit;
    weite: weit;
begin
  clrscr;
  assign(f,'weite.dat');
  reset(f);
  write('Name              Vorname               Weite');
  i:=1;
  while not eof(f) do
  begin
    read(f, weite);
    gotoxy(1,i+1);write(weite.name);
    gotoxy(19,i+1);write(weite.vorname);
    gotoxy(41,i+1);writeln(weite.weight:8:3);
    inc(i);
  end;
  close(f);
  readln;
end.

