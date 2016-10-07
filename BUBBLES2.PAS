program bubblesort2;
uses crt,dos;
var a: array[1..2000] of word;
    i,j,hs:integer;
    h1,h2,min1,min2,s1,s2,hs1,hs2:word;

procedure tausche(s,t: integer);
var merke: integer;
begin
  merke:=a[s];
  a[s]:=a[t];
  a[t]:=merke;
end;

begin
  clrscr; randomize;
  hs:=0;
  gettime(h1,min1,s1,hs1);
  for i:=1 to 2000 do a[i]:=1+random(1000);
  for j:=1 to 1999 do
  begin
    for i:=1 to 2000-j do
    begin
      if a[i]>a[i+1] then tausche(i,i+1);
    end;
  end;
  gettime(h2,min2,s2,hs2);
  for i:=1 to 2000 do write(a[i]:5);
  writeln;
  writeln(h1,':',min1,' ',s1,' ',hs1);
  writeln(h2,':',min2,' ',s2,' ',hs2);
  if hs2>hs1 then
    hs:=hs2-hs1
  else
  begin
    hs:=100-hs1+hs2;
  end;
  if s2>s1 then hs:=hs+100;
  writeln('Zeit in Hundertstel:',hs);
  readln;
end.

