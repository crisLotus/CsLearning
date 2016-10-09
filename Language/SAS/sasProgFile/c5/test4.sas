data a;
input name$ sex$ @@;
cards;
rose f david m john m mayers f
;
data b;
input name$ computer physical maths english @@;
cards;
rose 89 65 76 87 david 78 86 78 98 john 90 65 76 87 mayers 89 67 78 80
;

data c;
input sex$ total ave@@;
cards;
f 317 79.25 m 340 85 m 318 79.5 f 314 78.5
;

/* 不同变量顺序链接 */
/*data a b c;*/
/*set a b c;*/
/*run;*/
/*proc print;*/
/*run;*/


/* 按某一共同变量排序连接 */
/*data A;*/
/*set a;run;*/
/*proc sort;by sex;run;*/
/*data c;*/
/*set c;run;*/
/*proc sort;by sex;run;*/
/*data ac;*/
/*set a c;by sex;*/
/*run;*/
/*proc print;run;*/

