%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

function [gauss] = gaussian(x,sigma)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
gauss = (1.0/(2*pi*(sigma*sigma)))*exp((-0.5*(x*x))/(sigma*sigma));
end

