img = rgb2gray(imread('arabic.jpg'));
[R, xp] = radon(bw_closed, [0 90]);
figure; plot(xp,R(:,2)); title('at angle 90');
