data a;
input name$ sex$@@;
cards;
beijing m rose f david m john m mayers f mayers m 
;
proc sort;by name;run;

data b;
input name$ computer physical maths english @@;
cards;
rose 89 65 76 87 david 78 86 78 98
david 87 69 77 90 john 90 65 76 87
mayers 89 67 78 80 star 66 81 75 94
;proc sort;by name; run;
 data ab;
 merge a b; by name; run;
 proc print;
 run;
