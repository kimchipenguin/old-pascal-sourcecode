program datei_2;
uses crt;
var s:string; f:file of integer; i:integer;

begin
  clrscr;
  assign(f,'a:\zahlen.dat');
  rewrite(f);
  for i:=1 to 1000 do  write(f,i);
  close(f);
  writeln('Programmende. Bitte Taste drcken.');
  repeat until keypressed;
end.
