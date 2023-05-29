function [dy11,dz11,y11,z11,cos_t11,C11,dy12,dz12,y12,z12,C12] = cal_coe(La1)
mf = 4866   ;% 浮子质量
rf = 1      ;% 浮子底半径
hfz= 3      ;% 浮子圆柱部分高度
hV = 0.8    ;% 浮子圆锥部分高度
mz = 2433   ;% 振子质量
rz = 0.5    ;% 振子半径 (m)
hz = 0.5    ;% 振子高度 (m)
p  = 1025   ;% 海水的密度 (kg/m3)
g  = 9.8    ;% 重力加速度 (m/s2)
kg = 80000  ;% 弹簧刚度 (N/m)
l0 = 0.5    ;% 弹簧原长 (m)
kn = 250000 ;% 扭转弹簧刚度 (N·m)
j  = 8890.7 ;% 静水恢复力矩系数 (N·m)
%%
f    =  2.2143     ;% 入射波浪频率 (s-1)
mad  = 1165.992   ;% 垂荡附加质量 (kg)
Jad  = 7131.29   ;% 纵摇附加转动惯量 (kg·m2)
L_r  = 167.8395   ;% 垂荡兴波阻尼系数 (N·s/m)
L_z  = 2992.724   ;% 纵摇兴波阻尼系数 (N·m·s)
A    = 4890      ;% 垂荡激励力振幅 (N)
M    = 2560       ;% 纵摇激励力矩振幅 (N·m)

% La1=10000;%阻尼系数
Lab=10000;%阻尼系数的比例系数

%%
%D2y
m1      =  mf + mad;
dy112   =  -1*L_r;
z111    =  kg;
y111    =  -1*pi*rf*rf*g*p;
y112    =  -1*kg;
C111    =  -1*kg*l0;
C112    =  mz*g;
z11     = z111/m1;
y11     = (y111+y112)/m1;
cos_t11 =  A/m1;
C11     = (C111+C112)/m1;
%D2z
m2      = mz;
y121    = kg;
z121    = -1*kg;
C121    = kg*l0;
C122    = -1*mz*g;
y12     = y121/m2;
z12     = z121/m2;
C12     = (C121+C122)/m2;

dy111   =  -1*La1;
dy11    = (dy111+dy112)/m1;
dz111   =  La1;
dz11    = dz111/m1;
dy121   = La1;
dz121   = -1*La1;
dy12    = dy121/m2;
dz12    = dz121/m2;
save coe.mat dy11 dz11 y11 z11 cos_t11 C11 dy12 dz12 y12 z12 C12
end