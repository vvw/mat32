
% 字符识别OCR研究一（模板匹配&BP神经网络训练）
% http://blog.csdn.net/zhubenfulovepoem/article/details/6803150

clc;
clear all;
close all;

I=imread('i.png');%读取测试图片
[m,n,z]=size(I)
figure(1);
imshow(I);title('测试图片')
I1=rgb2gray(I);
    imwrite(I1,'I1.jpg');%保存二值化图像
figure(2);
imshow(I1);%显示二值化图像
%figure(3);
%imhist(I1);


Ic = imcomplement(I1);%取反
    imwrite(Ic,'Ic.jpg');
figure(33);imshow(Ic);
BW = im2bw(Ic, graythresh(Ic));%二值化
    imwrite(BW,'BW.jpg');
figure(5), imshow(BW); 


bw=edge(I1,'prewitt');%边缘提取
    imwrite(bw,'bw.jpg');
figure(32);imshow(bw);
theta=1:180;
[R,xp]=radon(bw,theta);
[I0,J]=find(R>=max(max(R)));%J记录了倾斜角
qingxiejiao=90-J
goal1=imrotate(BW,qingxiejiao,'bilinear','crop');
    imwrite(goal1,'goal1.jpg');
figure,imshow(I1);title('correct image');


%中值滤波
goal3=medfilt2(goal1,[3,3]);
figure(19), imshow(goal3);


goal3=medfilt2(goal3,[3,3]);
    imwrite(goal3,'goal3.jpg');
figure(19), imshow(goal3);


%求解X方向的投影像素范围
[ix1,iy1]=xfenge(goal1)


%求解y方向的投影像素范围
[jx1,jy1]=yfenge(goal1)


%字符区域分割：
goal4=goal3(ix1:iy1,jx1:jy1);
    imwrite(goal4,'goal4.jpg');
figure(21);imshow(goal4);
[m,n]=size(goal4)
%[L,num] = bwlabel(goal4,8);%区域标记，1,2,3,4


ysum(n-1)=0;
for y=1:n-1
ysum(y)=sum(goal4(:,y));
end
%y=1:n-1;
%figure(12)
%plot(y,ysum)%画出y方向上的像素分布


%找出ysum分布的几个与y轴交点就是单个字符在y轴上分布的区间
i=1;j=1;
for y=1:n-2
    if (ysum(y)==0)&(ysum(y+1)~=0)
        yy(i)=y
        i=i+1;
    end
    
    if (ysum(y)~=0)&(ysum(y+1)==0)
        yx(j)=y
        j=j+1;
    end
end
[m_yy,n_yy]=size(yy);%求出字符的分布并分割
if n_yy==3 %根据n_yy和n_yx的个数及分布区间，选择分割区间
%segment
num1=goal4(1:m , 1:yx(1));%分割出字符1
figure(23);imshow(num1);


num2=goal4(1:m ,yy(1):yx(2));%分割出字符2
figure(24);imshow(num2);


num3=goal4(1:m ,  yy(2):yx(3));%分割出字符3
figure(25);imshow(num3);


num4=goal4(1:m ,  yy(3):n);%分割出字符4
figure(26);imshow(num4);


%[m1,n1]=size(num1)%求出各个字符的大小
%[m2,n2]=size(num2)
%[m3,n3]=size(num3)
%[m4,n4]=size(num4)
%对单个字符细分，避免字体出现大小不一致的情况，也就是再在x轴上进行分割
[ix1,iy1]=xfenge(num1)
[ix2,iy2]=xfenge(num2)
[ix3,iy3]=xfenge(num3)
[ix4,iy4]=xfenge(num4)
num1=goal4(ix1:iy1 , 1:yx(1));
figure(23);imshow(num1);


num2=goal4(ix2:iy2 ,yy(1):yx(2));
figure(24);imshow(num2);


num3=goal4(ix3:iy3 ,  yy(2):yx(3));
figure(25);imshow(num3);


num4=goal4(ix4:iy4 ,  yy(3):n);
figure(26);imshow(num4);


imwrite(num1, 'nnum1.bmp'); 
imwrite(num2, 'nnum2.bmp'); 
imwrite(num3, 'nnum3.bmp'); 
imwrite(num4, 'nnum4.bmp'); 
end


if n_yy==4 %根据n_yy和n_yx的个数及分布区间，选择分割区间
    %segment
num1=goal4(1:m , yy(1):yx(1));
figure(23);imshow(num1);


num2=goal4(1:m ,yy(2):yx(2));
figure(24);imshow(num2);


num3=goal4(1:m ,  yy(3):yx(3));
figure(25);imshow(num3);


num4=goal4(1:m ,  yy(4):n);
figure(26);imshow(num4);
%[m1,n1]=size(num1)
%[m2,n2]=size(num2)
%[m3,n3]=size(num3)
%[m4,n4]=size(num4)
%对单个字符细分
[ix1,iy1]=xfenge(num1)
[ix2,iy2]=xfenge(num2)
[ix3,iy3]=xfenge(num3)
[ix4,iy4]=xfenge(num4)
num1=goal4(ix1:iy1 , yy(1):yx(1));
figure(23);imshow(num1);


num2=goal4(ix2:iy2 ,yy(2):yx(2));
figure(24);imshow(num2);


num3=goal4(ix3:iy3 ,  yy(3):yx(3));
figure(25);imshow(num3);


num4=goal4(ix4:iy4 ,  yy(4):n);
figure(26);imshow(num4);
imwrite(num1, 'nnum1.bmp'); 
imwrite(num2, 'nnum2.bmp'); 
imwrite(num3, 'nnum3.bmp'); 
imwrite(num4, 'nnum4.bmp'); 
end
