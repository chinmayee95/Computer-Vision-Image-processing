function [energy_out] = energy_comp(texture_comp_filtered_padded,N,row,col)

for k=1:25
    for i=1+(N-1)/2:row+(N-1)/2
        for j=1+(N-1)/2:col+(N-1)/2
            neighbour_window=texture_comp_filtered_padded(i-(N-1)/2:i+(N-1)/2,j-(N-1)/2:j+(N-1)/2,k);
            energy=(1/(N*N))*sum(sum(abs(neighbour_window)));
            energy_out(i-(N-1)/2,j-(N-1)/2,k)=energy;
%             disp(k);
%             disp(energy_out);
        end
    end
%     figure(k+2)
%     imshow(energy_out(:,:,k));
end   
end

