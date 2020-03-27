%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [output] = raw_3d(file)
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here

red_ch = file(:,:,1);
green_ch = file(:,:,2);
blue_ch = file(:,:,3);

[r c m] = size(file);

k = 1;

for i=1:r
    for j=1:c
        
        out(k) = red_ch(i,j);
        out(k+1) = green_ch(i,j);
        out(k+2) = blue_ch(i,j);
        
        k = k + 3;
    end
end

l = 1;

% for i=1:r
%     for j=1:(3*c)
%         image_out(i,j) = out(l);
%         l = l + 1;
%     end
% end

output = out;

writeraw(output,'dbl.raw');


% %reading the image
% x_size=532;
% y_size=600;
% fileHandle = fopen('dbl.raw');
% rgbImage = fread(fileHandle, (x_size * y_size * 3), '*uint8');
% redChannel = reshape(rgbImage(1:3:end), [y_size, x_size]);
% greenChannel = reshape(rgbImage(2:3:end), [y_size, x_size]);
% blueChannel = reshape(rgbImage(3:3:end), [y_size, x_size]);
% rgbImage = cat(3, redChannel, greenChannel, blueChannel);
% imshow(rgbImage)
% Ifinal = flip(imrotate(rgbImage, -90),2);
% imagesc(Ifinal);
% fclose(fileHandle);

% imshow(image)

end

