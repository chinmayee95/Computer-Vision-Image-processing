%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [sum] = mean_filter(image,i,j)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
% ii = 1;
% jj = 1;
cnt = 0;
for ii = i-1:i+1
    for jj = j-1:j+1
        cnt = cnt + image(ii,jj);
    end
end
sum = cnt/9.0;            

end

