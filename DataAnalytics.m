c = 2.998e8;
radii = 350:5:350;
heights = 1000:100:1000;
figure;
imagesc(radius*2, heights, mod(upx, 2*pi)');
colorbar;
figure;
imagesc(radius*2, heights, t');
colorbar;