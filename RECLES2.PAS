program record_lesen;
uses crt;
type adresse = record
               name:    string[20];
               vorname: string[20];
               plz:     longint;
               ort:     string[20];
               strasse: string[40];
               end;
var adr: adresse; i,k:integer; datei: file of adresse;
begin
  assign(datei,'a:\namen.dat'); reset(datei);
  k:=filesize(datei);
  repeat
    clrscr;
    writeln('Adressen aus der Datei NAMEN.DAT');
    write('WelcherDatensatz von den ',k,' Datens„tzen soll gelesen werden? ');
    readln(i);
  until (i>=0) and (i<=k-1);
  seek(datei,i);
  read(datei,adr);
  with adr do
  begin
    writeln(adr.name,' ',adr.vorname);
    writeln(adr.strasse);
    writeln(adr.plz,' ',adr.ort);
  end;
  close(datei);
  readln;
end.
