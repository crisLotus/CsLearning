data test1;
input Name$ Sex$ Age Height Weight;
cards;
Alice F 13 56.5 84
Becka M 13 65.3 98
;
data test2;
input Name$ Sex$ Age Height Weight @@;
cards;
Alice F 13 56.6 84 Becha M 13 65.3 988
;
data test3;
input Nmae$ Sex$ Agew Height Weight;
cards;
∞¢¿ÔÀπ F 13 56.5 84

;
proc print data=test3;
run;
