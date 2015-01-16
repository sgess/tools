function out = fun2min(x,t,p)

g = x(1)*exp(-(p-x(2)).^2./(2*((1+x(3)*sign(p-x(2)))*x(4)).^2))+x(5);

d = t - g;

out = sum(d.^2);