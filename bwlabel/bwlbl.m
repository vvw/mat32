% 对连通对象进行标记，分为4 邻接和8 邻接。图像中连在一起的认为是同一个对象的一部分。

% Create a small binary image to use for this example.
BW = logical ([1     1     1     0     0     0     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     1     1     0
               1     1     1     0     0     0     0     0])

L = bwlabel(BW, 4)  % 4 邻域  % size L = size BW , L 的值为1, 2, 3 ... 分别表示第一个对象，第二个对象，...
%  get the row and column coordinates of the object labeled "2"
[r, c] = find(L==2);
rc = [r c]
