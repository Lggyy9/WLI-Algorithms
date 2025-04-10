clc;clear;close all;

Nx = 512;Ny = 640;Npicture = 101;  % 干涉图像信息
pixel_size = 265e-9;              %50倍放大倍率下一个像素大小约为265nm*265nm
img = uint8(zeros(Nx,Ny));      
lamda = 606.9e-9;                  % 光源中心波长
step_dis = 100e-9;                     %扫描步距
z0 = 0:step_dis:step_dis*(Npicture-1);  % 干涉信号坐标
d_lamda = 100e-9;                  % 光谱宽度
lc = lamda^2/d_lamda;            % 相干长度
I_bg = 125;    %背景光强（灰度值）
vis = 0.8;      %干涉条纹可见度

I0_all = zeros(Npicture,Nx,Ny);

% 斜平面 
Z = zeros(Nx,Ny);
for i = 1:Nx
    for j = 1:Ny
        Z(i,j) = (6+i*3+j*4)/2*1e-9+max(z0)/2;
    end
end

% 上线宽3.27微米，下线宽2.27微米，深度18微米的TSV
% height = 18e-6;
% u_linewidth = 3.27e-6;
% b_linwidth = 2.27e-6;
% x = 1:1:Ny;
% y = 1:1:Nx;
% [X, Y] = meshgrid(x, y);
% R = sqrt((X-Ny/2).^2 + (Y-Nx/2).^2) * pixel_size;
% Z = height * ones(size(R));
% ring_mask = (R > b_linwidth/2) & (R < u_linewidth/2);
% Z(R <= b_linwidth/2) = 0;
% Z(ring_mask) = (R(ring_mask) - b_linwidth/2) * height * 2 * 1e6;
% Z = Z + 3e-6;
% 
%生成干涉信号
for n = 1:Npicture
    for i = 1:Nx
        for j = 1:Ny
            gz = exp(-((z0(n)-Z(i,j))*2*pi/lc).^2);  % 高斯包络曲线
            cz = cos(4*pi/lamda*(z0(n)-Z(i,j)));     % 正弦调制
            I0_all(n,i,j) = I_bg*vis*gz*cz+I_bg;
        end
    end
end

% 存图
for n = 1:Npicture
    for i = 1:Nx
        for j = 1:Ny
            img(i,j) = round(I0_all(n,i,j));
        end
    end
    fullpath = ['G:\Data\WLISimul\MATLAB\result\',num2str(n-1),'.bmp'];
    imwrite(img,fullpath);
end
