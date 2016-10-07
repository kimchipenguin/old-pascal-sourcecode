program zufi;
uses crt;
var x:real;i:integer;
begin
randomize;
(* Zufallszahlen zwischen -5 und +5 *)
clrscr;
for i:=1 to 50 do
begin
    x:=-5+random(11);
    writeln(x:5:2);
    readln;
end;
end.