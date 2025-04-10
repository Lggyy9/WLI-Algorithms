clc;clear;close all;

%设定基本参数
step_dis = 50e-9;                %pzt步进量大小
z = -5e-6 : step_dis : 5e-6;    % 干涉信号坐标范围
h0 = 0;                         %零光程差位置
lambda = 1550e-9;                 % 光源中心波长
d_lambda = 250e-9;                 % 光谱宽度
i0 = 3;                            %背景光强
vis = 1;                           %干涉信号可见度

lc = lambda^2/d_lambda;           % 相干长度
gz = exp(-((z-h0)*2*pi/lc).^2);   % 高斯包络曲线
cz = cos(4*pi/lambda*(z-h0));      % 正弦调制

intensities = i0*vis*gz.*cz+i0;   % 白光干涉信号

figure, plot(z, intensities, 'k', 'LineWidth', 2);