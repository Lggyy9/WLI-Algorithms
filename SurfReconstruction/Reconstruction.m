clc;
clear;
close all;

%% Picture Input
% 根据路径自动循环读图(灰度图)
file_path = 'G:\Data\WLISimul\MATLAB\result\';
pictures = dir(strcat(file_path,'*.bmp'));
img0 = imread(strcat(file_path,pictures(1).name));
Npicture = length(pictures);
Nx = size(img0,1);
Ny = size(img0,2);
I_all = zeros(Npicture,Nx,Ny);
for i = 1:Npicture
    fullpath = [file_path,num2str(i-1),'.bmp'];
    I_all(i,:,:) = imread(fullpath);
end

step_dis = 100e-9;                     %扫描步距
z = 0:step_dis:step_dis*(Npicture-1);  % 干涉信号坐标 
Height = zeros(Nx,Ny);                                 % 全零矩阵
intensities = zeros(Npicture,1);

for i = 1:Nx
    for j = 1:Ny
        intensities = I_all(:,i,j);
        Height(i,j) = CentroidAlg(z,intensities);      %算法函数可更改
    end
end
%% 3D Rescontruct
figure;
subplot(1,2,1);
surf(Height);
shading interp;
title('三维面型');
xlabel('x axis / pixel')
ylabel('y axis / pixel')
zlabel('z axis / m')
axis square;
set(gca,'FontSize',20)
subplot(1,2,2);
plot(Height(Nx/2,:));
title('x = 256 pixel');
xlabel('y axis / pixel')
ylabel('z axis / m')
axis square;
set(gca,'FontSize',20)