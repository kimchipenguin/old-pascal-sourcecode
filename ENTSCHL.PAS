program kodierer;
uses crt;
var f,g:text;s:string;z:char;versch:integer;

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
  assign(f,'a:\geheim1.txt');
  assign(g,'a:\ngeheim1.txt');
  reset(f); readln(f,s);
  for versch:=1 to 25 do
  begin
    textcolor(cyan);writeln(versch);writeln(entschluessel(s,versch));
    textcolor(yellow);writeln('>Entschlsseln? (J/N)');
    z:=readkey;
    gotoxy(1,wherey-1);write('                     ');gotoxy(1,wherey);
    if (z='J') or (z='j') then
    begin
      textcolor(white);
      schreib;
      lies;
      halt;
    end;
  end;
  lies;
end.


