data sample2;
input x y z @@;
cards;
1 1 1 1 2 3 4 7 8 9 5 4 3 4 2 4
5 5 6 6 7 1 4 3 5 6 2
;
proc sort;
	by x;
run;
proc print;
	by x;
	pageby x;
run;
