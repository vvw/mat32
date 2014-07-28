src = imread('goal4.jpg');
bw = im2bw( src, graythresh(src) );  % 转换成二值图像，graythresh 函数计算出阀值 level，
    % 小于阀值的像素值赋值0，大于阀值的赋值1
%imshow(src);
numel(bw)
[r, c] = size(bw);
w = ( c ) / 11 % 总共11 个字，求平均宽度
zh = bw(:, 1:w)
imshow(zh);

