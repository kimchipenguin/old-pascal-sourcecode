program telefon1;
uses crt;
var name:string[30];
    zeitraum1:string[20];
    einheiten,zusatzeinrmeng:real;
    zusatzbetr,zusatzeinrges,freieeinheiten,gesamtfeinheiten:real;
    tanschluss,telefon,einzelbetr:real;
    tanschlussbetr,einheitenbetr,summe:real;
begin
  telefon:=24.6;
  freieeinheiten:=10;
  zusatzbetr:=2.9;
  einzelbetr:=0.23;
  clrscr;
  gotoxy(40,1);writeln('Menge   Einzelbetrag   Gesamt');
  writeln('Telefonanschlu·');
  writeln('Tarifeinheiten');
  writeln('Freie Tarifeinheiten');
  writeln('Zusatzeinrichtungen');
  writeln;
  writeln('Frau/Herr');
  readln(name);
  write('FÅr den Zeitraum ');read(zeitraum1);
  (* Telefonanschlu· *)
  gotoxy(43,2);read(tanschluss);
  gotoxy(42,2);writeln(tanschluss:3:0);;
  tanschlussbetr:=tanschluss*telefon;
  gotoxy(49,2);writeln(tanschlussbetr:6:2);
  gotoxy(65,2);writeln(tanschlussbetr:6:2);
  (* Tarifeinheiten *)
  gotoxy(42,3);readln(einheiten);
  gotoxy(42,3);writeln(einheiten:3:0);
  gotoxy(49,3);writeln(einzelbetr:6:2);
  einheitenbetr:=einheiten*0.23;
  gotoxy(65,3);writeln(einheitenbetr:6:2);
  (* Freie Tarifeinheiten *)
  gotoxy(42,4);writeln(freieeinheiten:3:0);
  gotoxy(49,4);writeln(einzelbetr:6:2);
  gesamtfeinheiten:=freieeinheiten*einzelbetr*-1;
  gotoxy(65,4);writeln(gesamtfeinheiten:6:2);
  (* Zusatzeinrichtungen *)
  gotoxy(49,5);writeln(zusatzbetr:6:2);
  gotoxy(42,5);readln(zusatzeinrmeng);
  gotoxy(42,5);writeln(zusatzeinrmeng:3:0);
  zusatzeinrges:=zusatzbetr*zusatzeinrmeng;
  gotoxy(65,5);writeln(zusatzeinrges:6:2);
  (* Gesamt *)
  gotoxy(50,6);writeln('Summe:');
  summe:=zusatzeinrges+einheitenbetr+tanschlussbetr+gesamtfeinheiten;
  gotoxy(65,6);writeln(summe:6:2);
  gotoxy(40,9);writeln('sind',summe:6:2,' DM zu zahlen.');
  readln;
end.
