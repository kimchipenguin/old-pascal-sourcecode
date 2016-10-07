program sort2;
uses crt;
var min,platz:word; a: array[0..1000] of word;
    i,j,k,n: integer;
    vergl,transp:longint;
begin
  n:=1000;vergl:=0; transp:=0;
  for i:=1 to n do a[i]:=1+random(255);
  for i:=1 to n-1 do
  begin
    min:=a[i]; platz:=1;inc(transp);
    for j:=i+1 to n do
    begin
      inc(vergl);
      if a[j]<min then
      begin
        inc(transp);
        min:=a[j]; platz:=j;
      end;
    end;
  end;
  for k:=platz downto i+1 do
  begin
    a[k]:=a[k-1];inc(transp);
  end;
  a[i]:=min;
  inc(transp);
  writeln('Transporte:',transp);
  writeln('Vergleiche:',vergl);
  readln;
end.
