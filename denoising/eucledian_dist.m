%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [sum] = eucledian_dist(image,i,j,k,l,n1,n2,a)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

sum = 0;

for c = n1-1:n1+1
    for d = n2-1:n2+1
        disp(i);
        disp(j);
        disp(k);
        disp(l);
        sum = sum + Gaussian_dist(c,d,a) * (power((image(i+c,j+d)-image(k+c+1,l+d+1)),2));
    end
end

end

