data class1 class2;
input name$ chinese maths english @@;
total=chinese+maths+english;
if total>=240 then output class1;
else output class2;
cards;
a 82 78 69 b 90 78 89 c 79 86 98
;
proc print data=class1;
title 'class1';
proc print data=class2;
title 'class2';
run;
