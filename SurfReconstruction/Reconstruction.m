clc;
clear;
close all;

%% Picture Input
% ����·���Զ�ѭ����ͼ(�Ҷ�ͼ)
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

step_dis = 100e-9;                     %ɨ�貽��
z = 0:step_dis:step_dis*(Npicture-1);  % �����ź����� 
Height = zeros(Nx,Ny);                                 % ȫ�����
intensities = zeros(Npicture,1);

for i = 1:Nx
    for j = 1:Ny
        intensities = I_all(:,i,j);
        Height(i,j) = CentroidAlg(z,intensities);      %�㷨�����ɸ���
    end
end
%% 3D Rescontruct
figure;
subplot(1,2,1);
surf(Height);
shading interp;
title('��ά����');
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