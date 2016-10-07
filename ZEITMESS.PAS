program zufi_zeit;
uses crt, dos;
var zufi: array [1..50005] of byte;
    husek,sek,bla,i,z: word;
begin
  clrscr;
  settime(00,00,00,00);
  z:=50000;i:=0;
  for i:=1 to 50000 do zufi[i]:=1+random(100);
  gettime(bla,bla,sek,husek);
  writeln(sek,' Sekunden ',husek,' hundertstel');
  readln;
end.
