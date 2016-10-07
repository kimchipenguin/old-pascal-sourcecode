program sort;
uses crt;
var z1,z2,z3,swap,i:integer;
begin
clrscr;
write('Zahl 1:');readln(z1);
write('Zahl 2:');readln(z2);
write('Zahl 3:');readln(z3);
for i:=1 to 3 do
begin
   if z1>z2 then
   begin
      swap:=z2;
      z2:=z1;
      z1:=swap;
   end;
   if z2>z3 then
   begin
      swap:=z3;
      z3:=z2;
      z2:=swap;
   end;
end;
swap:=0;
writeln(z1,' ',z2,' ',z3);
readln;
end.


