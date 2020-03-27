function [feature_vector_row]=laws_filtering(N, texture_image)

texture_image_sum=0;

row = 128;
col = 128;

%sum of the pixels
for i=1:row
    for j=1:col
        texture_image_sum=texture_image_sum+texture_image(i,j);
    end
end

%mean of the image
texture_image_mean=(1/((row)*(col))).*texture_image_sum;
texture_image_mean_removed=texture_image-texture_image_mean;

%padding
texture_image_padded=zeros(row+(N-1),col+(N-1));

%image centering
for i=1:row          
    for j=1:col
        texture_image_padded(i+(N-1)/2,j+(N-1)/2)=texture_image_mean_removed(i,j);
    end
end

%boundary extension
for i=0:((N-1)/2)-1
    texture_image_padded(:,((N-1)/2)-i)=texture_image_padded(:,((N-1)/2)+i+2);
    texture_image_padded(:,col+((N-1)/2)+i+1)=texture_image_padded(:,col+((N-1)/2)-i-1);
    texture_image_padded(((N-1)/2)-i,:)=texture_image_padded(((N-1)/2)+i+2,:);
    texture_image_padded((row+(N-1)/2)+i+1,:)=texture_image_padded((row+(N-1)/2)-i-1,:);
end

%laws filtering
feature_vector_row=Laws_filter(N,texture_image_padded);
end