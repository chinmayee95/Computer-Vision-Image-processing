%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [psnr] = psnr(image_y,image_x)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

[n m] = size(image_x);

max = 255;

mse = 0;

for i=1:n
    for j=1:m
        mse = mse + (image_y(i,j)-image_x(i,j)) * (image_y(i,j)-image_x(i,j));
    end
end

MSE = mse/(n*m);

psnr = 10*log((max*max)/MSE);

end

