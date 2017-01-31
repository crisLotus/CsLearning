clc;
clear;
syms s t p q C R P a b;
a = 0.01;
b = 0.004;  %19
c = 0.003;  %21
p = 339 - a*s - c*t;
q = 399 - b*s - a*t;
R = p*s+q*t;
C = 400000 + 195*s + 225*t;
P = R-C;
%diff(P,s)
%diff(P,t)
%S=solve(diff(P,s),diff(P,t))
%Ss = S.s
%St = S.t


x=1:0.1:10;
y=2.*(x.*x+x)+10;
plot(y)