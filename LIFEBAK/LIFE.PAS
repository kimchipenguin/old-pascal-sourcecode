PROGRAM game_of_life;
USES crt;
VAR g,i,j,nachbar,max_zeilen:INTEGER;
    field:ARRAY [0..70,0..30] OF CHAR;
    nfield:ARRAY [0..70,0..30] of CHAR;
    cells:ARRAY [1..100] OF INTEGER;
    taste:CHAR;
    schnitt:REAL;
    n:BOOLEAN;
    F:TEXT;a,text:string;
LABEL 1;
   { FIELD ist das aktuelle Tummelfeld der Lebensformen, die
     nÑchste Generation wird in NFIELD abgelegt.
     CELLS enhÑlt die Anzahl der Zellen pro Generation.
     n wird verwendet, um festzustellen, ob die Anzahl der Nachbarn
     gerade oder ungerade ist (mittel ODD). Deshalb muû auch der Daten-
     typ BOOLEAN verwendet werden. }
procedure loesche_felder;
begin
  for i:=0 to 25 do
  begin
    for j:=0 to 63 do
    begin
        nfield[j,i]:='.';
    end;
  end;
end;

procedure aufbau;
begin
  for i:=1 to 25 do
  begin
    for j:=1 to 63 do
    begin
       textcolor(4);
       if field[j,i]<>'*' then
       begin
          field[j,i]:='.';textcolor(7);
       end;
       gotoxy(j,i);write(field[j,i]);
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
 { n=niedrig, h=hoch, gen=Generation, pop=Population }
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
procedure feld_bearbeiten;
begin
  for j:=1 to 63 do   {Spalten abarbeiten...}
  begin
     for i:=1 to 25 do {Zeilen abarbeiten...}
     begin
       nachbar:=0;
       if (field[j-1,i]='*') or (field[j+1,i]='*') then inc(nachbar);
       if (field[j,i-1]='*') or (field[j,i+1]='*') then inc(nachbar);
       if (nachbar>=0) and (nachbar<=4) then
       begin
          n:=ODD(nachbar);
          if n=TRUE then  { Anzahl der Nachbarn ungerade? }
          begin
             nfield[j,i]:='*';  { Die neue oder alte Zelle in das neue Feld Åbernehmen. }
             inc(cells[g]);     { Erhîhe die Anzahl der Zellen um 1}
          end
          else                  { Ansonsten... }
             nfield[j,i]:='.';  { ...stirbt die Zelle oder bleibt tot }
       end;
     end;
  end;
end;
procedure tendenz;
begin
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
  if cells[g]=0 then        { Sind alle Zellen tot? }
  begin
     gotoxy(65,16);writeln('Ausgestorben.');
     gotoxy(68,17);writeln('Schnief!');
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
    if field[spalte,zeile]='.' then
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
    '*': field[spalte,zeile]:='*';
    '.': field[spalte,zeile]:='.';
    'I': begin
           for i:=0 to 25 do
           begin
             for j:=0 to 63 do
             begin
	        gotoxy(j,i);
                if field[j,i]='.' then
                begin
                   field[j,i]:='*';write('*');
		end
                else
                   field[j,i]:='.';write('.');
	        end;
             end;
	   end;
     'Q':begin
           if quadrat=1 then
	   begin
              for i:=x to spalte do
	      begin
                 field[i,zeile]:='*';
                 field[i,y]:='*';
              end;
              for i:=y to zeile do
              begin
                 field[spalte,i]:='*';
                 field[x,i]:='*';
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


begin
  clrscr;cells[1]:=5;g:=1;max_zeilen:=25;textcolor(white);
  assign(f,'lifetitl.dat');
  reset(f);
  for i:=1 to 20 do
  begin
     readln(f,a);writeln(a);
  end;
  taste:=readkey;
  i:=1;
  { Das rechte Anzeigefeld wird geladen. }
  clrscr;
  for i:=21 to 40 do
  begin
    readln(f,text);gotoxy(64,i-20);write(text);
  end;
  close(f);
  for i:=0 to 25 do
  begin
    for j:=0 to 63 do
    begin
        field[j,i]:='.';nfield[j,i]:='.';
    end;
  end;
  if upcase(taste)='E' then
  begin
     aufbau;
     editor;
     goto 1;
  end
  else
  begin
    field[40,12]:='*';field[40,13]:='*';field[39,13]:='*';
    field[40,14]:='*';field[41,13]:='*';
  end;
1:
  loesche_felder;
  aufbau;      {Aufbau der nÑchsten Generation}
  feld_bearbeiten;
  tendenz;
  { So, das neue Feld ist berechnet. Jetzt muû es nur noch dargestellt
    werden. DafÅr wird jetzt die nicht mehr benîtigte alte Generation
    Åberschrieben. }
  for j:=1 to 65 do
  begin
    for i:=1 to 24 do field[j,i]:=nfield[j,i];
  end;
  if upcase(taste)='E' then
  begin	
     editor;
     goto 1;
  end;

  if (g<21) and (taste<>chr(27)) then goto 1;
  dec(g);
  gotoxy(10,24);writeln('Simulation beendet. Statistik? (J/N)');
  taste:=readkey;
  if upcase(taste)='J' then statistik;
end.
