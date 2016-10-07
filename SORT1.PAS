program sort1;
uses crt;
var min,platz:word; a: array[0..1000] of word;
    i,j,k,n: integer;
    vergl,transp:longint;
procedure tausche(s,t:integer);
var merke:word;
begin
  merke:=a[s]; a[s]:=a[t]; a[t]:=merke;
  inc (transp);
end;
begin
  n:=1000;vergl:=0; transp:=0;
  for i:=1 to n do a[i]:=1+random(255);
  for i:=1 to n-1 do
  begin
    for j:=i+1 to n do
    begin
      inc(vergl);
      if a[j]<a[i] then tausche(j,i);
    end;
  end;
  writeln('Transporte:',transp);
  writeln('Vergleiche:',vergl);
  readln;
end.
