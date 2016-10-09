data h;
input x$ a b@@;
cards;
zhangsan 1 2.2
lisi 2 4.3
wangwu 2 4.565
liuliu 1 2.456
;
proc sort;
	by a;
proc print noobs round;
	id x;
	by a;
	sum b;
	sumby a;
run;
