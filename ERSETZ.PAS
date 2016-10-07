program ersetzen;
uses crt;
var s:string;
    i:integer;
    a,b: array[1..10] of char;
procedure ersetz(quelle,ziel,strg:string);
var hilfstrg:string;
begin
  hilfstrg:='';
  for i:=1 to length(strg) do
  begin
    if strg[i]=quelle then
       hilfstrg:=hilfstrg+ziel
    else
       hilfstrg:=hilfstrg+strg[i];
  end;
  writeln(hilfstrg);
end;
procedure init;
begin
  a[1]:='E';a[2]:='N';a[3]:='S';
  a[4]:='I';a[5]:='R';a[6]:='A';
  a[7]:='D';a[8]:='U';a[9]:='H';
  a[10]:='T';
  b[1]:='C';b[2]:='W';b[3]:='Y';
  b[4]:='J';b[5]:='T';b[6]:='S';
  b[7]:='N';b[8]:='G';b[9]:='M';
  b[10]:='F';
end;
procedure sortieren;
var f:text;
begin
  assign(f,'codetxt.dat');
  reset(f);
  while not eof(f) do
  begin
    readln(f,s);
  end;
  for i:=1 to 10
  begin
    ersetz(b[i],a[i],s[a]);

end;


begin
  clrscr;
  init;
  s:='HEUTE GEHT DIE SONNE AUF';
  writeln(s);
  ersetz('E','O',s);
  writeln(s);
  readln;
end.