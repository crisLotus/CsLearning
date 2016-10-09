data test;
input name$1-5 a 6-7 b 8;
cards;
abcd123456789
;
proc print;
run;
