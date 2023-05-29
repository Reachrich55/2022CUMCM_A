
function dy = func(t,x)

load coe.mat absx1 dy21 y21 z21 cos_t21 C21 absx2 y22 z22 C22 n
dy=zeros(4,1);
% dy(1)=x(2);
% dy(2)=dy11*x(2)+dz11*x(4)+y11*x(1)+z11*x(3)+cos_t11*cos(2.2143*t)+C11;
% dy(3)=x(4);
% dy(4)=dy12*x(2)+dz12*x(4)+y12*x(1)+z12*x(3)+C12;
dy(1)=x(2);
dy(2)=absx1*(x(2)-x(4))*(abs(x(2)-x(4)))^(n)+dy21*x(2)+y21*x(1)+z21*x(3)+cos_t21*cos(2.2143*t)-C21;
dy(3)=x(4);
dy(4)=absx2*(x(2)-x(4))*(abs(x(2)-x(4)))^(n)+y22*x(1)+z22*x(3)+C22;
end