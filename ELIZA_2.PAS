program eliza_2;
uses crt;
var s: array [1..7] of string;
    n: array [1..4] of string;
    a: string;
    i,zahl: integer;
label schleife;
PROCEDURE no_answer;
begin
  n[1]:='I CAN ONLY UNDERSTAND YOU IF YOU GIVE ME THE CHANCE TO.';
  n[2]:='I HAVE TIME.';n[3]:='DO NOT BE AFRAID OF TELLING ME YOUR PROBLEMS.';
  n[4]:='HAVE THE COURAGE OF TELLING ME WHAT YOU THINK!';
  s[1]:='SAY, DO YOU HAVE ANY PSYCHOLOGICAL PROBLEMS?';
  s[2]:='WHAT DOES THAT SUGGEST TO YOU?';s[3]:='I SEE.';
  s[4]:='I AM NOT SURE I UNDERSTAND YOU FULLY.';
  s[5]:='COME COME ELUDICATE YOUR THOUGHTS.';
  s[6]:='CAN YOU ELABORATE ON THAT?';
  s[7]:='THAT IS QUITE INTERESTING.';
end;

begin
  clrscr;
  no_answer;
  writeln('ELIZA PASCAL-Version');
  writeln('HI I AM ELIZA. WHAT IS YOUR PROBLEM?');
  writeln;
  write(':');readln(a);
  writeln;
  schleife:
  i:=0;
  repeat
    i:=i+1;
    if a<>'' then writeln(s[i]);
    write(':');readln(a);
    IF (a='quit') OR (a='q') then
    begin
      writeln('Thank you for talking with me. I hope I helped you');
      writeln('a little bit.');
      repeat until keypressed;
      exit;
    end;
    IF a='' then
    begin
      zahl:=RANDOM(4)+1;
      writeln(n[zahl]);
      writeln;
      i:=i-1;
    END;
    zahl:=RANDOM(10)+1;
    IF zahl=10 then i:=RANDOM(4)+2;
  until i=7;
  GOTO schleife
END.
