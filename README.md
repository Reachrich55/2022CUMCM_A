# 2022CUMCM_A
使用4阶Runge-Kutta方法解析波浪能装置原理 
#
此说明并不涉及对波浪能装置的力学分析，仅仅是利用matlab中ode45()的方法，提供4阶Runge-Kutta方法解高阶微分方程组的思路 
## 一阶微分方程 
这是4阶Runge-Kutta方法最基本的用法 
参考matlab帮助文档可知 
求微分方程组 y′=f(t,y) 从 t0 到 tf 的积分，初始条件为 y0
[t,y] = ode45(odefun,tspan,y0)（其中 tspan = [t0 tf]）
## 高阶微分方程 
通常，高阶微分方程可以转换成等价的一阶微分方程组。例如，考虑一个二阶微分方程： 
\[ \frac{{d^2y}}{{dt^2}} + p(t) \frac{{dy}}{{dt}} + q(t)y = f(t) \]
