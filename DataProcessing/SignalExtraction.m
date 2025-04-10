clc;clear;close all;

file_path = 'yourpath\';    %存放灰度图的文件夹路径

%自动获取图像张数
bmp_files = dir(fullfile(file_path, '*.bmp'));
num_images = numel(bmp_files);

pixel_x = 320; %设定像素点X坐标
pixel_y = 256; % 设定像素点Y坐标
step_dis = 5e-9;   %设定PZT扫描步距
gray_values = NaN(num_images, 1); % 用 NaN 预分配存储灰度值的数组


% 读取图像并提取指定像素点的灰度值
for i = 0:num_images-1
    filename = fullfile(file_path, sprintf('%d.bmp', i)); % 生成文件名
    img = imread(filename);
    gray_values(i+1) = img(pixel_y, pixel_x);
end

% 绘制灰度值变化曲线
figure;
plot((0:num_images-1) * step_dis, gray_values, '-r.', 'LineWidth', 1, 'MarkerSize', 5);
hold on;
xlabel('扫描位置（米）');
grid on;