%EE 569 HW 4
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%--------------------------------------
%Problem :  Texture Analysis
%Implementation: Texture Classification
%M-file name: Laws_filter.m
%---------------------------------------


function [energy15] = Laws_filter(N,texture_mean_removed)

Level_filter=[1 4 6 4 1];
Edge_filter=[-1 -2 0 2 1];
Spot_filter=[-1 0 2 0 -1];
Wave_filter=[-1 2 0 -2 1];
Ripple_filter=[1 -4 6 -4 1];

LL=Level_filter'*Level_filter;
LE=Level_filter'*Edge_filter;
LS=Level_filter'*Spot_filter;
LW=Level_filter'*Wave_filter;
LR=Level_filter'*Ripple_filter;

EL=Edge_filter'*Level_filter;
EE=Edge_filter'*Edge_filter;
ES=Edge_filter'*Spot_filter;
EW=Edge_filter'*Wave_filter;
ER=Edge_filter'*Ripple_filter;

SL=Spot_filter'*Level_filter;
SE=Spot_filter'*Edge_filter;
SS=Spot_filter'*Spot_filter;
SW=Spot_filter'*Wave_filter;
SR=Spot_filter'*Ripple_filter;

WL=Wave_filter'*Level_filter;
WE=Wave_filter'*Edge_filter;
WS=Wave_filter'*Spot_filter;
WW=Wave_filter'*Wave_filter;
WR=Wave_filter'*Ripple_filter;

RL=Ripple_filter'*Level_filter;
RE=Ripple_filter'*Edge_filter;
RS=Ripple_filter'*Spot_filter;
RW=Ripple_filter'*Wave_filter;
RR=Ripple_filter'*Ripple_filter;

for i=1+(N-1)/2:128+(N-1)/2
    for j=1+(N-1)/2:128+(N-1)/2
        neighbour_window=texture_mean_removed((i-(N-1)/2:i+(N-1)/2),(j-(N-1)/2:j+(N-1)/2));
       
                texture_filtered1(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*LL));
                texture_filtered2(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*LE));
                texture_filtered3(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*LS));
                texture_filtered4(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*LW));
                texture_filtered5(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*LR));
                
                texture_filtered6(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*EL));
                texture_filtered7(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*EE));
                texture_filtered8(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*ES));
                texture_filtered9(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*EW));
                texture_filtered10(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*ER));
                
                texture_filtered11(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*SL));
                texture_filtered12(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*SE));
                texture_filtered13(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*SS));
                texture_filtered14(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*SW));
                texture_filtered15(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*SR));
                
                texture_filtered16(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*WL));
                texture_filtered17(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*WE));
                texture_filtered18(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*WS));
                texture_filtered19(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*WW));
                texture_filtered20(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*WR));
                
                texture_filtered21(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*RL));
                texture_filtered22(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*RE));
                texture_filtered23(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*RS));
                texture_filtered24(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*RW));
                texture_filtered25(i-(N-1)/2,j-(N-1)/2)=sum(sum(neighbour_window.*RR));
                
            end
        end
   
energy1=energy_avg(texture_filtered1);
energy2=energy_avg(texture_filtered2);
energy3=energy_avg(texture_filtered3);
energy4=energy_avg(texture_filtered4);
energy5=energy_avg(texture_filtered5);

energy6=energy_avg(texture_filtered6);
energy7=energy_avg(texture_filtered7);
energy8=energy_avg(texture_filtered8);
energy9=energy_avg(texture_filtered9);
energy10=energy_avg(texture_filtered10);

energy11=energy_avg(texture_filtered11);
energy12=energy_avg(texture_filtered12);
energy13=energy_avg(texture_filtered13);
energy14=energy_avg(texture_filtered14);
energy15=energy_avg(texture_filtered15);

energy16=energy_avg(texture_filtered16);
energy17=energy_avg(texture_filtered17);
energy18=energy_avg(texture_filtered18);
energy19=energy_avg(texture_filtered19);
energy20=energy_avg(texture_filtered20);

energy21=energy_avg(texture_filtered21);
energy22=energy_avg(texture_filtered22);
energy23=energy_avg(texture_filtered23);
energy24=energy_avg(texture_filtered24);
energy25=energy_avg(texture_filtered25);

energy=[energy1 energy2 energy3 energy4 energy5 energy6 energy7 energy8 energy9 energy10 energy11 energy12 energy13 energy14 energy15 energy16 energy17 energy18 energy19 energy20 energy21 energy22 energy23 energy24 energy25];


%15 fenergyaturenergy venergyctors

energy15(1) = energy(1);
%Lenergy energyL
energy15(2) = .5*energy(2) + .5*energy(6);
%LS SL
energy15(3) = .5*energy(3) + .5*energy(11);
%LW WL
energy15(4) = .5*energy(4) + .5*energy(16);
%LR RL
energy15(5) = .5*energy(5) + .5*energy(21);
%energyenergy
energy15(6) = energy(7);
%energyS Senergy
energy15(7) = .5*energy(8) + .5*energy(12);
%energyW Wenergy
energy15(8) = .5*energy(9) + .5*energy(17);
%energyR Renergy
energy15(9) = .5*energy(10) + .5*energy(22);
%SS
energy15(10) = energy(13);
%SW WS
energy15(11) = .5*energy(14) + .5*energy(18);
%SR RS
energy15(12) = .5*energy(15) + .5*energy(23);
%WW
energy15(13) = energy(19);
%WR RW
energy15(14) = .5*energy(20) + .5*energy(24);
%RR
energy15(15) = energy(25);

end       
