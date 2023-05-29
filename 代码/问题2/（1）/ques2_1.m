clc,clear
tic
%%

% La1=10000;%阻尼系数
Lab=10000;%阻尼系数的比例系数

%%
% Max=zeros(1,23);
% Min=zeros(1,23);
tmp2=zeros(1,501);

cnt=1;
for La1=0:1000:100000

cal_coe(La1);
[t,x]=ode45(@func,[0:0.2:255],[0 0 0.2019575 0]);

%     [Maxt,Mint]=findA(x(:,1),Max,Min);
%     Max(end+1,:)=Maxt(end,:);
%     Min(end+1,:)=Mint(end,:);
tmp2(cnt,:)=x(751:1251,2)-x(751:1251,4);
tmp1=0:0.2:100;
fitresult=createFit(tmp1,tmp2(cnt,:))
cnt=cnt+1
end
% tmp2=x(751:1251,2)-x(751:1251,4)

toc
%%
load La1coe.mat
La1coe=table2array(La1coe);
La1=La1coe(:,1);
A=La1coe(:,2);
plot(La1,A,'*')
%%
% A = 4.079e-26*x^{5} - 1.315e-20*x^{4} + 1.585e-15*x^{3} -7.918e-11*x^{2} + 1.169e-07*x + 0.1571
x=0:0.1:100000;
P = 0.5.*x.*(4.079e-26.*x.^5 - 1.315e-20.*x.^4 + 1.585e-15.*x.^3 -7.918e-11.*x.^2 + 1.169e-07.*x + 0.1571).^2;
index=find(P==max(P));

disp('最大大输出功率')
max(P)
disp('最优阻尼系数')
x(index)
plot(x,P);
hold on
plot(x(index),P(index),'*')


% DP=diff(P)
% DP=simplify(DP)
% solve(DP,x)


