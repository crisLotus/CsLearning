/* 产生参数为5的随机数50个 */
data a(drop=i j z);
do i=1 to 50 by 1; y=0;
	do j=1 to 5;
	z = normal(0); y = y+z*z;
	end;
output;
end;
proc print noobs;
run;
