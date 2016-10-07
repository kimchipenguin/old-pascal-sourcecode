program directory;
uses crt, dos;
var dirinfo: searchrec;
    i: integer;
begin
  clrscr;
  writeln('               Directory Laufwerk A!');
  findfirst('a:\*.*',archive, dirinfo);
  i:=0;
  while doserror=0 do
  begin
    write(dirinfo.name);gotoxy(40,wherey);write(dirinfo.size);gotoxy(50,wherey);
    findnext(dirinfo);
    inc(i);
    if i=24 then
    begin
      readln;
      clrscr;
    end;
    if pos('.PAS',dirinfo.name)>0 then
      writeln('PASCAL-Programm')
    else
      writeln;
  end;
  readln;
end.
