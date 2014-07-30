
% 删除图像中面积最大的对象

Img = imread('coins.png');%%// This one is chosen as it is available in MATLAB image library
Img = im2bw(Img, graythresh(Img)); %%// 0.4 seemed good to make enough blobs for this image
figure,imshow(Img),hold all
lb = bwlabel( Img );

stat = regionprops(lb,'Centroid','Area','PixelIdxList');
[maxValue,index] = max([stat.Area]);
newImg = Img;
newImg(stat(index).PixelIdxList)=0;  % 删除第一个对象
figure,imshow(newImg);


[stat.Area]
[maxValue,index]







