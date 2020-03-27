%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [filtered_image] = bilateral_filter(image,x,y,window_size,sigma_s,sigma_c)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[row col] = size(image);

h = (window_size-1)/2;

num_img = 0;
weights = 0;

for i = -h:h
    for j = -h:h
        
        neighbour_x = x - i;
        neighbour_y = y - j;
        
        gs = gaussian(image(neighbour_x,neighbour_y)-image(x,y),sigma_s);
        gc = gaussian(distance(neighbour_x,neighbour_y,x,y),sigma_c);
        
        wt = gs*gc;
        
        num_img = num_img + image(neighbour_x,neighbour_y)*wt;
        
        weights = weights + wt;
        
    end
end

filtered_image = num_img/weights;

end

