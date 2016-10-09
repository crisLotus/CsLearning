data a(drop=i);
do i=1 to 10 by 2;
z=170+sqrt(30)*normal(0);
output;
end;
proc print;
run;
