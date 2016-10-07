program sortiere;
uses crt, dos;
var i,j,k:integer; a:array [0..4000] of word;
    x,h1,h2,min1,min2,s1,s2,hs1,hs2: word;

procedure tausche(s,t:integer);
var merke:word;
begin
  merke:=a[s]; a[s]:=a[t]; a[t]:=merke;
end;


begin
  clrscr; randomize;
  gettime(h1,min1,s1,hs1);
  for i:=1 to 1000 do
  begin
     for j:=i+1 to 999 do
     begin
       if a[j]<a[i] then tausche(j,i);
       for k:=1 to 5 do write(a[k]:5);
       writeln;
     end;
  end;
  gettime(h2,min2,s2,hs2);
  for i:=1 to 1000 do write(a[i]:4);
  writeln;
  writeln(h1,':',min1,' ',s1,' ',hs1);
  writeln(h2,':',min2,' ',s2,' ',hs2);
  writeln('Zeit in Sekunden: ',((s2-s1)*100+hs2-hs1)/100:5:2);

  readln;
end.
