%EE 569 Homework Assignment#3
%Date: 03/03/2020
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem :  Morphological Processing
%Implementation: PCB path finding
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
I = readraw('PCB.raw');

% 239x372
row = 372;
col = 239;

k=1;
for i=1:col
    for j=1:row
        BW(i,j) = I(k);
        k=k+1;
    end
end

%binary image
for i=1:col
    for j=1:row
        if BW(i,j)<128
            BW(i,j) = 0;
        else
            BW(i,j) = 1;
        end
    end
end

%remove the black boundary by resizing the image
imshow(bwmorph(~BW(4:239-4,4:372-4),'shrink',Inf));
lines = bwmorph(~BW(4:239-4,4:372-4),'shrink',Inf);
writeraw(lines,'pcb_paths.raw');
image = lines;
[row col] = size(image);

rows = row+2;
cols = col+2;

image_pad = zeros(rows,cols);
image_pad(2:row+1,2:col+1) = image;

label_matrix = zeros(rows,cols);

label = 0;

%first iterartion
for i=2:rows-1
    for j=2:cols-1
        current_pixel = image_pad(i,j);
        
        neighbour1 = image_pad(i,j-1);
        neighbour2 = image_pad(i-1,j-1);
        neighbour3 = image_pad(i-1,j);
        neighbour4 = image_pad(i-1,j+1);
        
        neighbour1_label = label_matrix(i,j-1);
        neighbour2_label = label_matrix(i-1,j-1);
        neighbour3_label = label_matrix(i-1,j);
        neighbour4_label = label_matrix(i-1,j+1);
        
        if current_pixel~=0
            label_neigbours = [label_matrix(i,j)  ,label_matrix(i-1,j) ,label_matrix(i-1,j+1) ,label_matrix(i,j-1) ,label_matrix(i-1,j-1)];
                label_new = min(label_neigbours(label_neigbours>0));
            if ~(neighbour1_label|neighbour2_label|neighbour3_label|neighbour4_label)
                label = label + 1;
                label_matrix(i,j) = label;
                
            elseif (neighbour1_label)
                label_matrix(i,j) = label_new;
                flag = 1;
            elseif neighbour2_label
                label_matrix(i,j) = label_new;
            elseif neighbour3_label
                label_matrix(i,j) = label_new;
            elseif neighbour4_label
                label_matrix(i,j) = label_new;
%                 disp(label_matrix(i,j))
%                 disp(j)
            end
%             if flag
%                 if (neighbour1_label~=neighbour2_label)
%                     label_freq_matrix(neighbour1_label,neighbour2_label) = neighbour2_label;
%                 end
%                 if ((neighbour1_label~=neighbour3_label)&&(~neighbour2_label))
%                     label_freq_matrix(neighbour1_label,neighbour3_label) = neighbour3_label;
%                 end
%             end
        end
    end
end

 for i=2:rows-1
        for j=2:cols-1
            if(label_matrix(i,j) ~= 0) 
                label_neigbours = [label_matrix(i,j) ,label_matrix(i+1,j+1) ,label_matrix(i-1,j) ,label_matrix(i-1,j+1) ,label_matrix(i,j-1) ,label_matrix(i,j+1) ,label_matrix(i+1,j-1) ,label_matrix(i+1,j) ,label_matrix(i-1,j-1)];
                label_new = min(label_neigbours(label_neigbours>0));
%                 disp(label_new)
                if(label_matrix(i+1,j+1) ~= 0) 
                    label_matrix(i+1,j+1) = label_new;
                end
                if(label_matrix(i-1,j) ~= 0) 
                    label_matrix(i-1,j) = label_new;
                end
                if(label_matrix(i-1,j+1) ~= 0) 
                    label_matrix(i-1,j+1) = label_new;
                end
                if(label_matrix(i,j-1) ~= 0) 
                    label_matrix(i,j-1) = label_new;
                end
                if(label_matrix(i,j+1) ~= 0) 
                    label_matrix(i,j+1) = label_new;
                end
                if(label_matrix(i+1,j-1) ~= 0)
                    label_matrix(i+1,j-1) = label_new;
                end
                if(label_matrix(i+1,j) ~= 0) 
                    label_matrix(i+1,j) = label_new;
                end
                if(label_matrix(i-1,j-1) ~= 0) 
                    label_matrix(i-1,j-1) = label_new;
                end
            end
        end
 end
 
           
label_matrix = label_matrix(2:rows-1,2:cols-1);

label_freq_matrix = zeros(max(max(label_matrix)),2);
for i=1:max(max(label_matrix))
    label_freq_matrix(i,1) = i;
end
for i=1:row
    for j=1:col
        if(label_matrix(i,j) ~=0)
            if(label_freq_matrix(label_matrix(i,j),2))
                label_freq_matrix(label_matrix(i,j),2) = label_freq_matrix(label_matrix(i,j),2) + 1;
            else
                label_freq_matrix(label_matrix(i,j),2) = 1;
            end
        end
    end
end

len=0;
for i=1:length(label_freq_matrix)

    if label_freq_matrix(i,2)~=0
        len = len + 1;
        freq_label(len,2) = label_freq_matrix(i,2);
%     else 
%         label_freq_matrix(i,:) = [];
    end
    
end

cnt=0;

freq_label = zeros(len,2);
for i=1:len
    freq_label(i,1) = i;
end
for i=1:length(label_freq_matrix)

    if label_freq_matrix(i,2)~=0 && label_freq_matrix(i,2)>46
        cnt = cnt + 1;
        freq_label(cnt,2) = label_freq_matrix(i,2);
%     else 
%         label_freq_matrix(i,:) = [];
    end
    
end
i=1;
path=0;
while freq_label(i,2)
    i=i+1;
    path=path+1;
end
disp('Total number of path ways:');
disp(path);
   