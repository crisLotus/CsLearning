data class;
input sex$ chinese maths english @@;
total=chinese+maths+english;

if chinese>89;
if maths>75;

cards;
m 82 78 69 f 90 78 89 m 79 86 98 m 76 56 80
f 72 76 81 f 69 78 91 m 92 71 85
;
proc print;
run;
