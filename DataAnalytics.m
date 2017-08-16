c = 2.998e8;
radii = 350:5:500; %36 points
heights = 500:100:1500; %11 points
% for height = 1:11
% figure;
% %imagesc(wavelengths (100), radius (401), phasex (100x401) transpose)
% imagesc(radius*2, heights(height), mod(unwrapped_phasex(:, :, height), 2*pi)');
% colorbar;
% figure;
% imagesc(radii, heights(height), pillar_reflection(:, :, height)');
% colorbar;
% end

variable1 = squeeze(unwrapped_phasex(1,:,:));
variable2 = squeeze(pillar_reflection(1, :, :));
figure;
imagesc(radii, heights, mod(variable1, 2*pi)');
colorbar;
figure;
imagesc(radii, heights, variable2');
colorbar;