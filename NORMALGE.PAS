program normalgewicht;
uses crt;
var gewicht,groesse,normalg,idealg,faktor:real;
    sex:string[1];
begin
   clrscr;
   gotoxy (15,1);writeln('Das Programm bestimmt ihr Normalgewicht und vergleicht');
   gotoxy (25,2);writeln('es mit ihrem tats„chlichen Gewicht');
   writeln;
   gotoxy(20,4);write('Gewicht (in kg): ');readln(gewicht);
   gotoxy(20,6);write('Gr”áe   (in cm): ');readln(groesse);
   if (groesse>270) or (groesse<5) or (gewicht<2) or (gewicht>450) then
   begin
      gotoxy(20,8);writeln('Haha, sehr witzig!');
   end;
   gotoxy(17,10);write('Sind sie eine Frau oder ein Mann? (F/M)?');readln(sex);
   normalg:=groesse-100;
   faktor:=0.15;
   if sex='M' then faktor:=0.1;
   idealg:=normalg-faktor*normalg;
   gotoxy(17,13);write('Sie haben ');
   if gewicht>normalg then writeln(gewicht-normalg:5:1,' kg šbergewicht.');
   if gewicht<normalg then writeln(normalg-gewicht:5:1,' kg Untergewicht.');
   if gewicht=normalg then writeln('(noch!) Normalgewicht.');
   gotoxy(17,15);
   if (gewicht<>normalg) and (normalg>0) then writeln('Normalgewicht :',normalg:5:1,' kg.');
   gotoxy(17,17);writeln('Ihr Idealgewicht: ',idealg:5:1);
   readln;
end.
