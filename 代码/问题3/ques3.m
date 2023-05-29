clc,clear
w=1.7152;
T=2*pi/w;
cal_coe();
[t,x]=ode45(@func , [0:0.01:255] , [0 0 0 0 0.4519575 0 0 0]);
x1=x(21:20:4000*T,1);
x2=x(21:20:4000*T,2);
x3=x(21:20:4000*T,3);
x4=x(21:20:4000*T,4);
x5=x(21:20:4000*T,5);
x6=x(21:20:4000*T,6);
x7=x(21:20:4000*T,7);
x8=x(21:20:4000*T,8);
table=[x1,x2,x3,x4,x5,x6,x7,x8]
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
ylabel('θ / rad')
legend('浮子角位移')
%%
plot(t,x(:,4),'r')
xlabel('t / s')
ylabel('ω / (rad/s)')
legend('浮子角速度')
%%
plot(t,x(:,5),'r')
xlabel('t / s')
ylabel('x / m')
legend('振子位移')
%%
plot(t,x(:,6),'r')
ylabel('v / (m/s)')
legend('振子速度')
%%
plot(t,x(:,7),'r')
xlabel('t / s')
ylabel('θ / rad')
legend('振子角位移')
%%
plot(t,x(:,8),'r')
xlabel('t / s')
ylabel('ω / (rad/s)')
legend('振子角速度')