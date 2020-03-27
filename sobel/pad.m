%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [out] = pad(image,filter_size)

%padding with reflection

[r c] = size(image);
f_size = filter_size;
f_half = (f_size-1)/2;

out = zeros(r+f_size-1,c+f_size-1);

out(f_half+1:r+f_half,f_half+1:c+f_half) = image;

%reflecting the boundary pixels
out(f_half , f_half + 1 : c + f_half) = out(f_half + 1 , f_half + 1 : c + f_half);
out(r + f_half + 1 , f_half + 1 : c + f_half) = out(r + f_half , f_half + 1 : c + f_half);
end

