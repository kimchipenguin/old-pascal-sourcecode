program brutto2;
uses crt;
var netto,brutto,mwst:real;
begin
clrscr;
  gotoxy(25,2);
  writeln('Netto/Brutto-Rechnung');
  gotoxy(25,3);
  writeln('---------------------');
  gotoxy(34,6);
  writeln('Betrag:');
  gotoxy(42,6);
  readln(netto);
  gotoxy(41,6);writeln(netto:7:2,' DM.');
  brutto:=netto*1.15;
  gotoxy(13,8);
  writeln('Betrag inkl. Mehrwertsteuer:',brutto:7:2,' DM.');
  mwst:=brutto-netto;
  gotoxy(26,10);writeln('Mehrwertsteuer:',mwst:7:2,' DM.');
  gotoxy(10,12);writeln('Fertig! DrÅcke <Enter> !');
  readln;
end.
