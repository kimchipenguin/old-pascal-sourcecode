program copyshop;
uses crt;
var i,nr,kosten:real;
begin
  clrscr;
  gotoxy(25,1); writeln('Willkommen im Copy-Shop!');
  gotoxy(25,2); writeln('------------------------');
  write('St�ckzahl:');readln(i);
  writeln('W�hlen sie nun einen unserer Tarife aus:');
  gotoxy(15,7);writeln('Tarif 1: Einfachkopie zu   0,07 DM/St�ck.');
  gotoxy(15,8);writeln('  "   2: Qualit�tskopie zu 0,10 DM/St�ck');
  gotoxy(15,9);writeln('  "   3: Vergr��erung/Verkleinerung zu 0,20 DM/St�ck.');
  writeln;
  write('Geben sie die Tarifnummer ein: ');readln(nr);
  writeln;
  if nr=1 then
  begin
     kosten:=i*0.07;
  end
  else
     if nr=2 then
     begin
        kosten:=i*0.01;
     end
     else
     begin
        kosten:=i*0.02;
  end;
  writeln(i:5:0,' Kopien zum Tarif ',nr:1:0,' kosten ',kosten:5:2,' Mark.');
  readln;
end.
