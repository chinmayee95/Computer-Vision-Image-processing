%EE 569 Homework Assignment#3
%Date: 3/3/2020
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem :  Geometric modification 
%Implementation: Spatial Warping
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
image_raw=readraw('raccoon.raw');
row = 512;
col = 512;

k=1;
for i=1:row
    for j=1:col
        rimage(i,j) = image_raw(k);
        gimage(i,j) = image_raw(k+1);
        bimage(i,j) = image_raw(k+2);
        k = k + 3;
    end
end

original_image(:,:,1) = rimage;
original_image(:,:,2) = gimage;
original_image(:,:,3) = bimage;

rimageNew_to_disc = zeros(row);
gimageNew_to_disc = zeros(row);
bimageNew_to_disc = zeros(row);

%Converting image co-ordinates to cartesian co-ordinates

for i=1:row
    for j=1:col
%         [x,y] = square_disc_map(i,j);
            x = (i-256)/256.0;
            y = (j-256)/256.0;

            u=x*sqrt(1-((power(y,2))/2));
            v=y*sqrt(1-((power(x,2))/2));

            x_new = (u*256) + 256;
            y_new = (v*256) + 256;
            
            x=x_new;
            y=y_new;
        rimageNew_to_disc(round(x),round(y)) = rimage(i,j);
        gimageNew_to_disc(round(x),round(y)) = gimage(i,j);
        bimageNew_to_disc(round(x),round(y)) = bimage(i,j);
    end
end

image_warped(:,:,1) = rimageNew_to_disc;
image_warped(:,:,2) = gimageNew_to_disc;
image_warped(:,:,3) = bimageNew_to_disc;

k=1;
for i=1:row
    for j=1:col
        image_warped_raw(k) = rimageNew_to_disc(i,j);
        image_warped_raw(k+1) = gimageNew_to_disc(i,j);
        image_warped_raw(k+2) = bimageNew_to_disc(i,j);
        k = k + 3;
    end
end


writeraw(image_warped_raw,'warping_raccoon.raw');

imshow(uint8(image_warped));
title('Image obtained after warping');  

rimage_disc_toNew = zeros(row);
gimage_disc_toNew = zeros(row);
bimage_disc_toNew = zeros(row);


for i=1:row
    for j=1:col
        
        
        a = (i - 256.0) / 256.0; 
		b = (j - 256.0) / 256.0;
        u=a*sqrt(1-((power(b,2))/2));
        v=b*sqrt(1-((power(a,2))/2));
        if u==0 | v==0
            if u==0
                x=0;
            end
            if v==0
                y=0;
            end
        else
            x=.5*((sqrt((2+(power(u,2))-(power(v,2))+(2*(sqrt(2)*u)))))-(sqrt((2+(power(u,2))-(power(v,2))-(2*(sqrt(2)*u))))));
            y=.5*((sqrt((2-(power(u,2))+(power(v,2))+(2*(sqrt(2)*v)))))-(sqrt((2-(power(u,2))+(power(v,2))-(2*(sqrt(2)*v))))));
               
        end
        xnew = round((x * 256) + 256);
        ynew = round((y * 256) + 256);
        
%         [x,y] = disctosquare_map(i,j);
        xx = round(xnew);
        yy = round(ynew);
        rimage_disc_toNew(xx,yy) = rimage(i,j);
        gimage_disc_toNew(xx,yy) = gimage(i,j);
        bimage_disc_toNew(xx,yy) = bimage(i,j);
    end
end

image_reconstructed(:,:,1) = rimage_disc_toNew;
image_reconstructed(:,:,2) = gimage_disc_toNew;
image_reconstructed(:,:,3) = bimage_disc_toNew;

k=1;
for i=1:row
    for j=1:col
        image_reconstructed_raw(k) = rimage_disc_toNew(i,j);
        image_reconstructed_raw(k+1) = gimage_disc_toNew(i,j);
        image_reconstructed_raw(k+2) = bimage_disc_toNew(i,j);
        k = k + 3;
    end
end
image_interpolated = zeros(row,col,3);
image_interpolated(2:row+1,2:col+1,1:3) = image_reconstructed;
image_interpolated(1,:) = image_interpolated(2,:);
image_interpolated(row+2,:) = image_interpolated(row+1,:);
image_interpolated(:,1) = image_interpolated(:,2);
image_interpolated(:,col+2) = image_interpolated(:,col+1);

k=1;
for i=2:row-1
    for j=2:col-1
        image_interpolated(i,j,1) = .25*(image_interpolated(i,j,1) + image_interpolated(i,j+1,1) + image_interpolated(i+1,j,1) + image_interpolated(i-1,j,1));
        image_interpolated(i,j,2) = .25*(image_interpolated(i,j,2) + image_interpolated(i,j+1,2) + image_interpolated(i+1,j,2) + image_interpolated(i-1,j,2));
        image_interpolated(i,j,3) = .25*(image_interpolated(i,j,3) + image_interpolated(i,j+1,3) + image_interpolated(i+1,j,3) + image_interpolated(i-1,j,3));
    end
end

k=1;
for i=1:row
    for j=1:col
        image_interpolated_raw(k) = image_interpolated(i,j,1);
        image_interpolated_raw(k+1) = image_interpolated(i,j,2);
        image_interpolated_raw(k+2) = image_interpolated(i,j,3);
        k = k + 3;
    end
end

writeraw(image_reconstructed_raw,'warping_reconstructed_raccoon.raw');
writeraw(image_interpolated_raw,'warping_interpolated_raccoon.raw');

imshow(uint8(image_reconstructed));
title('Image obtained after reconstructing the image obtained from warping');  