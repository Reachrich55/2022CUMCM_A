function y = func_plus(p,xdata)
w=2.2143;

t=xdata(:,1);

A=p(1);
b=p(2);
y=A.*sin(w.*t+b);
end