
%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020


function [red,green,blue] = green_even_rows_mhc(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

green_c = image(i,j) - (.25*image(i-2,j)+.25*image(i+2,j)+.25*image(i,j-2)+.25*image(i,j+2));

R1 = image(i-1,j);
R2 = image(i+1,j);

red = (.5*R1+.5*R2) + .625*green_c;

green = image(i,j);

B1 = image(i,j-1);
B2 = image(i,j+1);

blue = (.5*B1+.5*B2) + .625*green_c;
% rgb = [red green blue];
end
