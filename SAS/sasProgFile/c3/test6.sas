data normal(keep= x);
do i=1 to 100 by 1;
		x=normal(0)**2 + normal(0)**2 +normal(0)**2 + normal(0)**2+ normal(0)**2 +normal(0)**2 + normal(0)**2+ normal(0)**2 +normal(0)**2 + normal(0)**2;
output;
end;
proc print;
run;
