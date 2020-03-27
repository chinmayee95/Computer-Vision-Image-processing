%EE 569 HW 4
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%--------------------------------------
%Problem :  Texture Analysis
%Implementation: Texture Classification
%M-file name: enegry_avg.m
%---------------------------------------


function [average_energy]=enegry_avg(texture_filtered)

average_energy_sum=0;
for i=1:128
    for j=1:128
        average_energy_sum=average_energy_sum+abs(texture_filtered(i,j));  %value -> absolute
    end
end
average_energy=(1/((128)*(128))).*average_energy_sum;
