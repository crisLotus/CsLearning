data class;
input sex$ chinese maths english @@;
cards;
m 82 . 69 f 90 0 89 m 79 86 98
; 
data class1;
set class;
where maths;
run;
proc print;
run;
