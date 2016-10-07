program code;
uses crt;
var s:char;i:integer;
begin
  clrscr;
  write('Gib ein Zeichen ein: ');
  readln(s);
  writeln('Der Code des Zeichens ',s,' ist: ',ord(s));
  readln;
end.