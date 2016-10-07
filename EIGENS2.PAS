program eigenschaften;
uses crt;
var adj: array[1..12] of string;
    name: array[1..13] of string;
    i:integer;
procedure anfang;
begin
  clrscr;
  adj[1]:='humorlos';adj[2]:='saubl”d';
  adj[3]:='sexy'; adj[4]:='langweilig';
  adj[5]:='tomatig'; adj[6]:='hirnrissig';
  adj[7]:='genial'; adj[8]:='mde';
  adj[9]:='groá'; adj[10]:='klein';
  adj[11]:='genial'; adj[12]:='vor dem Computer';
  name[1]:='Benjamin'; name[2]:='Matthias H.';
  name[3]:='Alexander'; name[4]:='Henrick';
  name[5]:='Matthias J';name[6]:='Yukari';
  name[7]:='Konrad';name[8]:='Femke';
  name[9]:='Sebastian'; name[10]:='Michael';
  name[11]:='Andre';name[12]:='Jan';
  name[13]:='Gerhard';
end;

procedure ende;
begin
  gotoxy(1,25);
  write('Beliebige Taste drcken');
  repeat until keypressed;
end;
{ *****************
  * Hauptprogramm *
  ***************** }
begin
  randomize;
  anfang;
  for i:=1 to 13 do writeln(name[i],' ist ',adj[1+random(12)],'.');
  ende;
end.
