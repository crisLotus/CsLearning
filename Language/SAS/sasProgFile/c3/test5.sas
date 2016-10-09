data class3;
input sex$ chinese maths english @@;
if sex='m' then delete;
cards;
m 82 78 69 f 90 78 89 m 79 86 98
;
proc print;
run;
