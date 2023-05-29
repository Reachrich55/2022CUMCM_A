function y = func_plus_plus(p,xdata)
w=1.9806;

t=xdata(:,1);

A=p(1);
b=p(2);
y=A.*sin(w.*t+b);
end