data sales;
input region$ citisize$ pop$ product$ saletype$ quantity price@@;
cards;
es	s	25000	a100	r	150	3750	ne	s	37000	a100	r	200	5000
so	s	48000	a100	r	410	10250	we	s	32000	a100	r	180	4500
es	m	125000	a100	r	350	8750	ne	m	237000	a100	r	600	15000
so	m	348000	a100	r	710	17750	we	m	432000	a100	r	780	19500
es	l	62500	a100	r	750	18750	ne	l	837000	a100	r	800	20000
so	l	748000	a100	r	760	19000	we	l	93200	a100	r	880	22000
es	s	25000	a100	w	150	3000	ne	s	37000	a100	w	200	4000
so	s	48000	a100	w	410	8200	we	s	32000	a100	w	180	3600
es	m	125000	a100	w	350	7000	ne	m	237000	a100	w	600	12000
so	m	348000	a100	w	710	14200	we	m	432000	a100	w	780	15600
es	l	62500	a100	w	750	15000	ne	l	837000	a100	w	800	16000
so	l	748000	a100	w	760	15200	we	l	932000	a100	w	880	17600
es	s	25000	a200	r	165	4125	ne	s	37000	a200	r	215	5375
so	s	48000	a200	r	425	10425	we	s	32000	a200	r	195	4875
es	m	125000	a200	r	365	9125	ne	m	237000	a200	r	615	15375
;run;

/* 1 */
data reg(keep=region) typ(keep=product) qua(keep=quantity);
set sales;
run;
data val(keep=val);
set sales;
val = quantity * price;
run;
data ana1;
set reg typ qua val;
run;

/* 2 */
data p1 p2;
set sales;
if product='a100' then output p1;
if product='a200' then output p2;
run;

data ana2;
merge p1 p2;
run;

/* 3 */
data ana3(keep= product region);
set sales;
array SA{2} product region;
run;
