function z = func_plus_plus(p,xdata)


x=xdata(:,1);

a=p(1);
b=p(2);
c=p(3);
d=p(4);
e=p(5);
f=p(6);
z=a.*x.^5+b.*x.^4+c.*x.^3+d.*x.^2+e.*x+f;
end