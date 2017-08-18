clear all;
c = 2.998e8;
% radii = 325:5:500; %36 points
% heights = 500:100:1500; %11 points
% for height = 1:11
% figure;
% %imagesc(wavelengths (100), radius (401), phasex (100x401) transpose)
% imagesc(radius*2, heights(height), mod(unwrapped_phasex(:, :, height), 2*pi)');
% colorbar;
% figure;
% imagesc(radii, heights(height), pillar_reflection(:, :, height)');
% colorbar;
% end
load(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar\data_all_diameters_heights.mat'))

variable1 = squeeze(unwrapped_phasex(1,:,:));
variable2 = squeeze(pillar_reflection(1, :, :));
% %phase generated from all data file
% figure;
% imagesc(radii, heights, mod(variable1, 2*pi)');
% colorbar;
%reflectance generated from all data file
figure;
imagesc(radii, heights, variable2');
colorbar;
title('Reflection Graph');
xlabel('Radius (nm)');
ylabel('Height (nm)');
savefig(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar Radius 325-505 Height 500-1500\', '500-1500 Reflection Graph'));

% for a = 1:radius
%     for b = 1:height
%         load(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar\data_', num2str(a*2), '_', num2str(b),'.mat'))
%         %reflectance(a, b) = r;
%         phase(a, b) = mod(upx, 2*pi);
%     end
% end
% 
% % %reflectance matrix generated from summing up data files 
% % figure;
% % imagesc(radii, heights, reflectance');
% % colorbar;
% 
% %phase generated from summing up data files
% figure;
% imagesc(radii, heights, phase');
% colorbar;

extended_Height = 101;
extended_Heights = 500:10:1500;
extended_radii = 325:10:505;
extended_radius = 19;
for a = 1:extended_radius
    for b = 1:extended_Height;
        load(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar Radius 325-505 Height 500-1500\data_', num2str(a*2), '_', num2str(b),'.mat'))
        extended_reflectance(a, b) = r;
        extended_phase(a, b) = mod(upx, 2*pi);
    end
end

%phase generated from extended data loop
figure;
imagesc(extended_radii, extended_Heights, mod(extended_phase, 2*pi)');
colorbar;
title('Phase Graph');
xlabel('Radius (nm)');
ylabel('Height (nm)');
savefig(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar Radius 325-505 Height 500-1500\', '500-1500 Phase Graph'));
% %reflectance generated from extended loop
% figure;
% imagesc(extended_radii, extended_Heights, extended_reflectance');
% colorbar;
% title('Transmission Graph');
% xlabel('Radius (nm)');
% ylabel('Height (nm)');
range = [33 34  59 92];
for loop = 1:length(range)
%phase for 830, 1080, 1410 nm height
figure;
plot(extended_radii, mod(extended_phase(:, range(1, loop)), 2*pi)');
title(strcat('Phase Graph for ', num2str(500 + 10*(range(1, loop)-1)), 'nm Height'));
xlabel('Radius (nm)');
ylabel('Phase (0-2pi)');
savefig(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar Radius 325-505 Height 500-1500\', num2str(500 + 10*(range(1, loop)-1)), 'nm Phase'));
%reflectance for 830, 1080, 1410 nm height
figure;
plot(extended_radii, extended_reflectance(:, range(1, loop))');
title(strcat('Reflection Graph for ', num2str(500 + 10*(range(1, loop)-1)), 'nm Height'));
xlabel('Radius (nm)');
ylabel('Reflection (%)');
savefig(strcat('C:\Users\Jerry\Desktop\Backup of USB June 6\Applications\Portfolio\Projects\Capasso Group\Coop\Lumerical\5 - SiO2 Reflection Pillar Radius 325-505 Height 500-1500\', num2str(500 + 10*(range(1, loop)-1)), 'nm Reflection'));
end