data normal(keep= x);
	
do i=1 to 100 by 1;x=0;
	do j=1 to 10 by 1;
		z = normal(0)**2;
		x = x + z * z;
	end;
	output;
end;
proc print;
run;
