program brutto1;
uses crt;
var netto,brutto,mwst:real;
begin
clrscr;
  writeln('Netto/Brutto-Rechnung');
  writeln('---------------------');
  writeln('Betrag:');
  readln(netto);
  brutto:=netto*1.15;
  writeln('Betrag inkl. Mehrwertsteuer:',brutto:7:2);
  mwst:=brutto-netto;
  writeln('Mehrwertsteuer:',mwst:7:2);
  readln;
end.
