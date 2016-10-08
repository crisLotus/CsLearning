data libzhf.Sort1;
	set class1;
run;
proc sort out=libzhf.sort2;
	by descending AGE height;
run;
proc print data=libzhf.sort2;
run;
