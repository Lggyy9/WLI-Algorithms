# MATLAB白光算法代码库

仅包含已理解的代码，师兄代码见‘F:\实验室文件\白光代码\MATLAB’；引用块中为需要提供/可调的参数



## 数据处理(Dataprocessing)

**Read3DPointCloud.m**：

读取存放在.txt文件中的三维点云并scatter3显示，txt中的数据格式为：X1Y1Z1 /n; X2Y2Z2 /n; ......; XnYnZn

> 文件路径

**SignalExtraction.m:**

从指定路径文件夹中读取n张灰度图，提取感兴趣的像素点的干涉信号并显示；**此程序认为图像由0.bmp~n.bmp对应PZT从低到高扫描**

> 文件路径；PZT扫描步距；感兴趣的像素点坐标



## 仿真(Simulation)

**SignalSimul.m**

仿真白光干涉信号并plot显示

> PZT扫描步距；干涉信号坐标范围；零光程差位置；光源中心波长；光谱宽度；背景光强；干涉条纹可见度；

**SurfImgsSimul.m**

仿真给定表面一系列干涉灰度图像并保存在给定路径文件夹中

>图像大小；像素对应实际物理尺寸；光源中心波长；光谱宽度；PZT扫描步距；干涉信号坐标范围；背景光强（灰度值）；干涉条纹可见度
>
>提供了两个例子：斜面和极度简化的TSV深孔



## 解算（SurfReconstruction）

**Reconstruction.m**

读取给定路径中的灰度图，使用给定算法进行解算并显示

>PZT扫描步距；

**CentroidAlg.m**

质心法解算单个像素点高度值，输入为扫描信号坐标与干涉信号，原理公式如下：
$$
I_i'=I_i-I_{mean}
$$

$$
h=\frac{\sum{(z{\lvert I_i' \rvert})}}{\sum{\lvert I_i' \rvert}}
$$

## 下一步

* 深入考虑TSV深孔模型相关的仿真，使用更接近实际的数值计算方法
* 学习其他解算算法并编写代码