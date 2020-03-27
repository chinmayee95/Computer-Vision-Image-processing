%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020


function [red,green,blue] = blue_mhc(image,row_index,col_index)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

i = row_index;
j = col_index;

blue = image(i,j);

blue_c = blue - (.25*image(i-2,j)+.25*image(i+2,j)+.25*image(i,j-2)+.25*image(i,j+2));

R1 = image(i-1,j-1);
R2 = image(i+1,j+1);
R3 = image(i-1,j+1);
R4 = image(i+1,j-1);
red = (.25*R1+.25*R2+.25*R3+.25*R4) + .75*blue_c;

G1 = image(i,j-1);
G2 = image(i,j+1);
G3 = image(i-1,j);
G4 = image(i+1,j);
green = (.25*G1+.25*G2+.25*G3+.25*G4) + .75*blue_c;


% rgb = [red green blue];
end
