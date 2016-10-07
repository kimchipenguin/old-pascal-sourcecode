program zeit;
uses crt, dos;
var h, min, s, hs:word;
begin
  clrscr;
  repeat
    gettime(h,min,s,hs);
    gotoxy(35,10);
    write(h,' h ',min,' min  ',s,',',hs,' s');
  until keypressed;
end.
