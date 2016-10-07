program datei_1;
uses crt;
var s:string; f:text;
begin
  clrscr;
  assign(f,'a:\krank.txt');
  reset(f);
  while not eof(f) do
  begin
    readln(f,s);
    writeln(s);
    repeat until readkey=' ';
  end;
  close(f);
  repeat until keypressed;
end.
