function [texture_laws_filtered] = Laws_filter_comp(N,texture_comp)

[row col] = size(texture_comp);

texture_comp_mean_subtracted = texture_comp - (1/(row*col)) * sum(sum(texture_comp));

texture_comp_padded = zeros(row+(N-1),col+(N-1));

texture_comp_padded(1+(N-1)/2:row+(N-1)/2,1+(N-1)/2:col+(N-1)/2) = texture_comp_mean_subtracted;
   

%boundary reflection
for i=0:((N-1)/2)-1
    texture_comp_padded(:,((N-1)/2)-i) = texture_comp_padded(:,((N-1)/2)+i+2);
    texture_comp_padded(:,col+((N-1)/2)+i+1) = texture_comp_padded(:,col+((N-1)/2)-i-1);
    texture_comp_padded(((N-1)/2)-i,:) = texture_comp_padded(((N-1)/2)+i+2,:);
    texture_comp_padded((row+(N-1)/2)+i+1,:) = texture_comp_padded((row+(N-1)/2)-i-1,:);
end

%LAWS FILTERS
Level_filter=[1 4 6 4 1];
Edge_filter=[-1 -2 0 2 1];
Spot_filter=[-1 0 2 0 -1];
Wave_filter=[-1 2 0 -2 1];
Ripple_filter=[1 -4 6 -4 1];

%tensor products
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

%FILTERING
for i = 1+(N-1)/2:row+(N-1)/2
    for j = 1+(N-1)/2:col+(N-1)/2
        neighbour_window = texture_comp_padded((i-(N-1)/2:i+(N-1)/2),(j-(N-1)/2:j+(N-1)/2));
        
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,1) =  sum(sum(neighbour_window.*LL));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,2) =  sum(sum(neighbour_window.*LE));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,3) =  sum(sum(neighbour_window.*LS));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,4) =  sum(sum(neighbour_window.*LW));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,5) =  sum(sum(neighbour_window.*LR));
                
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,6) =  sum(sum(neighbour_window.*EL));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,7) =  sum(sum(neighbour_window.*EE));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,8) =  sum(sum(neighbour_window.*ES));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,9) =  sum(sum(neighbour_window.*EW));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,10) =  sum(sum(neighbour_window.*ER));
                
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,11) =  sum(sum(neighbour_window.*SL));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,12) =  sum(sum(neighbour_window.*SE));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,13) =  sum(sum(neighbour_window.*SS));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,14) =  sum(sum(neighbour_window.*SW));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,15) =  sum(sum(neighbour_window.*SR));
                
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,16) =  sum(sum(neighbour_window.*WL));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,17) =  sum(sum(neighbour_window.*WE));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,18) =  sum(sum(neighbour_window.*WS));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,19) =  sum(sum(neighbour_window.*WW));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,20) =  sum(sum(neighbour_window.*WR));
                
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,21) =  sum(sum(neighbour_window.*RL));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,22) =  sum(sum(neighbour_window.*RE));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,23) =  sum(sum(neighbour_window.*RS));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,24) =  sum(sum(neighbour_window.*RW));
                texture_laws_filtered(i-(N-1)/2,j-(N-1)/2,25) =  sum(sum(neighbour_window.*RR));
                
  end
end

end