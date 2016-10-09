data new;
input name$ score1 score2@@;
cards;
zhangsan 80 99 lisi 89 98
wangwu 87 79 liuliu 67 75
;
proc print;
proc transpose;
	id name;
proc print;
run;
