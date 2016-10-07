program record_lesen;
uses crt;
type adresse = record
               name:    string[20];
               vorname: string[20];
               plz:     longint;
               ort:     string[20];
               strasse: string[40];
               end;
var adr: adresse; i:integer; datei: file of adresse;
begin
  clrscr;
  writeln('Adressen aus der Datei NAMEN.DAT');
  assign(datei,'a:\namen.dat'); reset(datei);
  while not eof(datei) do
  begin
    read(datei,adr);
    writeln(adr.name,' ',adr.vorname);
    writeln(adr.strasse);
    writeln(adr.plz,' ',adr.ort);
    readln;
  end;
  close(datei);
  readln;
end.
