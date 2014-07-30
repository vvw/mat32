
src = imread('goal4.jpg');
bw = im2bw( src, graythresh(src) );  % ת���ɶ�ֵͼ��graythresh �����������ֵ level��
    % С�ڷ�ֵ������ֵ��ֵ0�����ڷ�ֵ�ĸ�ֵ1
lb = bwlabel( bw );
stat = regionprops(lb,'Centroid','Area','PixelIdxList', 'BoundingBox');
stat(1).PixelIdxList  % ��һ����������������б�
newBw = bw
% newBw(stat(1).PixelIdxList) = 0  % ɾ����һ������
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
w = floor(  c  / 11 ); % �ܹ�11 ���֣���ƽ�����
zh = bw(:, 1:w);
figure,imshow(zh);
%find(zh == 1)

