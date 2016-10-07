program auswahl;
uses crt;
var s:char;
begin
  clrscr;
  writeln('Auswahl: Experte <e>  Anf„nger <a>  Abbruch <ESC>');
  repeat
    s:=readkey;
  until (s='e') or (s='a') or (s=chr(27));
  gotoxy(1,10);
  if s='e' then writeln('Expertenmodus');
  if s='a' then writeln('Anf„ngermodus');
  if s=chr(27) then writeln('Abbruch');
  readln;
end.
