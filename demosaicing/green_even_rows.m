

%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [red,green,blue] = green_even_rows(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

R1 = image(i,j-1);
R2 = image(i,j+1);

red = (R1+R2)/2;

green = image(i,j);

B1 = image(i-1,j);
B2 = image(i+1,j);

blue = (B1+B2)/2;

% rgb = [red green blue];
end

