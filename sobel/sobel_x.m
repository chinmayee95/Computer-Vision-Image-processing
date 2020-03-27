%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [output] = sobel_x(input_image,i,j,filter_size)

im = input_image;
f = filter_size;
f_half = (f-1)/2.0;

out=0;

% sobel mask
sobel_mask = [-1,0,1,-2,0,2,-1,0,1];
%one d array of image values in the i and j locations
ctr = 1;
for ii = i-f_half:i+f_half
    for jj = j-f_half:j+f_half
        out(ctr) = im(ii,jj);
        ctr = ctr + 1;
    end
end

output = 0;
% convolution with sobel mask
for l=1:ctr-1
    
    output = output + out(l)*sobel_mask(l);
end

end

