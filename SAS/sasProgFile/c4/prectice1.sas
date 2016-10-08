data test(keep= x);
x=500;
do i=1 to 3 by 1;
	x+x*0.07;
end;
output;
proc print;
run;
