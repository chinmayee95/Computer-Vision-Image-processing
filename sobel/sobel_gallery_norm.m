%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector

I = readraw('Gallery.raw');

c=481;
r=321;

%reading rgb raw image
k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

%convert to gray image
gray_in = 0.2989 * red_ch + 0.5870 * green_ch + 0.1140 * blue_ch;

%sobel operation

%padding
image = pad(gray_in,3);

%sobel operation
for i=1:r
    for j=1:c
        gray_x(i,j) = sobel_x(image,i+1,j+1,3);
        gray_y(i,j) = sobel_y(image,i+1,j+1,3);
        gray_out(i,j) = sqrt(gray_x(i,j).*gray_x(i,j) + gray_y(i,j).*gray_y(i,j));
        %gray_out(i,j) = abs(gray_x(i,j)) + abs(gray_y(i,j));
        %gray_out(i,j) = gray_x(i,j)+gray_y(i,j);
    end
end

%tuning
min_x = min(min(gray_x));
max_x = max(max(gray_x));
min_y = min(min(gray_y));
max_y = max(max(gray_y));
min_gray_out = min(min(gray_out));
max_gray_out = max(max(gray_out));

normalised_x = 255*(gray_x-min_x)/(max_x-min_x);
normalised_y = 255*(gray_y-min_y)/(max_y-min_y);
normalised_out = 255*(gray_out-min_gray_out)/(max_gray_out-min_gray_out);
tune_out = tuning(gray_out,204);
% 
writeraw(normalised_out,'Gallery_norm_sobel.raw');
% writeraw(normalised_x,'Dogs_normx_sobel.raw');
% writeraw(normalised_y,'Dogs_normy_sobel.raw');

writeraw(gray_in,'Gallery_gray_input.raw');
writeraw(normalised_x,'Gallery_normx_sobel.raw');
writeraw(normalised_y,'Gallery_normy_sobel.raw');
writeraw(gray_out,'Gallery_sobel.raw');
writeraw(tune_out,'Gallery_sobel_tune.raw');