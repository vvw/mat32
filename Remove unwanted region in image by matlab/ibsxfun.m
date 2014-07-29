Img = imread('coins.png');%%// This one is chosen as it is available in MATLAB image library
Img = im2bw(Img,0.4); %%// 0.4 seemed good to make enough blobs for this image
lb = bwlabel( Img );
threshold = 2000;
[L,num] = bwlabel( Img );
counts = sum(bsxfun(@eq,L(:),1:num));
B1 = bsxfun(@eq,L,permute(find(counts>threshold),[1 3 2]));
newImg = sum(B1,3)>0;

%%// For demo, that we have rejected enough unwanted blobs
figure,
subplot(211),imshow(Img);title('‘≠Õº');
subplot(212),imshow(newImg);title('»•‘Î∫Û');

