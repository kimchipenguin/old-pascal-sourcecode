program iterativ;
uses crt;
var g: integer;

function fibo(n:integer):longint;
var i:integer; fib: array[1..50] of longint;
begin
  fib[1]:=1; fib[2]:=1;
  for i:=3 to n do fib[i]:=fib[i-1]+fib[i-2];
  fibo:=fib[n]
end;

begin
  clrscr;
  repeat
    write('Bis zu welcher Zahl soll ich rechnen?');readln(g);
    writeln(fibo(g));
  until g=0;
  readln;
end.

