
% ɾ��ͼ����������Ķ���

Img = imread('coins.png');%%// This one is chosen as it is available in MATLAB image library
Img = im2bw(Img, graythresh(Img)); %%// 0.4 seemed good to make enough blobs for this image
figure,imshow(Img),hold all
lb = bwlabel( Img );

stat = regionprops(lb,'Centroid','Area','PixelIdxList');
[maxValue,index] = max([stat.Area]);
newImg = Img;
newImg(stat(index).PixelIdxList)=0;  % ɾ����һ������
figure,imshow(newImg);


[stat.Area]
[maxValue,index]







