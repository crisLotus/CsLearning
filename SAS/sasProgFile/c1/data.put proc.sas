options nodate;
data talent2;
input name$ sex$ math chinese;
total=math+chinese;
put _all_;
cards;
a m 10 20
b f 20 1
c m 22 5
run;

proc sort data=talent2;
by total;
proc print label noobs;
	title "aaaaaa";
run;
