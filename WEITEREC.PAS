program weite_rec;
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
  rewrite(f);
  write('Name              Vorname               Weite');
  for i:=1 to 5 do
  begin
    gotoxy(1,i+1);readln(weite.name);
    gotoxy(19,i+1);readln(weite.vorname);
    gotoxy(41,i+1);readln(weite.weight);
    write(f,weite);
  end;
  close(f);
end.

