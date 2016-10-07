program buchst;
uses crt;
var s:string;zeichen:char;m,spalte,zeile:integer;

function n(t:string;z:char):integer;
var i,anzahl:integer;
begin
  anzahl:=0;
  for i:=1 to length(t) do
  begin
    if t[i]=z then anzahl:=anzahl+1;
  end;
  n:=anzahl;
end;

procedure ende;
begin
  gotoxy(1,25);write('Beliebige Taste drcken');
  repeat until keypressed;
end;

begin
  clrscr;
  write('Satz :');readln(s);
  spalte:=-2;
  zeile:=3;
  for m:=65 to 122 do
  begin
    spalte:=spalte+6;
    if spalte>=80 then
    begin
      spalte:=4;
      zeile:=zeile+1;
    end;
    gotoxy(spalte,zeile);
    zeichen:=chr(m);
    write(chr(m),': ',n(s,zeichen):2,' ')
  end;

    ende;
end.
