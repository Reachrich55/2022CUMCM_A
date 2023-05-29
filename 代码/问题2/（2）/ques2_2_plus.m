clc,clear
tic
%%

%La1=10000;%阻尼系数
%Lab=10000;%阻尼系数的比例系数

%%

% tmp2=zeros(1,501);

tmp1=0:0.2:100;
tmp1=tmp1';
cnt=1;
for n=0.3:0.05:0.4

    for Lab=500:2000:100000


        cal_coe(Lab,n);
        [t,x]=ode45(@func,[0:0.2:255],[0 0 0.2019575 0]);
%         tmp2(cnt,:)=x(751:1251,2)-x(751:1251,4);
        tmp2=x(751:1251,2)-x(751:1251,4);
        
%         fitresult=createFit(tmp1,tmp2(cnt,:))
        p0=[0.1 0];
        [p1]=lsqcurvefit(@func_plus,p0,tmp1,tmp2);
        table2(cnt,1:2)=p1;
%         y1=func_plus(p1,tmp1);
%         plot(tmp1,y1(:,1));
%         hold on
%         plot(tmp1,tmp2);
%         legend('拟合值','真实值')
        cnt=cnt+1
    end
end

toc
%%
load table2.mat

Lab=500:2000:100000;
Lab=Lab';
A=table2(:,1);

% plot(Lab(1:10),A(1:10),'Marker','*','color','r')
% hold on
% plot(Lab(11:20),A(11:20),'Marker','*','color','k')
% plot(Lab(21:30),A(21:30),'Marker','*','color','r')
% plot(Lab(31:40),A(31:40),'Marker','*','color','k')
% plot(Lab(41:50),A(41:50),'Marker','*','color','r')
% plot(Lab(51:60),A(51:60),'Marker','*','color','k')
%%
w=2.2143;
T=2*pi/w;
d=0.001;
t=0:d:T;
x=0:1:100000;
x=x';
%%
n=0;

for i=1:10
    P1(i,1)=trapz(Lab(i).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end

p0=[-1.471e-22 2.388e-17 3.713e-13 -2.597e-07 0.01443 -1.427];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P1);

P1=func_plus_plus(p2,x);


% P1 = -1.471e-22.*x.^5 + 2.388e-17.*x.^4 + 3.713e-13.*x.^3-2.597e-07.*x.^2 + 0.01443.*x - 1.427;
% P1 = 0.5.*x.*(4.358e-26.*x.^5 - 1.358e-20.*x.^4 + 1.593e-15.*x.^3 -7.766e-11.*x.^2 + 4.529e-08.*x + 0.1578).^(2+n);
index=find(P1==max(P1));

disp('最大大输出功率')
max(P1)
disp('最优阻尼系数')
x(index)
plot(x,P1);

hold on
plot(x(index),P1(index),'*')
legend('n=0','M1')
%%
n=0.05;

for i=11:20
    P2(i-10,1)=trapz(Lab(i-10).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end

p0=[-1.471e-22 2.388e-17 3.713e-13 -2.597e-07 0.01443 -1.427];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P2);

P2=func_plus_plus(p2,x);

% P2 = - 1.233e-22.*x.^5 + 2.932e-17.*x.^4 - 1.923e-12.*x.^3 -4.405e-08.*x.^2 + 0.008661.*x - 0.3197;
% P2 = 0.5.*x.*(5.462e-27.*x.^5 - 2.673e-21.*x.^4 + 4.613e-16.*x.^3 -3.228e-11.*x.^2 + 3.799e-09.*x + 0.1578).^(2+n);
index=find(P2==max(P2));

disp('最大大输出功率')
max(P2)
disp('最优阻尼系数')
x(index)
plot(x,P2);
hold on
plot(x(index),P2(index),'*')
legend('n=0.05','M2')
%%
n=0.1;

for i=21:30
    P3(i-20,1)=trapz(Lab(i-20).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.471e-22 2.388e-17 3.713e-13 -2.597e-07 0.01443 -1.427];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P3);

P3=func_plus_plus(p2,x);
% P3 = - 4.57e-23.*x.^5 + 1.297e-17.*x.^4 - 1.162e-12.*x.^3 +3.093e-11.*x.^2 + 0.005524.*x - 0.0304;
% P3 = 0.5.*x.*(-5e-27.*x.^5 + 8.301e-22.*x.^4 + 2.03e-17.*x.^3 - 9.633e-12.*x.^2 -5.421e-08.*x + 0.1578).^(2+n);
index=find(P3==max(P3));

disp('最大大输出功率')
max(P3)
disp('最优阻尼系数')
x(index)
plot(x,P3);
hold on
plot(x(index),P3(index),'*')
legend('n=0.10','M3')
%%
n=0.15;

for i=31:40
    P4(i-30,1)=trapz(Lab(i-30).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.471e-22 2.388e-17 3.713e-13 -2.597e-07 0.01443 -1.427];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P4);

P4=func_plus_plus(p2,x);
% P4 = - 9.836e-24.*x.^5 + 3.465e-18.*x.^4 - 4.141e-13.*x.^3 +1.924e-09.*x.^2 + 0.003666*x + 0.007211;
% P4 = 0.5.*x.*(-3.462e-27.*x.^5 + 7.773e-22.*x.^4 - 3.948e-17.*x.^3 -2.83e-12.*x.^2 - 4.098e-08.*x + 0.1576).^(2+n);
index=find(P4==max(P4));

disp('最大大输出功率')
max(P4)
disp('最优阻尼系数')
x(index)
plot(x,P4);
hold on
plot(x(index),P4(index),'*')
legend('n=0.15','M4')
%%
n=0.2;

for i=41:50
    P5(i-40,1)=trapz(Lab(i-40).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.233e-22 2.932e-17 -1.923e-12 -4.405e-08 0.008661 -0.3197];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P5);

P5=func_plus_plus(p2,x);
% P5 = - 1.233e-22.*x.^5 + 2.932e-17.*x.^4 - 1.923e-12.*x.^3 -4.405e-08.*x.^2 + 0.008661.*x - 0.3197;
% P2 = 0.5.*x.*(5.462e-27.*x.^5 - 2.673e-21.*x.^4 + 4.613e-16.*x.^3 -3.228e-11.*x.^2 + 3.799e-09.*x + 0.1578).^(2+n);
index=find(P5==max(P5));

disp('最大大输出功率')
max(P5)
disp('最优阻尼系数')
x(index)
plot(x,P5);
hold on
plot(x(index),P5(index),'*')
legend('n=0.20','M5')
%%
n=0.25;

for i=51:60
    P6(i-50,1)=trapz(Lab(i-50).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.233e-22 2.932e-17 -1.923e-12 -4.405e-08 0.008661 -0.3197];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P6);

P6=func_plus_plus(p2,x);
% P5 = - 1.175e-23.*x.^5 + 2.876e-18.*x.^4 - 2.742e-13.*x.^3 +4.47e-09.*x.^2 + 0.002435.*x + 0.01504;
% P5 = 0.5.*x.*(-6.923e-27.*x.^5 + 1.525e-21.*x.^4 - 1.079e-16.*x.^3 +1.231e-12.*x.^2 - 3.992e-08.*x + 0.1576).^(2+n);
index=find(P6==max(P6));

disp('最大大输出功率')
max(P6)
disp('最优阻尼系数')
x(index)
plot(x,P6);
hold on
plot(x(index),P6(index),'*')
legend('n=0.25','M6')
%%
n=0.3;

% for i=61:70
for i=1:50
    P7(i,1)=trapz(Lab(i).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.233e-22 2.932e-17 -1.923e-12 -4.405e-08 0.008661 -0.3197];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P7);

P7=func_plus_plus(p2,x);

index=find(P7==max(P7));

disp('最大大输出功率')
max(P7)
disp('最优阻尼系数')
x(index)
plot(x,P7);
hold on
plot(x(index),P7(index),'*')
% legend('n=0.30','M7')
%%
n=0.35;

% for i=71:80
for i=51:100
    P8(i-50,1)=trapz(Lab(i-50).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-1.233e-22 2.932e-17 -1.923e-12 -4.405e-08 0.008661 -0.3197];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P8);

P8=func_plus_plus(p2,x);

index=find(P8==max(P8));

disp('最大大输出功率')
max(P8)
disp('最优阻尼系数')
x(index)
plot(x,P8);
hold on
plot(x(index),P8(index),'*')
% legend('n=0.35','MAX')
%%
n=0.4;

% for i=81:90
for i=101:150
    P9(i-100,1)=trapz(Lab(i-100).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-4.57e-23 1.297e-17 -1.162e-12 3.093e-11 0.005524 -0.0304];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P9);

P9=func_plus_plus(p2,x);
% P9 = - 4.57e-23.*x.^5 + 1.297e-17.*x.^4 - 1.162e-12.*x.^3 +3.093e-11.*x.^2 + 0.005524.*x - 0.0304;
% P3 = 0.5.*x.*(-5e-27.*x.^5 + 8.301e-22.*x.^4 + 2.03e-17.*x.^3 - 9.633e-12.*x.^2 -5.421e-08.*x + 0.1578).^(2+n);
index=find(P9==max(P9));

disp('最大大输出功率')
max(P9)
disp('最优阻尼系数')
x(index)
plot(x,P9);
hold on
plot(x(index),P9(index),'*')
% legend('n=0.40','M9')
%%
n=0.45;

for i=91:100
    P10(i-90,1)=trapz(Lab(i-90).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-4.57e-23 1.297e-17 -1.162e-12 3.093e-11 0.005524 -0.0304];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P10);

P10=func_plus_plus(p2,x);

index=find(P10==max(P10));

disp('最大大输出功率')
max(P10)
disp('最优阻尼系数')
x(index)
plot(x,P10);
hold on
plot(x(index),P10(index),'*')
legend('n=0.45','M10')
%%
n=0.50;

for i=101:110
    P11(i-100,1)=trapz(Lab(i-100).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-4.57e-23 1.297e-17 -1.162e-12 3.093e-11 0.005524 -0.0304];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P11);

P11=func_plus_plus(p2,x);

index=find(P10==max(P11));

disp('最大大输出功率')
max(P11)
disp('最优阻尼系数')
x(index)
plot(x,P11);
hold on
plot(x(index),P11(index),'*')
legend('n=0.50','M11')
%%
n=0.55;

for i=111:120
    P12(i-110,1)=trapz(Lab(i-110).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-4.57e-23 1.297e-17 -1.162e-12 3.093e-11 0.005524 -0.0304];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P12);

P12=func_plus_plus(p2,x);

index=find(P10==max(P12));

disp('最大大输出功率')
max(P12)
disp('最优阻尼系数')
x(index)
plot(x,P12);
hold on
plot(x(index),P12(index),'*')
legend('n=0.55','M12')
%%
n=0.6;
for i=121:130
    P13(i-120,1)=trapz(Lab(i-120).*(abs(A(i).*sin(w.*t))).^(n+2)).*d/T;
end
p0=[-4.57e-23 1.297e-17 -1.162e-12 3.093e-11 0.005524 -0.0304];
[p2]=lsqcurvefit(@func_plus_plus,p0,Lab,P13);

P13=func_plus_plus(p2,x);
% P13 = - 9.836e-24.*x.^5 + 3.465e-18.*x.^4 - 4.141e-13.*x.^3 +1.924e-09.*x.^2 + 0.003666*x + 0.007211;
% P4 = 0.5.*x.*(-3.462e-27.*x.^5 + 7.773e-22.*x.^4 - 3.948e-17.*x.^3 -2.83e-12.*x.^2 - 4.098e-08.*x + 0.1576).^(2+n);
index=find(P13==max(P13));

disp('最大大输出功率')
max(P13)
disp('最优阻尼系数')
x(index)
plot(x,P13);
hold on
plot(x(index),P13(index),'*')
legend('n=0.60','M13')
%%

% x=0:1:100000;
% P = 0.5.*x.*(5.078.*10.^-26.*x.^5-1.634.*10.^-20.*x.^4+1.965.*10.^-15.*x.^3-9.798.*10.^-11.*x.^2 + 1.916.*10.^-7.*x + 0.1869).^2;
% plot(x,P);

% DP=diff(P)
% DP=simplify(DP)
% solve(DP,x)
% DP=(1.2893.*10.^-51.*p).*(31811.9+p).^2.*(1.59395.*10.^10-243954.*p+p)
% (x*(5529452349518481875*x^5 - 1779268440156203253760000*x^4 + 213969552319886125244088320000*x^3 - 10669077219492336970260482621440000*x^2 + 20863392480656578542810262122004480000*x + 20351607800807487622817508521279193190760448)^2)/23714219875802356822747337729779283528349692859523187515280913204820608950258892800000000
