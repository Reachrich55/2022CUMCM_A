# 2022CUMCM_A
使用4阶Runge-Kutta方法解析波浪能装置原理  
关于龙格-库塔，你需要知道：https://baike.baidu.com/item/%E9%BE%99%E6%A0%BC%E5%BA%93%E5%A1%94%E6%B3%95/3016350  
**此说明并不涉及对波浪能装置的力学分析，仅仅是利用matlab中ode45()的方法，提供4阶Runge-Kutta方法解高阶微分方程组的思路** 
+ ## 一阶微分方程 
参考matlab帮助文档可知  
求微分方程组 $y′=f(t,y)$ 从 $t_0$到 $t_f$的积分
[t,y] = ode45(odefun,tspan,y0)  
(其中odefun通常可自设为函数句柄，tspan=[t0,tf]，初始条件为 $y_0$)  
这是4阶Runge-Kutta方法最基本的用法  
**示例:**  
求解 y′=2t 指定时间区间[0,5]和初始条件y0=0  
```matlab
tspan = [0,5];  
y0 = 0;  
[t,y] = ode45(@(t,y) 2*t, tspan, y0);  
```
+ ## 一阶微分方程组  
对于一阶微分方程组的求解，可以使用与解决单个一阶微分方程相似的方法  
只是此时需要定义一个返回向量的函数，该向量包含所有未知函数及其导数的值。(返回向量的函数可以参考代码中的 func    
**示例：**

$$
	\begin{cases}
	  \frac{dx_1}{dt} = &-0.1x_1+0.2x_2\\
	  \frac{dx_2}{dt} = &0.1x_1-0.2x_2\\
	\end{cases}
$$
```matlab
% 定义函数
function dydt = func(t, y)
    % 定义常数
    k1 = 0.1;
    k2 = 0.2;
    
    % 计算导数
    dydt = zeros(2, 1);
    dydt(1) = -k1 * y(1) + k2 * y(2); % dy1/dt = -k1 * y1 + k2 * y2
    dydt(2) = k1 * y(1) - k2 * y(2);  % dy2/dt = k1 * y1 - k2 * y2
end

% 定义时间范围和初始条件
tspan = [0 10]; % 时间范围从0到10
y0 = [1; 0];    % 初始条件为 y1(0)=1, y2(0)=0

% 调用 ode45 函数求解微分方程组
[t, y] = ode45(@func, tspan, y0);
```
+ ## 高阶微分方程 
通常，高阶微分方程可以转换成等价的一阶微分方程组  
**示例：** 考虑一个二阶微分方程：  

$$\frac{d^2y}{dt^2}+p(t)\frac{dy}{dt}+q(t)y = f(t)$$
  
可以引入新的变量将其转化成一个一阶微分方程组:  

$$
	\begin{cases}
	  \frac{dy}{dt} &= &v\\
	  \frac{dv}{dt} &= &-p(t)v-q(t)y+f(t)\\
	\end{cases}
$$  

利用求解一阶微分方程组的方法即可求解高阶微分方程  
```matlab
% 定义函数
function dydt = func(t, y)
    % 定义常数
    p = 0.1;
    q = 0.2;
    f = sin(t);
    
    % 解析解中的变量
    dydt = zeros(2,1);
    dydt(1) = y(2); % y1' = y2
    dydt(2) = -p*y(2) - q*y(1) + f; % y2' = -p*y2 - q*y1 + f(t)
end

% 定义时间范围和初始条件
tspan = [0 10]; % 时间范围从0到10
y0 = [0; 0];    % 初始条件为 y(0)=0, y'(0)=0

% 调用 ode45 函数求解微分方程组
[t, y] = ode45(@func, tspan, y0);
```
+ ## 高阶微分方程组
综上所述，要解决一个高阶微分方程组，首先需要将其转化为一个等价的一阶微分方程组  
通过引入新的变量来表示每个未知函数的每个阶导数，从而将高阶微分方程转化为一阶微分方程组  
**示例：**  

$$
	\begin{cases}
	  \frac{d^2y_1}{dt^2} &= &f_1(t,y_1,y_2,\frac{dy_1}{dt},\frac{dy_2}{dt})\\
	  \frac{d^2y_2}{dt^2} &= &f_2(t,y_1,y_2,\frac{dy_1}{dt},\frac{dy_2}{dt})\\
	\end{cases}
$$  

将其转化为一阶微分方程组：  

$$
	\begin{cases}
	  \frac{dy_1}{dt} &= &v_1\\
	  \frac{dv_1}{dt} &= &f_1(t,y_1,y_2,v_1,v_2)\\
    \frac{dy_2}{dt} &= &v_2\\
	  \frac{dv_2}{dt} &= &f_2(t,y_1,y_2,v_1,v_2)\\
	\end{cases}
$$  
  
```matlab
% 定义函数
function dydt = func(t, y)
    % 定义参数
    p = 0.1;
    q = 0.2;
    
    % 解析解中的变量
    dydt = zeros(4,1);
    dydt(1) = y(2); % y1' = v1
    dydt(2) = -p*y(2) - q*y(1); % v1' = -p*v1 - q*y1
    dydt(3) = y(4); % y2' = v2
    dydt(4) = p*y(4) - q*y(3); % v2' = p*v2 - q*y2
end

% 定义时间范围和初始条件
tspan = [0 10]; % 时间范围从0到10
y0 = [0; 0; 0; 0]; % 初始条件为 y1(0)=0, y1'(0)=0, y2(0)=0, y2'(0)=0

% 调用 ode45 函数求解微分方程组
[t, y] = ode45(@func, tspan, y0);
```
