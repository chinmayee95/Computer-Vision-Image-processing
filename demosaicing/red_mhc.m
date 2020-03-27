%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [red,green,blue] = red_mhc(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

red = image(i,j);

red_c = red - (.25*image(i-2,j)+.25*image(i+2,j)+.25*image(i,j-2)+.25*image(i,j+2));

G1 = image(i,j-1);
G2 = image(i,j+1);
G3 = image(i-1,j);
G4 = image(i+1,j);

green = (.25*G1+.25*G2+.25*G3+.25*G4)+.5*red_c;

B1 = image(i-1,j-1);
B2 = image(i+1,j+1);
B3 = image(i-1,j+1);
B4 = image(i+1,j-1);

blue = (.25*B1+.25*B2+.25*B3+.25*B4)+.5*red_c;

% rgb = [red green blue];
end
