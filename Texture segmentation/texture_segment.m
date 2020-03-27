clear all;
clc;

comp=readraw('comp.raw');

row = 450;
col = 600;

k=1;
for i=1:row
    for j=1:col
        comp_texture(i,j) = comp(k);
        k = k + 1;
    end
end

%Laws filter size
filter_size = 5; 
texture_laws_filtered = Laws_filter_comp(filter_size,comp_texture);

%energy window size
window_size = 35; 
energy_out = energy_per_pixel_25D(window_size,texture_laws_filtered);
energy_15D = energy_per_pixel_15D(energy_out);

cnt = 1;
texture_data = zeros(600*450,15);
% for k=1:15
%         energy_normalized=energy_15D./energy_15D(:,:,1);          
%         egy = conv1D(energy_normalized,row,col);
%         texture_data(cnt:cnt+egy(2),:) = egy(1);
%         cnt=cnt+egy(2); 
% end

for i=1:row
    for j=1:col
        energy_15 = [energy_15D(i,j,1) energy_15D(i,j,2) energy_15D(i,j,3) energy_15D(i,j,4) energy_15D(i,j,5) energy_15D(i,j,6) energy_15D(i,j,7) energy_15D(i,j,8) energy_15D(i,j,9) energy_15D(i,j,10) energy_15D(i,j,11) energy_15D(i,j,12) energy_15D(i,j,13) energy_15D(i,j,14) energy_15D(i,j,15)];
        energy_normalized=energy_15./energy_15D(i,j,1);  
        texture_data(cnt,:) = energy_normalized;
        cnt=cnt+1; 
    end
end

[label_index]=kmeans(texture_data,6);
i=1;
j=1;
label=zeros(450,600);
for k=1:(600*450)
    
    label(i,j)=label_index(k,1);
    j=j+1;
    
    if(mod(k,600)==0)%|mod(k,450)==0)
        i=i+1;
        j=1;
    end
        
end

for i=1:row
    for j=1:col
        if(label(i,j)==1)
            segmented(i,j)=0;
        elseif(label(i,j)==2)
            segemented(i,j)=51;
        elseif(label(i,j)==3)
            segmented(i,j)=102;
        elseif(label(i,j)==4)
            segmented(i,j)=153;
        elseif(label(i,j)==5)
            segmented(i,j)=204;
        elseif(label(i,j)==6)
            segmented(i,j)=255;
        end
    end
end

figure(1)
imshow(uint8(segmented));
title('Segmented image with window size = 35');

%Computing PCA

[c s]=pca(texture_data,'NumComponents',6);
texture_data_reduced=s*c';
[label_index_PCA]=kmeans(texture_data_reduced,6);

i=1;
j=1;
label_reduced=zeros(row,col);
for k=1:(row*col)
    
    label_reduced(i,j)=label_index(k,1);
    j=j+1;
    
    if(mod(k,col)==0)%|mod(k,col)==0)
        i=i+1;
        j=1;
    end
        
end

for i=1:row
    for j=1:col
        if(label_reduced(i,j)==1)
            segmented_reduced(i,j)=0;
        elseif(label_reduced(i,j)==2)
            segmented_reduced(i,j)=51;
        elseif(label_reduced(i,j)==3)
            segmented_reduced(i,j)=102;
        elseif(label_reduced(i,j)==4)
            segmented_reduced(i,j)=153;
        elseif(label_reduced(i,j)==5)
            segmented_reduced(i,j)=204;
        elseif(label_reduced(i,j)==6)
            segmented_reduced(i,j)=255;
        end
    end
end

figure(2)
imshow(uint8(segmented_reduced));
title('Segmented image with window size = 35 after PCA with number of principal components = 6');