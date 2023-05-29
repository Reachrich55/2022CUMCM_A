clc,clear
w=1.4005;
T=2*pi/w;

[t,x]=ode45(@func2 , [0:0.01:280] , [0 0 0.2019575 0]);

x1=x(21:20:4000*T,1);
x2=x(21:20:4000*T,2);
x3=x(21:20:4000*T,3);
x4=x(21:20:4000*T,4);
table=[x1,x2,x3,x4]
%%

plot(t,x(:,1),'r')
xlabel('t / s')
ylabel('x / m')
legend('浮子位移')
%%

plot(t,x(:,2),'r')
xlabel('t / s')
ylabel('v / (m/s)')
legend('浮子速度')
%%

plot(t,x(:,3),'r')
xlabel('t / s')
ylabel('x / m')
legend('振子位移')
%%

plot(t,x(:,4),'r')
xlabel('t / s')
ylabel('v / (m/s)')
legend('振子速度')