% ����ͨ������б�ǣ���Ϊ4 �ڽӺ�8 �ڽӡ�ͼ��������һ�����Ϊ��ͬһ�������һ���֡�

% Create a small binary image to use for this example.
BW = logical ([1     1     1     0     0     0     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     1     1     0
               1     1     1     0     0     0     0     0])

L = bwlabel(BW, 4)  % 4 ����  % size L = size BW , L ��ֵΪ1, 2, 3 ... �ֱ��ʾ��һ�����󣬵ڶ�������...
%  get the row and column coordinates of the object labeled "2"
[r, c] = find(L==3);
rc = [r c]


