program zeit;
uses crt, dos;
var h, min, s, hs,
       sh, smin, ssek,diff: word;
begin
  clrscr;
  gettime(sh,smin,ssek,hs);
  settime(0,0,0,1);
  writeln(ssek);
  s:=0;
  hs:=0;
  repeat
    gettime(h,min,s,hs);
    gotoxy(35,10);
    if s>9 then
      write(s,' s ',hs,'  ')
    else
      write('0',s,' s ',hs,'  ');
  until (s=59) and (hs>70);
  readln;
end.
