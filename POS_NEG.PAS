program posneg;
uses crt;
var x:real;
begin
  clrscr;
  write('Bitte eine Zahl eingeben:');
  readln(x);
  if x<0 then
  begin
     writeln(x:10:2,' ist negativ');
  end
  else
     if x=0 then
     begin
        writeln('x ist Null');
     end
     else
     begin
        writeln(x:10:2,' ist positiv.');
     end;
  readln;
end.

