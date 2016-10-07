program wachstum;
uses crt;
var indien,china:real;i,x:integer;
const rate_indien=1.021;
      rate_china=1.014;
begin
  indien:=700;china:=990;x:=0;
  clrscr;
  i:=1986;
  writeln('Jahr         Indien          China');
  writeln('  1986      ',indien:7:2,'       ',china:7:2);
  repeat
    i:=i+1;
    x:=x+1;
    if x=20 then
    begin
       readln;
       clrscr;
       x:=0;
       gotoxy(1,1);
       writeln('Jahr         Indien          China');
    end;
    indien:=indien*rate_indien;
    china:=china*rate_china;
    writeln(i:6,'      ',indien:7:2,'       ',china:7:2);
  until indien>china;
  writeln;
  writeln('Indien hat mehr Einwohner als China im Jahr ',i);
  readln;
end.
