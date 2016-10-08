data test;
input name=$ age=;
cards;
name=aaaa age=3265
age=3265 name=aaaa
;
proc print;
run;
