

Img = imread('snowflakes.png');%%// This one is chosen as it is available in MATLAB image library
Img = im2bw(Img,0.2); %%// 0.2 seemed good to make enough blobs for this image
threshold = 20;
lb = bwlabel( Img );
st = regionprops( lb, 'Area', 'PixelIdxList' );
toRemove = [st.Area] < threshold; % fix your threshold here
newImg = Img;
newImg( vertcat( st(toRemove).PixelIdxList ) ) = 0; % remove

%%// For demo, that we have rejected enough unwanted blobs
figure,
subplot(211),imshow(Img);title('Ô­Í¼');
subplot(212),imshow(newImg);title('È¥Ôëºó');