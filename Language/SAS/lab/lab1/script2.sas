data libzhf.trans1;
	set libzhf.class1;
run;
proc transpose out=libzhf.trans2;
	id name;
proc print;
run;
