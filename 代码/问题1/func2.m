function dy = func2(t,x)
dy=zeros(4,1);
% dy(1)=x(2);
% dy(2)=-1.7183*x(2)+1.6125*x(4)-17.9887*x(1)+12.9*x(3)+1.0078*cos(1.4005*t)-2.6053;
% dy(3)=x(4);
% dy(4)=4.1102*x(2)-4.1102*x(4)+32.8812*x(1)-32.8812*x(3)+6.6406;
dy(1)=x(2);
dy(2)=-1.6125*(x(2)-x(4))*sqrt(abs(x(2)-x(4)))-0.1058*x(2)-17.9887*x(1)+12.9*x(3)+1.0078*cos(1.4005*t)-2.6053;
dy(3)=x(4);
dy(4)=4.1102*(x(2)-x(4))*sqrt(abs(x(2)-x(4)))+32.8812*x(1)-32.8812*x(3)+6.6406;
end