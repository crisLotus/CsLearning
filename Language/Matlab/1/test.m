clear;
clc;
A = [ 
    1 2 3 4
    2 3 4 5
    3 4 5 6
    4 5 6 7
];
%A(:, 2) = [] %É¾³ýµÚ¶þÁÐ
%A' * A;
%A' .* A;
D = [
       72          134          3.2
       81          201          3.5
       69          156          7.1
       82          148          2.4
       75          170          1.2
];
mu = mean(D), sigma = std(D);
rho = (1+sqrt(5))/2
rho = 1.6180

a = abs(3+4i)
a =5

z = sqrt(besselk(4/3,rho-i))
z =0.3730+ 0.3214i

huge = exp(log(realmax))
huge =1.7977e+308

toobig = pi*huge
toobig =Inf


