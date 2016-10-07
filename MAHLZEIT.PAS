program rekursiv_2;
uses crt;
var preis: real; anz: integer;
procedure mahlzeit(i: integer);
begin
  if i>0 then begin
     Sound(random(10)*22);
     Delay(400);
     NoSound;
     writeln('Herr Ober, ein StÅck Kuchen bitte !');
     writeln('hmmmmmmmmmmmmmm .... das schmeckt !');
     preis:=preis+1.2;
     delay(1);
     mahlzeit(i-1);
  end else
     writeln('Herr Ober, die Rechnung bitte !');
end;

begin
  clrscr;preis:=0;
  write('Wieviele StÅcke soll ich ihnen bringen?');readln(anz);
  mahlzeit(anz);
  writeln('Das macht ',preis:5:2,' DM.');
  readln;
end.

