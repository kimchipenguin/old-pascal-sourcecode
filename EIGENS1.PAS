program eigenschaften;
uses crt;
var name: string;
    adj: array[1..12] of string;

procedure anfang;
begin
  clrscr;
  adj[1]:='humorlos';adj[2]:='saubl”d';
  adj[3]:='sexy'; adj[4]:='langweilig';
  adj[5]:='tomatig'; adj[6]:='hirnrissig';
  adj[7]:='genial'; adj[8]:='mde';
  adj[9]:='groá'; adj[10]:='klein';
  adj[11]:='genial'; adj[12]:='vor dem Computer';
  write('Vor- und Zuname? ');readln(name);
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
  writeln(name,' ist ',adj[1+random(12)],'.');
  ende;
end.
