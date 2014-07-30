
src = imread('goal4.jpg');
bw = im2bw( src, graythresh(src) );  % 转换成二值图像，graythresh 函数计算出阀值 level，
    % 小于阀值的像素值赋值0，大于阀值的赋值1
lb = bwlabel( bw );
stat = regionprops(lb,'Centroid','Area','PixelIdxList', 'BoundingBox');
stat(1).PixelIdxList  % 第一个对象的像素索引列表
newBw = bw
% newBw(stat(1).PixelIdxList) = 0  % 删除第一个对象
figure, imshow(newBw);
hold on;
rectangle('Position', stat(1).BoundingBox, ...
        'EdgeColor','y');
rectangle('Position', stat(3).BoundingBox, ...
        'EdgeColor','y');
rectangle('Position', stat(7).BoundingBox, ...
        'EdgeColor','y');
hold off;
%numel(bw)
[r, c] = size(bw);
w = floor(  c  / 11 ); % 总共11 个字，求平均宽度
zh = bw(:, 1:w);
figure,imshow(zh);
%find(zh == 1)

