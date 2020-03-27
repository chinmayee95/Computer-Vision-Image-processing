%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020



function [red,green,blue] = blue(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

R1 = image(i-1,j-1);
R2 = image(i+1,j+1);
R3 = image(i-1,j+1);
R4 = image(i+1,j-1);
red = (R1+R2+R3+R4)/4;

G1 = image(i,j-1);
G2 = image(i,j+1);
G3 = image(i-1,j);
G4 = image(i+1,j);
green = (G1+G2+G3+G4)/4;

blue = image(i,j);
% rgb = [red green blue];
end
