src = imread('goal4.jpg');
bw = im2bw( src, graythresh(src) );  % ת���ɶ�ֵͼ��graythresh �����������ֵ level��
    % С�ڷ�ֵ������ֵ��ֵ0�����ڷ�ֵ�ĸ�ֵ1
%imshow(src);
numel(bw)
[r, c] = size(bw);
w = ( c ) / 11 % �ܹ�11 ���֣���ƽ�����
zh = bw(:, 1:w)
imshow(zh);

