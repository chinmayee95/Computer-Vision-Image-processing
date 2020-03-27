%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [output] = gauss_filt(input_image,i,j,sigma,filter_size)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

im = input_image;
f = filter_size;
f_half = (f-1)/2.0;

out=0;

k = 1/(2.0*pi*sigma*sigma);
c = -.5*sigma*sigma;

% calculating the gaussian mask
cntr = 1;
for ii = -f_half:f_half
    for jj = -f_half:f_half
        gauss_mask(cntr) = k*exp(c*((ii*ii) +(jj*jj)));
        cntr = cntr + 1;
%         wt = wt + exp(c*((ii*ii) +(jj*jj)));
    end
end
%one d array of image values in the i and j locations
ctr = 1;
for ii = i-f_half:i+f_half
    for jj = j-f_half:j+f_half
        out(ctr) = im(ii,jj);
        ctr = ctr + 1;
%         wt = wt + exp(c*((ii*ii) +(jj*jj)));
    end
end

output = 0;
% convolution with gaussian mask
for l=1:ctr-1
    
    output = output + out(l)*gauss_mask(l);
end

weights = 0;

for k = 1:ctr-1
    
    weights = weights + gauss_mask(k);
    
end

output = output/weights;

end

