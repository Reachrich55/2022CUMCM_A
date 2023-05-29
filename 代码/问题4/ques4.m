% clc,clear
% 
% tic
% 
% Laf=58000;
% Lam=93000;
% 
% tmp1=0:0.2:100;
% tmp1=tmp1';
% cnt=1;
% for Laf=0:10000:100000
% 
%     for Lam=0:10000:100000
%           r1=x(751:1251,2)-x(751:1251,6);
%           r2=x(751:1251,4)-x(751:1251,8);

%           cnt=cnt+1
%     end
%     
% end
%
%%
clc,clear

tic

p01=[0.113 0];
p02=[0.0198 0];

tmp1=0:0.2:100;
tmp1=tmp1';
cnt=1;

table1=zeros(36,2);
table2=zeros(36,2);
for Laf=55000:1000:60000

    for Lam=90000:1000:95000
        cal_coe(Laf,Lam);
        [t,x]=ode45(@func , [0:0.2:255] , [0 0 0 0 0.4519575 0 0 0]);
        r1=x(751:1251,2)-x(751:1251,6);
        r2=x(751:1251,4)-x(751:1251,8);

        [p11]=lsqcurvefit(@func_plus,p01,tmp1,r1);
        [p12]=lsqcurvefit(@func_plus_plus,p02,tmp1,r2);
        table1(cnt,1)=0.5*Laf*p11(1)^2;
        table1(cnt,2)=0.5*Lam*p12(1)^2;%p2=0.5*Lam*p12(1)^2;
        table2(cnt,1)=Laf;
        table2(cnt,2)=Lam;
        cnt=cnt+1
    end
    
end

toc
%%
% load table1cnt37.mat
% load table2cnt37.mat
p=table1(1:36,1)+table1(1:36,2);
f=table2(1:36,1);
m=table2(1:36,2);
% scatter3(f,m,p)
[X,Y,Z]=griddata(f,m,p,linspace(min(f),max(f))',linspace(min(m),max(m)),'v4');%插值
disp('P最大值')
t=max(max(Z))
surf(X,Y,Z,'EdgeColor','none','FaceAlpha',0.8);%三维曲面
hold on
local=find(Z==t);
scatter3(X(local),Y(local),Z(local));
X(local)
Y(local)
%%
% cal_coe(Laf,Lam);
% [t,x]=ode45(@func , [0:0.2:255] , [0 0 0 0 0.4519575 0 0 0]);

%%
% plot(t,x(:,2)-x(:,6))
%%
% plot(t,x(:,4)-x(:,8))
%%
% r1=x(751:1251,2)-x(751:1251,6);
% r2=x(751:1251,4)-x(751:1251,8);
% 
% p01=[0.113 0];
% p02=[0.0198 0];
% [p11]=lsqcurvefit(@func_plus,p01,tmp1,r1);
% [p12]=lsqcurvefit(@func_plus_plus,p02,tmp1,r2);

%拟合r1=A1sin(wt+b1)的A1 p11(1)
%拟合r2=A2sin(wt+b2)的A2 p12(1)

% p1=0.5*Laf*p11(1)^2;
% p2=0.5*Lam*p12(1)^2;
% 
% P=p1+p2;

