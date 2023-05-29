clc,clear
w=1.4005;
T=2*pi/w;

[t,x]=ode45(@func1 , [0:0.01:280] , [0 0 0.2019575 0]);

x1=x(21:20:4000*T,1);
x2=x(21:20:4000*T,2);
x3=x(21:20:4000*T,3);
x4=x(21:20:4000*T,4);
table=[x1,x2,x3,x4]
%%

plot(t,x(:,1),'r')
xlabel('时间t / s')
ylabel('浮子位移x / m')

%%

plot(t,x(:,2),'r')
xlabel('时间t / s')
ylabel('浮子速度v / (m/s)')

%%

plot(t,x(:,3),'r')
xlabel('时间t / s')
ylabel('振子位移x / m')

%%

plot(t,x(:,4),'r')
xlabel('时间t / s')
ylabel('振子速度v / (m/s)')
