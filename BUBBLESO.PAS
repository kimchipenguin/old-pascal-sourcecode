program bubblesort;
uses crt;
var a: array[1..100] of integer;
    i,j:integer;

procedure tausche(s,t: integer);
var merke: integer;
begin
  merke:=a[s];
  a[s]:=a[t];
  a[t]:=merke;
end;

begin
  for i:=1 to 100 do a[i]:=1+random(1000);
  for j:=1 to 99 do
  begin
    for i:=1 to 100-j do
    begin
      if a[i]>a[i+1] then tausche(i,i+1);
    end;
  end;
  for i:=1 to 100 do
  begin
    writeln(a[i]);
    readln;
  end;
end.

