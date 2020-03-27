%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [red,green,blue] = red(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

red = image(i,j);

G1 = image(i,j-1);
G2 = image(i,j+1);
G3 = image(i-1,j);
G4 = image(i+1,j);

green = (G1+G2+G3+G4)/4;

B1 = image(i-1,j-1);
B2 = image(i+1,j+1);
B3 = image(i-1,j+1);
B4 = image(i+1,j-1);

blue = (B1+B2+B3+B4)/4;

% rgb = [red green blue];
end
