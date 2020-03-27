%EE 569 Homework Assignment#3
%Date: 03/03/2020
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem :  Morphological Processing
%Implementation: Counting Stars
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

I = readraw('stars.raw');
row = 640;
col = 480;

k=1;
for i=1:col
    for j=1:row
        BW(i,j) = I(k);
        k=k+1;
    end
end
imshow(BW);
%inverse - black pixels to white and viceversa
for i=1:col
    for j=1:row
        if BW(i,j)<128
            BW(i,j) = 0;
        else
            BW(i,j) = 255;
        end
    end
end

BW3 = bwmorph(BW,'shrink',10);
% 
for i=1:col
    for j=1:row
        if BW3(i,j)==1
            BW3(i,j) = 255;
        elseif BW3(i,j)==0
            BW3(i,j) = 0;
        end
    end
end

cntr = 0;
for i=1:col
    for j=1:row
        if(BW3(i,j)==1)
            cntr = cntr+1;
        end
    end
end
% 
writeraw(BW3,'problemc.raw');
figure
imshow((BW3))