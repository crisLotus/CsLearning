data libzhf.class;
input chinese maths english @@;
total = chinese+maths+english;
if total>=240 then n+1;else delete;
cards;
82 78 69 90 78 89 79 86 98 76 56 80 72 76 81 69 78 91 92 71 85
;
