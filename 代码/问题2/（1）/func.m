
function dy = func(t,x)

load coe.mat dy11 dz11 y11 z11 cos_t11 C11 dy12 dz12 y12 z12 C12
dy=zeros(4,1);
dy(1)=x(2);
dy(2)=dy11*x(2)+dz11*x(4)+y11*x(1)+z11*x(3)+cos_t11*cos(2.2143*t)+C11;
dy(3)=x(4);
dy(4)=dy12*x(2)+dz12*x(4)+y12*x(1)+z12*x(3)+C12;
% dy(1)=x(2);
% dy(2)=-1.6125*(x(2)-x(4))*sqrt(abs(x(2)-x(4)))-0.1058*x(2)-17.9887*x(1)+12.9*x(3)+1.0078*cos(1.4005*t)-2.6053;
% dy(3)=x(4);
% dy(4)=4.1102*(x(2)-x(4))*sqrt(abs(x(2)-x(4)))+32.8812*x(1)-32.8812*x(3)+6.6406;
end