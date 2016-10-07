program weite_sor;
uses crt,dos;
type weit = record
             name:     string[20];
             vorname:  string[20];
             weight:   real;
             end;
var i,j,rec_len:integer;
    f: file of weit;
    weite: weit;
    weiten: array [1..10] of real;
    erstname: array [1..10] of string[20];
    nachname: array [1..10] of string[20];
    trans:string[20];
    transreal: real;
begin
  clrscr;
  assign(f,'weite.dat');
  reset(f);
  write('Name              Vorname               Weite');
  i:=1;
  while not eof(f) do
  begin
    read(f, weite);
    erstname[i]:=weite.vorname;
    nachname[i]:=weite.name;
    weiten[i]:=weite.weight;
    inc(i);
  end;
  rec_len:=i-1;
  close(f);
  for i:=1 to rec_len-1 do
  begin
    for j:=i+1 to rec_len do
    begin
       if weiten[j]<weiten[i] then
       begin
          transreal:=weiten[j];
          weiten[j]:=weiten[i];
          weiten[i]:=transreal;
          trans:=erstname[j];
          erstname[j]:=erstname[i];
          erstname[i]:=trans;
          trans:=nachname[j];
          nachname[j]:=nachname[i];
          nachname[i]:=trans;
       end;
    end;
  end;
  assign(f,'weite2.dat');
  rewrite(f);
  for i:=1 to 5 do
  begin
    weite.name:=nachname[i];
    weite.vorname:=erstname[i];
    weite.weight:=weiten[i];
    gotoxy(1,i+1);write(nachname[i]);
    gotoxy(19,i+1);write(erstname[i]);
    gotoxy(41,i+1);writeln(weiten[i]:8:3);
    write(f,weite);
  end;
  close(f);
  readln;
end.

