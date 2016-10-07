program kodierer;
uses crt;
var f,g:text;s,d1,d2:string;z:char;versch:integer;

function entschluessel(t:string; v:integer):string;
var h,k:integer; hilf:string;
begin
  hilf:='';
  for k:=1 to length(t) do
  begin
    h:=ord(t[k]);
    if (h>64) and (h<91) then h:=h+v;
    if h>90 then h:=h-26;
    hilf:=hilf+chr(h);
  end;
  entschluessel:=hilf;
end;
procedure schreib;
begin
  clrscr;
  reset(f); rewrite(g);
  while not eof(f) do
  begin
    readln(f,s);
    writeln(g,entschluessel(s,versch));
  end;
  close(f); close(g)
end;
procedure lies;
begin
  clrscr; reset(g);
  while not eof(g) do
  begin
    readln(g,s);
    writeln(s);
    repeat until readkey=' ';
  end;
  close(g);
end;

begin
  clrscr;
  write('Dateiname der zu verschluesselnden Datei:');readln(d1);
  write('Dateiname der neuen Datei:');readln(d2);
  write('Verschlsselung:');readln(versch);
  assign(f,d1);
  assign(g,d2);
  schreib;
  lies;
end.


