program lotto_z;
uses crt;
var zahl: array [1..6] of integer;
    lotto: array [1..49] of integer;
    i,j,g,z:integer;

procedure anfang;
begin
  randomize;
  clrscr;
  writeln('Lotto 6 aus 49!');
  writeln('Die Zahlen der heutigen Ziehung:');
  writeln;
  for z:=1 to 20 do
  begin
    for i:=1 to 49 do lotto[i]:=0;
    g:=0;
    writeln;
    for i:=1 to 6 do
    begin
      repeat
      zahl[i]:=1+random(49);

        g:=0;
        for j:=1 to i do
        begin
          if zahl[j]=zahl[i] then g:=g+1;
        end;
      until g=1;
      lotto[zahl[i]]:=1;
    end;
          for i:=1 to 49 do
      begin
        if lotto[i]=1 then write(i:3);
      
    end;
  end;
end;

procedure ende;
begin
  gotoxy(1,25);write('Beliebige Taste drÅcken.');
  repeat until keypressed;
end;

begin
  anfang;
  ende;
end.
