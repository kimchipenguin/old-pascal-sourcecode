program namgross;
uses crt;
type daten=record
           name   :string[20];
           groesse:integer;
           end;
var i,g:integer;s:string;datei:file of daten;

begin
  clrscr;
  writeln('Name/Gr”áe-Datei');
  writeln('Wenn du beim Namen nichts eingibst, wird das Programm beendet.');
  writeln;
  assign(datei,'a:\namgross.dat');
  rewrite(datei);
  i:=0;
  repeat
     gotoxy(5,wherex);
     write('Name  :');
     readln(name);
     gotoxy(40,wherex-1);write('Gr”áe  :');readln(G);
     if s<>'' then
     begin
       seek(datei,i);


         {daten.name:=s;
         daten.groesse=g;  }
         writeln(datei,s);
         writeln(datei,daten.groesse);
         inc(i);

     end;
  until s='';
  close(datei);

end.
