PROGRAM game_of_life;
USES crt;
VAR g,i,j,nachbar,max_zeilen:INTEGER;
    field:ARRAY [1..90,1..40] OF CHAR;
    nfield:ARRAY [1..90,1..40] of CHAR;
    cells:ARRAY [1..100] OF INTEGER;
    taste:CHAR;
    schnitt:REAL;
    n:BOOLEAN;
LABEL 1;
   { FIELD ist das aktuelle Tummelfeld der Lebensformen, die
     nÑchste Generation wird in NFIELD abgelegt.
     CELLS enhÑlt die Anzahl der Zellen pro Generation.
     n wird verwendet, um festzustellen, ob die Anzahl der Nachbarn
     gerade oder ungerade ist (mittel ODD). Deshalb muû auch der Daten-
     typ BOOLEAN verwendet werden. }
procedure aufbau;
begin
  for i:=1 to max_zeilen+6 do
  begin
    for j:=1 to 70 do
    begin
       if field[j,i]<>'*' then field[j,i]:='.';
       if (j<=63) and (i<=max_zeilen) then
       begin
          gotoxy(j,i);writeln(field[j,i]);
       end;
    end;
  end;
  g:=g+1;
  cells[g]:=0;
end;
procedure statistik;
var hgen,hpop,ngen,npop:INTEGER;
begin
 { n=niedrig, h=hoch, gen=Generation, pop=Population }
  clrscr;
  writeln('                          Statistik');
  gotoxy(15,3);writeln('Simulierte Generationen:',g);
  schnitt:=0;hpop:=0;npop:=32766;
  for j:=1 to g do
  begin
    case j of 1..10: gotoxy(10,5+j);
             11..20: gotoxy(30,5+j-10);
             21..30: gotoxy(50,5+j-20)
    end;
    writeln('| ',j,'          ',cells[j]);
	if cells[j]>hpop then
    begin
	  hgen:=j;hpop:=cells[j];
    end;
    if npop>cells[j] then
    begin
      ngen:=j;npop:=cells[j];
    end;
    schnitt:=schnitt+cells[j];
  end;
  schnitt:=schnitt/j;
  gotoxy(10,17);writeln('Durchschnittliche Population: ',schnitt:5:2);
  gotoxy(10,whereY);writeln('Die ',hgen,'. Generation war am Bevîlkerungreichsten mit ',hpop,' Zellen.');
  gotoxy(10,whereY);writeln('In der ',ngen,'. Generation tummelten sich dagegen nur ',npop,' Zellen.');
  gotoxy(10,whereY+1);writeln('Programmende. Bitte Taste drÅcken.');
  taste:=readkey;
end;

begin
  field[40,12]:='*';field[40,13]:='*';field[39,13]:='*';
  field[40,14]:='*';field[41,13]:='*';
  clrscr;cells[1]:=5;g:=1;max_zeilen:=25;
  write('Wieviele Zeilen hat ihr Bildschirm? (Voreinstellung:25)?');
  readln(j);
  if (j>10) and (j<80) then max_zeilen:=j;
  clrscr;
  gotoxy(65,13);writeln('Zellen:');
  gotoxy(70,14);writeln(cells[1]);
  gotoxy(65,4);writeln('SPIEL DES LEBENS');
  gotoxy(65,10);writeln('Generation:');
  i:=3;
  repeat
    gotoxy(65,i);writeln('================');
    i:=i+3;
  until i=18;
1:
  aufbau;      {Aufbau der nÑchsten Generation}
  gotoxy(70,11);writeln(' ',g-1,'   ');
  for j:=1 to 63 do   {Spalten abarbeiten...}
  begin
     for i:=1 to 24 do {Zeilen abarbeiten...}
     begin
       nachbar:=0;
       if (field[j-1,i]='*') or (field[j+1,i]='*') then nachbar:=nachbar+1;
       if (field[j,i-1]='*') or (field[j,i+1]='*') then nachbar:=nachbar+1;
       n:=ODD(nachbar);
       if n=TRUE then  { Anzahl der Nachbarn ungerade? }
       begin
          if nachbar>0 then
          begin
          nfield[j,i]:='*';  { Die neue oder alte Zelle in das neue Feld Åbernehmen. }
          inc(cells[g]);     { Erhîhe die Anzahl der Zellen um 1}
          end;
       end
       else                  { Ansonsten... }
          nfield[j,i]:='.';  { ...stirbt die Zelle oder bleibt Tot }

     end;
  end;
  gotoxy(75,13);writeln(cells[g-1]:3);gotoxy(65,14);
  taste:=readkey;
  if (cells[g-1]>cells[g]) and (g>1) then
  begin
    writeln('RÅckgÑngig.    ');
  end
  else begin
    if cells[g-1]=cells[g] then
    begin
       writeln('Gleichbleibend.');
    end
    else
    begin
       writeln('Ansteigend.    ');
    end;
  end;  
  if cells[g]=0 then        { Sind alle Zellen tot? }
  begin
     gotoxy(65,16);writeln('Ausgestorben.');
     gotoxy(68,17);writeln('Schnief!');
  end;
  { So, das neue Feld ist berechnet. Jetzt muû es nur noch dargestellt
    werden. DafÅr wird jetzt die nicht mehr benîtigte alte Generation
    Åberschrieben. }
  for j:=1 to 70 do
  begin
    for i:=1 to 24 do field[j,i]:=nfield[j,i];
  end;
  if (g<21) and (taste<>chr(27)) then goto 1;
  dec(g);
  gotoxy(10,24);writeln('Simulation beendet. Statistik? (J/N)');
  taste:=readkey;
  if upcase(taste)='J' then statistik;
end.
