program datei_3;
uses crt;
var s:string; f:file of integer; i:integer;

begin
  clrscr;
  assign(f,'a:\zahlen.dat');
  reset(f);
  while not eof(f) do
  begin
    read(f,i); write(i:5);
  end;
  close(f);
  repeat until keypressed;
end.
