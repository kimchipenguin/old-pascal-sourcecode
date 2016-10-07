program haeufigkeit;
uses crt;
var test:array[65..90] of integer;
    nr,i:integer;
    f,g: text; s:string;
begin
  clrscr;
  assign(f,'a:\codetext.txt');
  reset(f);
  for i:=65 to 90 do test[i]:=0;
  while not eof(f) do
  begin
    readln(f,s);
    for i:=1 to length(s) do
    begin
      nr:=ord(s[i]);
      if (nr>64) and (nr<91) then inc(test[nr]);
    end;
  end;
  close(f);
  assign(g,'a:\codetxt.dat');
  rewrite(g);
  for i:=65 to 90 do writeln(g,chr(i),'; ',test[i]);
  close(g);
end.

