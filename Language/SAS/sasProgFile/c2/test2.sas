data test;
	set data;
run;
proc sort out=test1;
by _ descending VAR2;
run;
proc print data=test1;
title "paixu";
run;
