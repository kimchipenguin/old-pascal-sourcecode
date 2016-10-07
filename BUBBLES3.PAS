program bubblesort3;
uses crt,dos;
var a: array[1..5] of string;
    i,j,hs:integer;
    h1,h2,min1,min2,s1,s2,hs1,hs2:word;
    b:char;
    d:char;
procedure tausche(s,t: integer);
var merke: string;
begin
  merke:=a[s];
  a[s]:=a[t];
  a[t]:=merke;
end;

procedure zufi_wordi;
begin
  for i:=1 to 5 do
  begin
     a[i]:='';
     for j:=1 to 10 do
     begin
       b:=chr(65+random(26));
       a[i]:=a[i]+b;
     end;
     writeln(a[i]);
  end;
end;

begin
  clrscr; randomize;
  zufi_wordi;
  hs:=0;
  gettime(h1,min1,s1,hs1);
  for j:=1 to 4 do
  begin
    for i:=1 to 5-j do
    begin
       if a[i]>a[i+1] then tausche(i,i+1);
    end;
  end;
  gettime(h2,min2,s2,hs2);
  for i:=1 to 5 do writeln(a[i]);
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

