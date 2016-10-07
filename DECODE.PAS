program decodierer;
uses crt;
var s:array [65..90] of char;
    r,t:char;
    f,g:text;
    satz:array [1..100] of string;
    i,z:integer;
    b:string;
label 1;
function entcode(t:string):string;
var j:integer;
begin
  for j:=1 to length(t) do
  begin
    if (ord(t[j])>64) and (ord(t[j])<91) then t[j]:=s[ord(t[j])];
    entcode:=t;
  end;
end;

begin
  assign(f,'a:\codetext.txt');
  reset(f);
  for i:=65 to 90 do s[i]:=chr(i);
  s[ord('C')]:='E';
  s[ord('W')]:='N';
  s[ord('Y')]:='I';
  s[ord('J')]:='S';
  s[ord('S')]:='R';
  s[ord('R')]:='Y';
  s[ord('M')]:='D';
  s[ord('N')]:='A';
  s[ord('F')]:='U';
  s[ord('U')]:='W';
  s[ord('G')]:='H';
  s[ord('V')]:='O';
  s[ord('L')]:='Q';
  s[ord('Q')]:='M';
  s[ord('E')]:='C';
  s[ord('I')]:='L';
  s[ord('Z')]:='B';
  s[ord('X')]:='G';
  s[ord('H')]:='Z';
  s[ord('D')]:='K';
  s[ord('B')]:='F';
  s[ord('K')]:='P';
  s[ord('A')]:='V';
  s[ord('O')]:='J';
  i:=1;
  while not eof(f) do
  begin
    readln(f,satz[i]);
    inc(i);
  end;
1:
  assign(g,'XMAS.TXT');
  rewrite(g);
  for z:=1 to i do
  begin
    writeln(satz[z]);
    b:=entcode(satz[z]);
    writeln(b);
    writeln(g,b);
    { readln(r); }
    if r='E' then
    begin
       write('Ersetze:');readln(r);
       write('Mit:');readln(t);
       s[ord(r)]:=t;
    end;
  end;
  close(f);close(g);

end.

