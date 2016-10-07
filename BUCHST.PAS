program buchst;
uses crt;
var s:string;zeichen:char;

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
  writeln('Gib einen Satz ein'); readln(s);
  write('Welches zeichen soll gez„hlt werden? ');readln(zeichen);
  writeln('Der Buchstabe ',zeichen,' kommt ',n(s,zeichen),'-mal vor');
  ende;
end.
