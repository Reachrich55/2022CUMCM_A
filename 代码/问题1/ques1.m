clc,clear
format long
%%
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

f    = 1.4005     ;% 入射波浪频率 (s-1)
mad  = 1335.535   ;% 垂荡附加质量 (kg)
Jad  = 6779.315   ;% 纵摇附加转动惯量 (kg·m2)
L_r  = 656.3616   ;% 垂荡兴波阻尼系数 (N·s/m)
L_z  = 151.4388   ;% 纵摇兴波阻尼系数 (N·m·s)
A    = 6250       ;% 垂荡激励力振幅 (N)
M    = 1230       ;% 纵摇激励力矩振幅 (N·m)

La1=10000;
Lab=10000;

%%D2y
m1      =  mf + mad;
dy111   =  -1*La1;
dy112   =  -1*L_r;
dz111   =  La1;
z111    =  kg;
y111    =  -1*pi*rf*rf*g*p;
y112    =  -1*kg;
C111    =  -1*kg*l0;
C112    =  mz*g;

dy11    = (dy111+dy112)/m1;
dz11    = dz111/m1;
z11     = z111/m1;
y11     = (y111+y112)/m1;
cos_t11 =  A/m1;
C11     = (C111+C112)/m1;

%coefficient
coefficient1_1=[dy11,dz11,y11,z11,cos_t11,C11]
%%
m2      = mz;
dy121   = La1;
dz121   = -1*La1;
y121    = kg;
z121    = -1*kg;
C121    = kg*l0;
C122    = -1*mz*g;

dy12    = dy121/m2;
dz12    = dz121/m2;
y12     = y121/m2;
z12     = z121/m2;
C12     = (C121+C122)/m2;
%coefficient
coefficient1_2=[dy12,dz12,y12,z12,C12];

%%
absx1   = -1*Lab/m1;
dy211   = -1*L_r;
y211    = -1*np.pi*rf*rf*g*p;
y212    = -1*kg;
z211    = kg;
cos_t21 = A/m1;
C211    = -1*kg*l0;
C212    = mz*g;

dy21    = dy211/m1;
y21     = (y211+y212)/m1;
z21     = z211/m1;
C21     = (C211+C212)/m1;
%coefficient
coefficient2_1=[absx1,dy21,y21,z21,cos_t21,C21];
    
%%
absx2   = Lab/m2;
y221    = kg;
z221    = -1*kg;
C221    = kg*l0;
C222    = -mz*g;

y22     = y221/m2;
z22     = z221/m2;
C22     = (C221+C222)/m2;
%coefficient
coefficient2_2=[absx2,y22,z22,C22]
