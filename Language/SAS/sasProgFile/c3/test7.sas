data test(keep= n);
input sex$ chinese math english @@;
mean = mean(chinese, math, english);
if mean >= 75 and sex='m' then n+1;else delete;
output;
cards;
m 82 78 69 f 90 78 89 m 79 86 98 m 76 56 80
f 72 76 81 f 69 78 91 m 92 71 85
;

proc print;
run;
