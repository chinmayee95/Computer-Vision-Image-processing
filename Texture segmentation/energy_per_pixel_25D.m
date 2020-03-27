function [energy_out]=energy_per_pixel_25D(N,texture_comp_filtered)

% [row col] = size(texture_comp_filtered);
row = 450;
col = 600;
texture_comp_filtered_padded=zeros(row+(N-1)/2,col+(N-1)/2,25);

texture_comp_filtered_padded(1+(N-1)/2:row+(N-1)/2,1+(N-1)/2:col+(N-1)/2,:)=texture_comp_filtered;


%boundary reflection

for i=0:((N-1)/2)-1
    texture_comp_filtered_padded(:,((N-1)/2)-i,1:25)=texture_comp_filtered_padded(:,((N-1)/2)+i+2,1:25);
    texture_comp_filtered_padded(:,col+((N-1)/2)+i+1,1:25)=texture_comp_filtered_padded(:,col+((N-1)/2)-i-1,1:25);
    texture_comp_filtered_padded(((N-1)/2)-i,:,1:25)=texture_comp_filtered_padded(((N-1)/2)+i+2,:,1:25);
    texture_comp_filtered_padded((row+(N-1)/2)+i+1,:,1:25)=texture_comp_filtered_padded((row+(N-1)/2)-i-1,:,1:25);
end

energy_out = energy_comp(texture_comp_filtered_padded,N,row,col);


% % for k=1:25
% energy_out_1 = energy_comp(texture_comp_filtered_padded,N,row,col,1);
% energy_out_2 = energy_comp(texture_comp_filtered_padded,N,row,col,2);
% energy_out_3 = energy_comp(texture_comp_filtered_padded,N,row,col,3);
% energy_out_4 = energy_comp(texture_comp_filtered_padded,N,row,col,4);
% energy_out_5 = energy_comp(texture_comp_filtered_padded,N,row,col,5);
% energy_out_6 = energy_comp(texture_comp_filtered_padded,N,row,col,6);
% energy_out_7 = energy_comp(texture_comp_filtered_padded,N,row,col,7);
% energy_out_8 = energy_comp(texture_comp_filtered_padded,N,row,col,8);
% energy_out_9 = energy_comp(texture_comp_filtered_padded,N,row,col,9);
% energy_out_10 = energy_comp(texture_comp_filtered_padded,N,row,col,10);
% energy_out_11 = energy_comp(texture_comp_filtered_padded,N,row,col,11);
% energy_out_12 = energy_comp(texture_comp_filtered_padded,N,row,col,12);
% energy_out_13 = energy_comp(texture_comp_filtered_padded,N,row,col,13);
% energy_out_14 = energy_comp(texture_comp_filtered_padded,N,row,col,14);
% energy_out_15 = energy_comp(texture_comp_filtered_padded,N,row,col,15);
% energy_out_16 = energy_comp(texture_comp_filtered_padded,N,row,col,16);
% energy_out_17 = energy_comp(texture_comp_filtered_padded,N,row,col,17);
% energy_out_18 = energy_comp(texture_comp_filtered_padded,N,row,col,18);
% energy_out_19 = energy_comp(texture_comp_filtered_padded,N,row,col,19);
% energy_out_20 = energy_comp(texture_comp_filtered_padded,N,row,col,20);
% energy_out_21 = energy_comp(texture_comp_filtered_padded,N,row,col,21);
% energy_out_22 = energy_comp(texture_comp_filtered_padded,N,row,col,22);
% energy_out_23 = energy_comp(texture_comp_filtered_padded,N,row,col,23);
% energy_out_24 = energy_comp(texture_comp_filtered_padded,N,row,col,24);
% energy_out_25 = energy_comp(texture_comp_filtered_padded,N,row,col,25);
% 
% % end
% 
% energy_out = [energy_out_1 energy_out_2 energy_out_3 energy_out_4 energy_out_5 energy_out_6 energy_out_7 energy_out_8 energy_out_9 energy_out_10 energy_out_11 energy_out_12 energy_out_13 energy_out_14 energy_out_15 energy_out_16 energy_out_17 energy_out_18 energy_out_19 energy_out_20 energy_out_21 energy_out_22 energy_out_23 energy_out_24 energy_out_25];

end
            