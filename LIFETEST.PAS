PROGRAM game_of_life;
USES crt;
VAR g,i,j:INTEGER;
    field:ARRAY [0..70,0..30] OF integer;
    nfield:ARRAY [0..70,0..30] of integer;
    cells:ARRAY [1..100] OF INTEGER;
    taste:CHAR;
    schnitt:REAL;
    F:text;a:string;
LABEL 1;
   { FIELD ist das aktuelle Tummelfeld der Lebensformen, die
     nÑchste Generation wird in NFIELD abgelegt.
     CELLS enhÑlt die Anzahl der Zellen pro Generation.
     n wird verwendet, um festzustellen, ob die Anzahl der Nachbarn
     gerade oder ungerade ist (mittels ODD). Deshalb muû auch der Daten-
     typ BOOLEAN verwendet werden. Der Variable F wird spÑter der Datei
     name 'LIFETITL.DAT' zugewiesen. }
procedure loesche_felder;
begin
  { lîscht das Feld, in das die nÑchste Generation abgelegt wird. }
  for i:=0 to 25 do
  begin
    for j:=0 to 63 do
    begin
        nfield[j,i]:=0;
    end;
  end;
end;

procedure aufbau;
begin
  { Die Prozedur besorgt den Aufbau. FÅr eine tote (bzw. nicht vorhandene)
    Zelle wird ein "." genommen, eine lebende Zelle wird als Stern dar-
    gestellt. Auûerdem wird die Generation, die berechnet wird, angezeigt. }
  for i:=1 to 25 do
  begin
    for j:=1 to 63 do
    begin
       textcolor(4);
       if field[j,i]<>1 then
       begin
     {     field[j,i]:='.';textcolor(7); }
       end;
       gotoxy(j,i);
       if field[j,i]=0 then
       begin
          textcolor(7);write('.');
       end
	   else
       begin
	      textcolor(red);write('*');
       end;
    end;
  end;
  textcolor(black);
  INC(G);
  cells[g]:=0;
  textcolor(cyan);gotoxy(75,7);writeln(' ',g-1,'   ');
end;

procedure statistik;
var hgen,hpop,ngen,npop:INTEGER;
begin
 { n=niedrig, h=hoch, gen=Generation, pop=Population
   Diese Prozedur wird nur aktiv, wenn man am Simulationsende
   die Frage "Statistik?" bejaht hat. Sie zeigt auf einem Blick,
   in welcher Generation wieviele Zellen lebten, wieviele Generationen
   simuliert wurden und welche die bevîlkerungsreichste/-Ñrmste
   Generation war. }
  clrscr;
  gotoxy(20,1);textcolor(white);writeln('Statistik');
  gotoxy(20,2);writeln('ÕÕÕÕÕÕÕÕÕ');
  gotoxy(15,3);textcolor(lightblue);writeln('Simulierte Generationen:',g);
  gotoxy(15,4);writeln('ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ');
  schnitt:=0;hpop:=0;npop:=32766;
  for j:=1 to g do
  begin
    case j of 1..10: gotoxy(10,5+j);
             11..20: gotoxy(30,5+j-10);
             21..30: gotoxy(50,5+j-20)
    end;
    textcolor(12);write('≥ ',j);textcolor(13);writeln('          ',cells[j]);
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

function nachbar(spalte,zeile:integer):integer;
var n:integer;
begin
   n:=0;
   n:=n+field[spalte+1,zeile];
   n:=n+field[spalte,zeile-1];
   n:=n+field[spalte-1,zeile];
   n:=n+field[spalte,zeile+1];
   { dec(n); }
   nachbar:=n;
end;

procedure feld_bearbeiten;
var zeile,spalte:integer;
begin
  for zeile:=0 to 25 do   {Spalten abarbeiten...}
  begin
     for spalte:=0 to 63 do {Zeilen abarbeiten...}
     begin
         case nachbar(spalte,zeile) of
         1,3: begin
                nfield[spalte,zeile]:=1;  { Die neue oder alte Zelle in das neue Feld Åbernehmen. }
                inc(cells[g]);     { Erhîhe die Anzahl der Zellen um 1}
              end;
         0,2,4: begin
                nfield[spalte,zeile]:=0;
              end;
         end;
     end;
  end;
end;

procedure tendenz;
begin
  { Diese Prozedur dient dazu, die Tendenz der Zellenentwicklung
    anzugeben. Sind z.B. mehr Zellen da, als in der Generation davor?
    Die Anzahl der Zellen wird auch ausgegeben. Ebenso wird
    berÅcksichtigt, ob die Kultur ausgestorben ist. }
  textcolor(white);
  gotoxy(75,5);writeln(cells[g-1]:3);gotoxy(65,8);
  taste:=readkey;
  if (cells[g-1]>cells[g]) and (g>1) then
  begin
    writeln('RÅckgÑngig.    ');
  end
  else begin
    if cells[g-1]=cells[g] then
       writeln('Gleichbleibend.')
    else writeln('Ansteigend.    ');
  end;
  if cells[g]=1 then { Ist nur eine Zelle da, kann auch keine Fortpflanzung stattfinden!}
  begin
     gotoxy(65,8);writeln('Ausgestorben.');
  end;
end;

procedure editor;
var spalte,zeile,x,y,quadrat:integer;
begin
  { Der Editor ist im Grunde einfach aufgebaut. Er lÑuft solange in
    einer Endlosschleife, bis Escape gedrÅckt wird. Mit den Zahlen
    bewegt man das "+"-Zeichen im Feld. Wird "*" gedrÅckt, wird eine
    Zelle gesetzt, bei "." wird sie gelîscht. }
  quadrat:=0;
  gotoxy(65,16);writeln('EDITOR');
  gotoxy(65,17);writeln('Bewegen mit den');
  gotoxy(65,18);writeln('Tasten:');
  gotoxy(64,19);writeln('<2><4><8><6>');
  gotoxy(64,20);writeln('<1><3><7><9>');
  gotoxy(64,21);writeln('<I> Invertieren');
  gotoxy(64,22);writeln('<*> Zelle setzen');
  gotoxy(64,23);writeln('<.> Zelle lîschen');
  spalte:=20;zeile:=5;
  repeat
    taste:=readkey;
    gotoxy(spalte,zeile);
    if field[spalte,zeile]=0 then
    begin
	  textcolor(7);
      write('.');
    end
	else
    begin
	  textcolor(red);
	  write('*');
	end;	
    case upcase(taste) of
    '2': begin
           inc(zeile);
           if zeile>25 then zeile:=25;
         end;
    '8': begin
           dec(zeile);
           if zeile<1 then zeile:=1;
         end;
    '4': begin
           dec(spalte);
           if spalte<1 then spalte:=1;
         end;
    '6': begin
           inc(spalte);
           if spalte>63 then spalte:=63;
         end;
    '9': begin
           if spalte<63 then inc(spalte);
           if zeile>1 then dec(zeile);
         end;
    '1': begin
           if spalte>1 then dec(spalte);
           if zeile<25 then inc(zeile);
         end;
    '7': begin
           if spalte>1 then dec(spalte);
           if zeile>1 then dec(zeile);
         end;
    '3': begin
           if spalte<63 then inc(spalte);
           if zeile<25 then inc(zeile);
         end;
    '*': field[spalte,zeile]:=1;
    '.': field[spalte,zeile]:=0;
	'I': begin
           for i:=0 to 25 do
           begin
             for j:=0 to 63 do
             begin
				gotoxy(j,i);
                if field[j,i]=0 then
                begin
                   field[j,i]:=1;write('*');
				end
                else
                   field[j,i]:=0;write('.');
	         end;
           end;
		 end;
     'Q':begin
           if quadrat=1 then
		   begin
              for i:=x to spalte do
			  begin
                 field[i,zeile]:=1;
                 field[i,y]:=1;
              end;
              for i:=y to zeile do
              begin
                 field[spalte,i]:=1;
                 field[x,i]:=1;
              end;
              quadrat:=0;
              aufbau;dec(g);
           end
		   else
           begin
              x:=spalte;y:=zeile;quadrat:=1;
           end;
         end;
    end;
    textcolor(cyan);gotoxy(spalte,zeile);write('+');  
  until ord(taste)=27;
  for i:=16 to 23 do
  begin
      gotoxy(64,i);write('                 ');
  end;
  dec(g);
end;

{ Hier beginnt das Hauptprogramm }

begin
  clrscr;g:=1;textcolor(white);
  assign(f,'lifetitl.dat');
  reset(f);
  for i:=1 to 20 do
  begin
     readln(f,a);writeln(a);
  end;
  writeln('<E> fÅr den Editor, <RETURN> um zu starten.');
  taste:=readkey;
  { Das gesamte Spielfeld wird jetzt erstmal leer gemacht, da ich
    nicht von ausgehen kann, daû mir TPascal diese Arbeit abnimmt }
  clrscr;
  i:=1;
  while not eof(f) do
  begin
    readln(f,a);gotoxy(64,i);writeln(a);
    inc(i);
  end;
  for i:=0 to 25 do
  begin
    for j:=0 to 63 do
    begin
       field[j,i]:=0;nfield[j,i]:=0;
    end;
  end;
  
  if upcase(taste)='E' then
  begin 
    aufbau;
    editor;
  end
  else
  begin
    field[40,12]:=1;field[40,13]:=1;field[39,13]:=1; field[40,14]:=1;
    field[41,13]:=1;
  end;

  cells[g]:=0;
  for i:=0 to 25 do
  begin
    for j:=0 to 63 do
    begin
        if field[j,i]=1 then inc(cells[g]);
    end;
  end;
  gotoxy(75,5);write(cells[1]);
1:
  loesche_felder;
  aufbau;      {Aufbau der nÑchsten Generation}
  feld_bearbeiten;
  tendenz;
  { So, das neue Feld ist berechnet. Jetzt muû es nur noch dargestellt
    werden. DafÅr wird jetzt die nicht mehr benîtigte alte Generation
    Åberschrieben. }
  for j:=0 to 70 do
  begin
    for i:=0 to 25 do
    begin
       field[j,i]:=nfield[j,i];
    end;
  end;
  if upcase(taste)='E' then
  begin	
     editor;
     goto 1;
  end;
  if (g<13) and (taste<>chr(27)) and (cells[g]<>0) then goto 1;
  dec(g);
  gotoxy(10,24);writeln('Simulation beendet. Statistik? (J/N)');
  taste:=readkey;
  if upcase(taste)='J' then statistik;
end.
