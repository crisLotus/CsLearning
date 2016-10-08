data course.test;
input variety$ flavor texture looks;
total= flavor+texture+looks;
cards;
navel 9 8 6
temple 7 7 7
valencia 8 9 9
mandarin 5 7 8
;
proc sort data=test;
by descending total;
run;
proc print data=oranges;
title '橘子品尝结果';
run;
