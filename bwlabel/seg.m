src = imread('2.png');
figure(1); imshow(src);title('src');
A = magic(4)
A(1:4, 1:2)  % 行1 到4 % 列 1 到2
A(1:2:5)