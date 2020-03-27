%EE 569 Homework Assignment#3
%Date: 03/03/2020
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem :  Morphological Processing
%Implementation: Shrinking
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;

image_raw=readraw('fan.raw');

% col = 315;
% row = 356;
col = 558;
row = 558;

k=1;
for i=1:row
    for j=1:col
        image(i,j) = image_raw(k);
        k=k+1;
    end
end

figure(1);
imshow(uint8(image));
k=1;
for i=1:row
    for j=1:col
        image(i,j) = image_raw(k);
        if image(i,j) <128
            image_normalized(i,j) = 0;
        else
            image_normalized(i,j) = 1;
        end
        k=k+1;
    end
end
N=3;

img_copied = image_normalized;
shrinked_out=zeros(row,col);

num_iterations = 800;

Shrink_1_1=[0 0 1 0 1 0 0 0 0];
Shrink_1_2=[1 0 0 0 1 0 0 0 0];
Shrink_1_3=[0 0 0 0 1 0 1 0 0];
Shrink_1_4=[0 0 0 0 1 0 0 0 1];

Shrink_2_1=[0 0 0 0 1 1 0 0 0];
Shrink_2_2=[0 1 0 0 1 0 0 0 0];
Shrink_2_3=[0 0 0 1 1 0 0 0 0];
Shrink_2_4=[0 0 0 1 0 0 0 0 1];

Shrink_3_1=[0 0 1 0 1 1 0 0 0];
Shrink_3_2=[0 1 1 0 1 0 0 0 0];
Shrink_3_3=[1 1 0 0 1 0 0 0 0];
Shrink_3_4=[1 0 0 1 1 0 0 0 0];
Shrink_3_5=[0 0 0 1 1 0 1 0 0];
Shrink_3_6=[0 0 0 0 1 0 1 1 0];
Shrink_3_7=[0 0 0 0 1 0 0 1 1];
Shrink_3_8=[0 0 0 0 1 1 0 0 1];

Thin_Skeletonize_1=[0 1 0 0 1 1 0 0 0];
Thin_Skeletonize_2=[0 1 0 1 1 0 0 0 0];
Thin_Skeletonize_3=[0 0 0 1 1 0 0 1 0];
Thin_Skeletonize_4=[0 0 0 0 1 1 0 1 0];

Shrink_Thin_Skeletonize_1_1=[0 0 1 0 1 1 0 0 1];
Shrink_Thin_Skeletonize_1_2=[1 1 1 0 1 0 0 0 0];
Shrink_Thin_Skeletonize_1_3=[1 0 0 1 1 0 1 0 0];
Shrink_Thin_Skeletonize_1_4=[0 0 0 0 1 0 1 1 1];

Shrink_Thin_1_1=[1 1 0 0 1 1 0 0 0];
Shrink_Thin_1_2=[0 1 0 0 1 1 0 0 1];
Shrink_Thin_1_3=[0 1 1 1 1 0 0 0 0];
Shrink_Thin_1_4=[0 0 1 0 1 1 0 1 0];

Shrink_Thin_2_1=[0 1 1 0 1 1 0 0 0];
Shrink_Thin_2_2=[1 1 0 1 1 0 0 0 0];
Shrink_Thin_2_3=[0 0 0 1 1 0 1 1 0];
Shrink_Thin_2_4=[0 0 0 0 1 1 0 1 1];

Shrink_Thin_3_1=[1 1 0 0 1 1 0 0 1];
Shrink_Thin_3_2=[0 1 1 1 1 0 1 0 0];

Shrink_Thin_Skeletonize_2_1=[1 1 1 0 1 1 0 0 0];
Shrink_Thin_Skeletonize_2_2=[0 1 1 0 1 1 0 0 0];
Shrink_Thin_Skeletonize_2_3=[1 1 1 1 1 0 0 0 0];
Shrink_Thin_Skeletonize_2_4=[1 1 0 1 1 0 1 0 0];
Shrink_Thin_Skeletonize_2_5=[1 0 0 1 1 0 1 1 0];
Shrink_Thin_Skeletonize_2_6=[0 0 0 1 1 0 1 1 1];
Shrink_Thin_Skeletonize_2_7=[0 0 0 0 1 1 1 1 1];
Shrink_Thin_Skeletonize_2_8=[0 0 1 0 1 1 0 1 1];

Shrink_Thin_Skeletonize_3_1=[1 1 1 0 1 1 0 0 1];
Shrink_Thin_Skeletonize_3_2=[1 1 1 1 1 0 1 0 0];
Shrink_Thin_Skeletonize_3_3=[1 0 0 1 1 0 1 1 1];
Shrink_Thin_Skeletonize_3_4=[0 0 1 0 1 1 1 1 1];

Shrink_Thin_Skeletonize_4_1=[0 1 1 0 1 1 0 1 1];
Shrink_Thin_Skeletonize_4_2=[1 1 1 1 1 1 0 0 0];
Shrink_Thin_Skeletonize_4_3=[1 1 0 1 1 0 1 1 0];
Shrink_Thin_Skeletonize_4_4=[0 0 0 1 1 1 1 1 1];

Shrink_Thin_Skeletonize_5_1=[1 1 1 0 1 1 0 1 1];
Shrink_Thin_Skeletonize_5_2=[0 1 1 0 1 1 1 1 1];
Shrink_Thin_Skeletonize_5_3=[1 1 1 1 1 1 1 0 0];
Shrink_Thin_Skeletonize_5_4=[1 1 1 1 1 1 0 0 1];
Shrink_Thin_Skeletonize_5_5=[1 1 1 1 1 0 1 1 0];
Shrink_Thin_Skeletonize_5_6=[1 1 0 1 1 0 1 1 1];
Shrink_Thin_Skeletonize_5_7=[1 0 0 1 1 1 1 1 1];
Shrink_Thin_Skeletonize_5_8=[0 0 1 1 1 1 1 1 1];

Shrink_Thin_Skeletonize_6_1=[1 1 1 0 1 1 1 1 1];
Shrink_Thin_Skeletonize_6_2=[1 1 1 1 1 1 1 0 1];
Shrink_Thin_Skeletonize_6_3=[1 1 1 1 1 0 1 1 1];
Shrink_Thin_Skeletonize_6_4=[1 0 1 1 1 1 1 1 1];

Skeletonize_1=[1 1 1 1 1 1 0 1 1];
Skeletonize_2=[1 1 1 1 1 1 1 1 0];
Skeletonize_3=[1 1 0 1 1 1 1 1 1];
Skeletonize_4=[0 1 1 1 1 1 1 1 1];

f=1;
%
for no_of_iterations = 1:num_iterations
% while f
    img_copied_padded=zeros(row+N-1,col+N-1); %normalized values are padded
    
    img_copied_padded((N-1):row+N-2,(N-1):col+N-2)= img_copied;
    
    for i=0:((N-1)/2)-1
        img_copied_padded(:,((N-1)/2)-i)=img_copied_padded(:,((N-1)/2)+i+1);
        img_copied_padded(:,col+((N-1)/2)+i+1)=img_copied_padded(:,col+((N-1)/2)-i);
        img_copied_padded(((N-1)/2)-i,:)=img_copied_padded(((N-1)/2)+i+1,:);
        img_copied_padded((row+(N-1)/2)+i+1,:)=img_copied_padded((row+(N-1)/2)-i,:);
    end
    
    Mark_array = zeros(row,col);
    Uncond_mark_array=zeros(row,col);
    
    %calculating bond values
    for i=1+(N-1)/2:row+(N-1)/2
        for j=1+(N-1)/2:col+(N-1)/2
            
            four_connected = (img_copied_padded(i,j-1)+img_copied_padded(i,j+1)+img_copied_padded(i-1,j)+img_copied_padded(i+1,j));
            eight_connected = (img_copied_padded(i-1,j-1)+img_copied_padded(i-1,j+1)+img_copied_padded(i+1,j-1)+img_copied_padded(i+1,j+1));
            bond_value = 2 * four_connected + eight_connected;
            neighbouring_pixels = img_copied_padded(i-(N-1)/2:i+(N-1)/2,j-(N-1)/2:j+(N-1)/2);
            neighbouring_pixels_1D=[neighbouring_pixels(1,1) neighbouring_pixels(1,2) neighbouring_pixels(1,3) neighbouring_pixels(2,1) neighbouring_pixels(2,2) neighbouring_pixels(2,3) neighbouring_pixels(3,1) neighbouring_pixels(3,2) neighbouring_pixels(3,3)];
            
            if (img_copied_padded(i,j)==1)
                
                switch bond_value
                    case 1
                        if(isequal(Shrink_1_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_1_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_1_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_1_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 2
                        if(isequal(Shrink_2_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_2_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_2_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_2_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 3
                        if(isequal(Shrink_3_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_5,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_6,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_7,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_3_8,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 4
                        
                        if(isequal(Shrink_Thin_Skeletonize_1_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_1_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_1_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_1_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 5
                        if(isequal(Shrink_Thin_1_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_1_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_1_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_1_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_2_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_2_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_2_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_2_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 6
                        if(isequal(Shrink_Thin_3_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_3_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_5,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_6,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_7,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_2_8,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 7
                        if(isequal(Shrink_Thin_Skeletonize_3_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_3_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_3_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_3_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 8
                        if(isequal(Shrink_Thin_Skeletonize_4_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_4_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_4_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_4_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 9
                        if(isequal(Shrink_Thin_Skeletonize_5_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_5,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_6,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_7,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_5_8,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                    case 10
                        if(isequal(Shrink_Thin_Skeletonize_6_1,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_6_2,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_6_3,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        elseif(isequal(Shrink_Thin_Skeletonize_6_4,neighbouring_pixels_1D))
                            Mark_array(i-(N-1)/2,j-(N-1)/2)=1;
                        end
                        
                        
                end
            end
        end
    end
    
    %Unconditional masks
    
    Mark_array_padded=zeros(row+N-1,col+N-1);
    Mark_array_padded(N-1:row+(N-1)/2,N-1:col+(N-1)/2) = Mark_array;
    
    for i=0:((N-1)/2)-1
        Mark_array_padded(:,((N-1)/2)-i)=Mark_array_padded(:,((N-1)/2)+i+1);
        Mark_array_padded(:,col+((N-1)/2)+i+1)=Mark_array_padded(:,col+((N-1)/2)-i);
        Mark_array_padded(((N-1)/2)-i,:)=Mark_array_padded(((N-1)/2)+i+1,:);
        Mark_array_padded((row+(N-1)/2)+i+1,:)=Mark_array_padded((row+(N-1)/2)-i,:);
    end
    
    for i=1+(N-1)/2:row+(N-1)/2
        for j=1+(N-1)/2:col+(N-1)/2
            
            Mark_array_neighbour_pixels=Mark_array_padded(i-(N-1)/2:i+(N-1)/2,j-(N-1)/2:j+(N-1)/2);
            
            %Spur
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,3) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,1) && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %Single 4-connection
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %L Cluster
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0  && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,2) && Mark_array_neighbour_pixels(1,1)==0  && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,2) && Mark_array_neighbour_pixels(1,3)==0  && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(1,3)==0  && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1)  && Mark_array_neighbour_pixels(1,1)==0  && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2)  && Mark_array_neighbour_pixels(1,1)==0  && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2)  && Mark_array_neighbour_pixels(1,1)==0  && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if (Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3)  && Mark_array_neighbour_pixels(1,1)==0  && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %4 Connected offset
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(1,3)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(1,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,3) && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,3)==0 && Mark_array_neighbour_pixels(1,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %Spur corner cluster
            
            if(Mark_array_neighbour_pixels(1,3)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && (Mark_array_neighbour_pixels(1,2)| Mark_array_neighbour_pixels(2,3))==1 && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,3)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && (Mark_array_neighbour_pixels(2,1)| Mark_array_neighbour_pixels(3,2))==1 && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && (Mark_array_neighbour_pixels(2,1)| Mark_array_neighbour_pixels(1,2))==1 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,2)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && (Mark_array_neighbour_pixels(2,3)| Mark_array_neighbour_pixels(3,2))==1 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(2,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %Corner cluster
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,1)==Mark_array_neighbour_pixels(2,2))
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            
            %Tee Branch
            
            if(Mark_array_neighbour_pixels(2,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,2) && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(2,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,2) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(3,2)==0 && Mark_array_neighbour_pixels(3,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(2,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(3,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(2,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(1,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,1)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %Vee Branch
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(1,3) && (Mark_array_neighbour_pixels(3,1) | Mark_array_neighbour_pixels(3,2) | Mark_array_neighbour_pixels(3,3))==1)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && (Mark_array_neighbour_pixels(1,3) | Mark_array_neighbour_pixels(2,3) | Mark_array_neighbour_pixels(3,3))==1)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(3,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && (Mark_array_neighbour_pixels(1,1) | Mark_array_neighbour_pixels(1,2) | Mark_array_neighbour_pixels(1,3))==1)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,3)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && (Mark_array_neighbour_pixels(1,1) | Mark_array_neighbour_pixels(2,1) | Mark_array_neighbour_pixels(3,1))==1)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            %Diagonal branch
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,1) && Mark_array_neighbour_pixels(1,3)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,2)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,2)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,3) && Mark_array_neighbour_pixels(1,1)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,2)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,3)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,1) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,3)==0 && Mark_array_neighbour_pixels(3,1)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
            if(Mark_array_neighbour_pixels(1,1)==Mark_array_neighbour_pixels(2,2) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(2,3) && Mark_array_neighbour_pixels(2,2)==Mark_array_neighbour_pixels(3,2) && Mark_array_neighbour_pixels(1,2)==0 && Mark_array_neighbour_pixels(2,1)==0 && Mark_array_neighbour_pixels(3,3)==0)
                Uncond_mark_array(i-(N-1)/2,j-(N-1)/2)=1;
            end
            
        end
    end
    
    for i=1:row
        for j=1:col
            shrinked_out(i,j)=img_copied(i,j) & (~Mark_array(i,j) | Uncond_mark_array(i,j));
        end
    end
    
%     if(img_copied==shrinked_out)
%         f=0;
%     else
%         f=1;
%     end
    
    img_copied=shrinked_out;
    
end

figure(2);
imshow(uint8(shrinked_out.*255));
title('Image obtained after Shrinking');