%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [output] = tuning(image,tune_value)

[r c] = size(image)

for i=1:r
  for j=1:c
      if(image(i,j)>tune_value)
          output(i,j)=255;
      else
          output(i,j)=0;
      end
  end
end
 
% for i=1:r
%   for j=1:c
%       if(image(i,j)>tune_value)
%           output(i,j)=255;
%       else
%           output(i,j)=0;
%       end
%   end
%  end
end
%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [output] = sobel_y(input_image,i,j,filter_size)

im = input_image;
f = filter_size;
f_half = (f-1)/2.0;

out=0;

% sobel mask
sobel_mask = [-1,-2,-1,0,0,0,1,2,1];

%one d array of image values in the i and j locations
ctr = 1;
for ii = i-f_half:i+f_half
    for jj = j-f_half:j+f_half
        out(ctr) = im(ii,jj);
        ctr = ctr + 1;
    end
end

output = 0;
% convolution with sobel mask
for l=1:ctr-1
    
    output = output + out(l)*sobel_mask(l);
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [output] = sobel_x(input_image,i,j,filter_size)

im = input_image;
f = filter_size;
f_half = (f-1)/2.0;

out=0;

% sobel mask
sobel_mask = [-1,0,1,-2,0,2,-1,0,1];
%one d array of image values in the i and j locations
ctr = 1;
for ii = i-f_half:i+f_half
    for jj = j-f_half:j+f_half
        out(ctr) = im(ii,jj);
        ctr = ctr + 1;
    end
end

output = 0;
% convolution with sobel mask
for l=1:ctr-1
    
    output = output + out(l)*sobel_mask(l);
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector

I = readraw('Gallery.raw');

c=481;
r=321;

%reading rgb raw image
k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

%convert to gray image
gray_in = 0.2989 * red_ch + 0.5870 * green_ch + 0.1140 * blue_ch;

%sobel operation

%padding
image = pad(gray_in,3);

%sobel operation
for i=1:r
    for j=1:c
        gray_x(i,j) = sobel_x(image,i+1,j+1,3);
        gray_y(i,j) = sobel_y(image,i+1,j+1,3);
        gray_out(i,j) = sqrt(gray_x(i,j).*gray_x(i,j) + gray_y(i,j).*gray_y(i,j));
        %gray_out(i,j) = abs(gray_x(i,j)) + abs(gray_y(i,j));
        %gray_out(i,j) = gray_x(i,j)+gray_y(i,j);
    end
end

%tuning
min_x = min(min(gray_x));
max_x = max(max(gray_x));
min_y = min(min(gray_y));
max_y = max(max(gray_y));
min_gray_out = min(min(gray_out));
max_gray_out = max(max(gray_out));

normalised_x = 255*(gray_x-min_x)/(max_x-min_x);
normalised_y = 255*(gray_y-min_y)/(max_y-min_y);
normalised_out = 255*(gray_out-min_gray_out)/(max_gray_out-min_gray_out);
tune_out = tuning(gray_out,204);
% 
writeraw(normalised_out,'Gallery_norm_sobel.raw');
% writeraw(normalised_x,'Dogs_normx_sobel.raw');
% writeraw(normalised_y,'Dogs_normy_sobel.raw');

writeraw(gray_in,'Gallery_gray_input.raw');
writeraw(normalised_x,'Gallery_normx_sobel.raw');
writeraw(normalised_y,'Gallery_normy_sobel.raw');
writeraw(gray_out,'Gallery_sobel.raw');
writeraw(tune_out,'Gallery_sobel_tune.raw');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector

I = readraw('Dogs.raw');

c=481;
r=321;

%reading rgb raw image
k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

%convert to gray image
gray_in = 0.2989 * red_ch + 0.5870 * green_ch + 0.1140 * blue_ch;

%sobel operation

%padding
image = pad(gray_in,3);

%sobel operation
for i=1:r
    for j=1:c
        gray_x(i,j) = sobel_x(image,i+1,j+1,3);
        gray_y(i,j) = sobel_y(image,i+1,j+1,3);
        gray_out(i,j) = sqrt(gray_x(i,j).*gray_x(i,j) + gray_y(i,j).*gray_y(i,j));
        %gray_out(i,j) = abs(gray_x(i,j)) + abs(gray_y(i,j));
        %gray_out(i,j) = gray_x(i,j)+gray_y(i,j);
    end
end

min_x = min(min(gray_x));
max_x = max(max(gray_x));
min_y = min(min(gray_y));
max_y = max(max(gray_y));
min_gray_out = min(min(gray_out));
max_gray_out = max(max(gray_out));

normalised_x = 255*(gray_x-min_x)/(max_x-min_x);
normalised_y = 255*(gray_y-min_y)/(max_y-min_y);
normalised_out = 255*(gray_out-min_gray_out)/(max_gray_out-min_gray_out);
%tuning

writeraw(normalised_out,'Dogs_norm_sobel.raw');
writeraw(normalised_x,'Dogs_normx_sobel.raw');
writeraw(normalised_y,'Dogs_normy_sobel.raw');
tune_out = tuning(gray_out,200);

writeraw(gray_out,'Dogs_sobel.raw');
writeraw(tune_out,'Dogs_tune.raw');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Sobel edge detector
function [out] = pad(image,filter_size)

%padding with reflection

[r c] = size(image);
f_size = filter_size;
f_half = (f_size-1)/2;

out = zeros(r+f_size-1,c+f_size-1);

out(f_half+1:r+f_half,f_half+1:c+f_half) = image;

%reflecting the boundary pixels
out(f_half , f_half + 1 : c + f_half) = out(f_half + 1 , f_half + 1 : c + f_half);
out(r + f_half + 1 , f_half + 1 : c + f_half) = out(r + f_half , f_half + 1 : c + f_half);
end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING 

function [output] = closest_val(old)

if (old)>128
    output = 255;
else
    output = 0;
end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING - fixed thresholding

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);
        k = k + 1;
    end
end

%perform fixed thresholding
threshold = 200;
f_th = fixed_thresholding(image,threshold);
writeraw(f_th,'fixed_thresholding.raw');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING 

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);
        k = k + 1;
    end
end

%creating the index matrices
Index_2=[1 2;3 0];
Index_4=[4.*Index_2+ones(2,2) 4.*Index_2+2*ones(2,2);4.*Index_2+3*ones(2,2) 4.*Index_2];
Index_8=[4.*Index_4+ones(4,4) 4.*Index_4+2*ones(4,4);4.*Index_4+3*ones(4,4) 4.*Index_4];
Index_16=[4.*Index_8+ones(8,8) 4.*Index_8+2*ones(8,8);4.*Index_8+3*ones(8,8) 4.*Index_8];
Index_32=[4.*Index_16+ones(16,16) 4.*Index_16+2*ones(16,16);4.*Index_16+3*ones(16,16) 4.*Index_16];

%creating the threshold matrices for Index_2,Index_8 and Index_32
Threshold_2=threshold_matrix(Index_2);
Threshold_8=threshold_matrix(Index_8);
Threshold_32=threshold_matrix(Index_32);

%dithering result    
dither_output_2 = dithering(image,Index_2,Threshold_2);
dither_output_8 = dithering(image,Index_8,Threshold_8);
dither_output_32 = dithering(image,Index_32,Threshold_32);

%write into raw
writeraw(dither_output_2,'dither_output_2.raw');
writeraw(dither_output_8,'dither_output_8.raw');
writeraw(dither_output_32,'dither_output_32.raw');

%results in matlab
figure(1);
imshow(uint8(image));
title('Original image');

figure(2);
imshow(uint8(dither_output_2));
title('Image obtained through dithering using Index 2 thresholding matrix');

figure(3);
imshow(uint8(dither_output_8));
title('Image obtained through dithering using Index 8 thresholding matrix');

figure(4);
imshow(uint8(dither_output_32));
title('Image obtained through dithering using Index 32 thresholding matrix');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING - random thresholding

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);
        k = k + 1;
    end
end

%perform random thresholding

r_th = random_thresholding(image);
writeraw(r_th,'random_thresholding.raw');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING 

function [dither_output] = dithering(image,IndexMatrix,ThresholdMatrix)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[N M]=size(IndexMatrix);
for i=1:500
    for j=1:750
        if (image(i,j)>=0 && image(i,j)<=ThresholdMatrix(mod(i,N)+1,mod(j,M)+1))
        dither_output(i,j)=0;
        elseif(image(i,j)<256 && image(i,j)>ThresholdMatrix(mod(i,N)+1,mod(j,M)+1))
        dither_output(i,j)=255;
        end
    end
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING - fixed thresholding

function [output] = fixed_thresholding(image,threshold)

%   fixed_thresholding
[r c] = size(image);
for i=1:r
    for j=1:c
        if image(i,j)<threshold
            output(i,j) = 0;
        else
            output(i,j) = 255;
        end
    end
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: MBVQ Error Diffusion : Floyd-Steinberg

function [error_diffusion_red_out error_diffusion_green_out error_diffusion_blue_out] = floyd_st_mbvq_error_diffusion(red_ch,green_ch,blue_ch)

[r c] = size(red_ch);

N=3;

diffusion_matrix=(1/16)*[0 0 0;0 0 7;3 5 1];
diffusion_matrix_mirrored=(1/16)*[0 0 0;7 0 0;1 5 3];

error_diffusion_red_out = zeros(r,c);
error_diffusion_green_out = zeros(r,c);
error_diffusion_blue_out = zeros(r,c);

error_diffusion_red = zeros(480+N-1,640+N-1);
error_diffusion_green = zeros(480+N-1,640+N-1);
error_diffusion_blue = zeros(480+N-1,640+N-1);

% error_diffusion_red = red_ch;
% error_diffusion_green = green_ch;
% error_diffusion_blue = blue_ch;

for i=1:480          
    for j=1:640
        error_diffusion_red(i+(N-1)/2,j+(N-1)/2)=red_ch(i,j);
        error_diffusion_green(i+(N-1)/2,j+(N-1)/2)=green_ch(i,j);
        error_diffusion_blue(i+(N-1)/2,j+(N-1)/2)=blue_ch(i,j);
    end
end

error_diffusion_red = pad(error_diffusion_red,3);
error_diffusion_green = pad(error_diffusion_green,3);
error_diffusion_blue = pad(error_diffusion_blue,3);


rch = red_ch;
gch = green_ch;
bch = blue_ch;

for i=1+(N-1)/2:480+(N-1)/2
    if (mod(i,2)==0)
        for j=1+(N-1)/2:640+(N-1)/2
           
            mbvq_rgb = mbvq(rch(i-(N-1)/2,j-(N-1)/2),gch(i-(N-1)/2,j-(N-1)/2),bch(i-(N-1)/2,j-(N-1)/2));
            
            vertex = getNearestVertex(mbvq_rgb,(error_diffusion_red(i,j)),(error_diffusion_green(i,j)),(error_diffusion_blue(i,j)));
            
            [new_pixel_red new_pixel_green new_pixel_blue] = vertex_map(vertex);
    
            error_red = error_diffusion_red(i,j) - new_pixel_red;
            error_green = error_diffusion_green(i,j) - new_pixel_green;
            error_blue = error_diffusion_blue(i,j) - new_pixel_blue;

            error_diffusion_red_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_red;
            error_diffusion_green_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_green;
            error_diffusion_blue_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_blue;

            for k=i-(N-1)/2:i+(N-1)/2
                for l=j-(N-1)/2:j+(N-1)/2
                   error_diffusion_red(k,l)=error_diffusion_red(k,l)+error_red*diffusion_matrix(k-i+N-1,l-j+N-1);
                   error_diffusion_green(k,l)=error_diffusion_green(k,l)+error_green*diffusion_matrix(k-i+N-1,l-j+N-1);
                   error_diffusion_blue(k,l)=error_diffusion_blue(k,l)+error_blue*diffusion_matrix(k-i+N-1,l-j+N-1);
                end
            end
            
        end
    elseif(mod(i,2)==1)
        for j=640+(N-1)/2:-1:1+(N-1)/2
            mbvq_rgb = mbvq(rch(i-(N-1)/2,j-(N-1)/2),gch(i-(N-1)/2,j-(N-1)/2),bch(i-(N-1)/2,j-(N-1)/2));
            
            vertex = getNearestVertex(mbvq_rgb,(error_diffusion_red(i,j)),(error_diffusion_green(i,j)),(error_diffusion_blue(i,j)));
            
            [new_pixel_red new_pixel_green new_pixel_blue] = vertex_map(vertex);
    
            error_red = error_diffusion_red(i,j) - new_pixel_red;
            error_green = error_diffusion_green(i,j) - new_pixel_green;
            error_blue = error_diffusion_blue(i,j) - new_pixel_blue;

            error_diffusion_red_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_red;
            error_diffusion_green_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_green;
            error_diffusion_blue_out(i-(N-1)/2,j-(N-1)/2)=new_pixel_blue;

            for k=i-(N-1)/2:i+(N-1)/2
                for l=j-(N-1)/2:j+(N-1)/2
                   error_diffusion_red(k,l)=error_diffusion_red(k,l)+error_red*diffusion_matrix_mirrored(k-i+N-1,l-j+N-1);
                   error_diffusion_green(k,l)=error_diffusion_green(k,l)+error_green*diffusion_matrix_mirrored(k-i+N-1,l-j+N-1);
                   error_diffusion_blue(k,l)=error_diffusion_blue(k,l)+error_blue*diffusion_matrix_mirrored(k-i+N-1,l-j+N-1);
                end
            end
            
        
        end
    end 
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Error Diffusion : Floyd-Steinberg

function [err_diff] = floyd_st(channel)

[r c] = size(channel);

err_diff_out = zeros(r,c);
err_diff = channel;

for i=1:r
    if mod(i,2)
        for j=1:c
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff_out(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/16;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*3/16;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*5/16;
            end
            if (i + 1<=r && j + 1<=c)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*1/16;
            end
        end
    else
        j=c;
        while j>0
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff_out(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/16;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*3/16;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*5/16;
            end
            if (i + 1<=r && j + 1<=c)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*1/16;
            end
            j=j-1;
        end
    end 
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Error Diffusion : Floyd-Steinberg

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);                            

        k = k + 1;
    end
end

err_diff = image;

for i=1:r
    if mod(i,2)
        for j=1:c
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/16;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*3/16;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*5/16;
            end
            if (i + 1<=r && j + 1<=c)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*1/16;
            end
        end
    else
        j=c;
        while j>0
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/16;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*3/16;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*5/16;
            end
            if (i + 1<=r && j + 1<=c)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*1/16;
            end
            j=j-1;
        end
    end 
end

writeraw(err_diff,'flyod_stein.raw');

%results in matlab
figure(1);
imshow(uint8(image));
title('Original image');

figure(2);
imshow(uint8(err_diff));
title('Image obtained through Error Diffusion : Floyd-Steinberg');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Error Diffusion : JJN

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);                            

        k = k + 1;
    end
end

err_diff = image;


for i=1:r
    if mod(i,2)
        for j=1:c
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/48;
            end
            if (j + 2<=c)
                err_diff(i,j+2)=err_diff(i,j+2)+error*5/48;
            end
            if (j - 2 > 0 && i + 1<=r)
                err_diff(i+1,j-2)=err_diff(i+1,j-2)+error*3/48;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*5/48;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*7/48;
            end
            if (j+1<=c && i+1<=r)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*5/48;
            end
            if (j+2<=c && i+1<=r)
                err_diff(i+1,j+2)=err_diff(i+1,j+2)+error*3/48;
            end
            if (j-2>0 && i+2<=r)
                err_diff(i+2,j-2)=err_diff(i+2,j-2)+error*1/48;
            end
            if (j-1>0 && i+2<=r)
                err_diff(i+2,j-1)=err_diff(i+2,j-1)+error*3/48;
            end
            if (i+2<=r)
                err_diff(i+2,j)=err_diff(i+2,j)+error*5/48;
            end
            if (j+1<=c && i+2<=r)
                err_diff(i+2,j+1)=err_diff(i+2,j+1)+error*3/48;
            end
            if (j+2<=c && i+2<=r)
                err_diff(i+2,j+2)=err_diff(i+2,j+2)+error*1/48;
            end
        end
    else
        j=c;
        while j>0
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*7/48;
            end
            if (j + 2<=c)
                err_diff(i,j+2)=err_diff(i,j+2)+error*5/48;
            end
            if (j - 2 > 0 && i + 1<=r)
                err_diff(i+1,j-2)=err_diff(i+1,j-2)+error*3/48;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*5/48;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*7/48;
            end
            if (j+1<=c && i+1<=r)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*5/48;
            end
            if (j+2<=c && i+1<=r)
                err_diff(i+1,j+2)=err_diff(i+1,j+2)+error*3/48;
            end
            if (j-2>0 && i+2<=r)
                err_diff(i+2,j-2)=err_diff(i+2,j-2)+error*1/48;
            end
            if (j-1>0 && i+2<=r)
                err_diff(i+2,j-1)=err_diff(i+2,j-1)+error*3/48;
            end
            if (i+2<=r)
                err_diff(i+2,j)=err_diff(i+2,j)+error*5/48;
            end
            if (j+1<=c && i+2<=r)
                err_diff(i+2,j+1)=err_diff(i+2,j+1)+error*3/48;
            end
            if (j+2<=c && i+2<=r)
                err_diff(i+2,j+2)=err_diff(i+2,j+2)+error*1/48;
            end
        
            j=j-1;
        end
    end

end

writeraw(err_diff,'jjn_dithering.raw');

%results in matlab
figure(1);
imshow(uint8(image));
title('Original image');

figure(2);
imshow(uint8(err_diff));
title('Image obtained through Error Diffusion : JJN');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: MBVQ Error Diffusion : Floyd-Steinberg

I = readraw('Rose.raw');

c=640;
r=480;

%reading the raw image into channels - RGB
k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

output_MBVQ_red=zeros(r,c);
output_MBVQ_green=zeros(r,c);
output_MBVQ_blue=zeros(r,c);

[error_diffusion_red error_diffusion_green error_diffusion_blue] = floyd_st_mbvq_error_diffusion(red_ch,green_ch,blue_ch);

output_MBVQ(:,:,1) = error_diffusion_red;
output_MBVQ(:,:,2) = error_diffusion_green;
output_MBVQ(:,:,3) = error_diffusion_blue;

k=1;
for i=1:r
    for j=1:c
        out(k) = error_diffusion_red(i,j);
        out(k+1) =error_diffusion_green(i,j);
        out(k+2) = error_diffusion_blue(i,j);
        k = k + 3;
    end
end

writeraw(out,'mbvq_rose.raw');

figure(10);
imshow(uint8(output_MBVQ));
title('Color error diffusion using MBVQ based algorithm');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: MBVQ Error Diffusion : Floyd-Steinberg

function mbvq= mbvq_return(Red,Green,Blue)
    
    if((Red+Green)>255)
        if((Green+Blue)> 255)
            if((Red+Green+Blue)> 510)
                mbvq= 'CMYW';
             else
                mbvq= 'MYGC';
             end
        else
            mbvq= 'RGMY';
        end
    else
        if(~((Green+Blue)>255))
            if(~((Red+Green+Blue)>255))
                mbvq= 'KRGB';
            else
                mbvq= 'RGBM';
            end
        else
            mbvq= 'CMGB';
        end
    end
end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING - random thresholding

function [output] = random_thresholding(image)

%   random_thresholding
% threshold = randi([0 255],1,1)
[r c] = size(image);
for i=1:r
    for j=1:c
        if image(i,j)<randi([0 255],1,1)
            output(i,j) = 0;
        else
            output(i,j) = 255;
        end
    end
end

end


%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Error Diffusion : Color

I = readraw('Rose.raw');

c=640;
r=480;

%reading the raw image into channels - RGB
k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

%conversion to CMY
c_ch = 255-red_ch;
m_ch = 255-green_ch;
y_ch = 255-blue_ch;

%error diffusion using floyd and conversion to RGB
r_err_diff = 255-floyd_sep(c_ch);
g_err_diff = 255-floyd_sep(m_ch);
b_err_diff = 255-floyd_sep(y_ch);

err_diff(:,:,1) = r_err_diff;
err_diff(:,:,2) = g_err_diff;
err_diff(:,:,3) = b_err_diff;

%writing into raw format
k=1;
for i=1:r
    for j=1:c
        O(k) = r_err_diff(i,j);
        O(k+1) = g_err_diff(i,j);
        O(k+2) = b_err_diff(i,j);
        k = k + 3;
    end
end

imshow(uint8(err_diff));
writeraw(O,'Color_image_error_diffusion.raw');


%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Error Diffusion : Stucki 

I = readraw('LightHouse.raw');

c=750;
r=500;

%reading the raw image
k=1;
for i=1:r
    for j=1:c
        image(i,j) = I(k);                            

        k = k + 1;
    end
end

err_diff = image;


for i=1:r
    if mod(i,2)
        for j=1:c
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*8/42;
            end
            if (j + 2<=c)
                err_diff(i,j+2)=err_diff(i,j+2)+error*4/42;
            end
            if (j - 2 > 0 && i + 1<=r)
                err_diff(i+1,j-2)=err_diff(i+1,j-2)+error*2/42;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*4/42;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*8/42;
            end
            if (j+1<=c && i+1<=r)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*4/42;
            end
            if (j+2<=c && i+1<=r)
                err_diff(i+1,j+2)=err_diff(i+1,j+2)+error*2/42;
            end
            if (j-2>0 && i+2<=r)
                err_diff(i+2,j-2)=err_diff(i+2,j-2)+error*1/42;
            end
            if (j-1>0 && i+2<=r)
                err_diff(i+2,j-1)=err_diff(i+2,j-1)+error*2/42;
            end
            if (i+2<=r)
                err_diff(i+2,j)=err_diff(i+2,j)+error*4/42;
            end
            if (j+1<=c && i+2<=r)
                err_diff(i+2,j+1)=err_diff(i+2,j+1)+error*2/42;
            end
            if (j+2<=c && i+2<=r)
                err_diff(i+2,j+2)=err_diff(i+2,j+2)+error*1/42;
            end
        end
    else
        j=c;
        while j>0
            old = err_diff(i,j);
            new = closest_val(old);
            err_diff(i,j) = new;
            error = old - new;
            if (j + 1<=c)
                err_diff(i,j+1)=err_diff(i,j+1)+error*8/42;
            end
            if (j + 2<=c)
                err_diff(i,j+2)=err_diff(i,j+2)+error*4/42;
            end
            if (j - 2 > 0 && i + 1<=r)
                err_diff(i+1,j-2)=err_diff(i+1,j-2)+error*2/42;
            end
            if (j - 1 > 0 && i + 1<=r)
                err_diff(i+1,j-1)=err_diff(i+1,j-1)+error*4/42;
            end
            if (i + 1<=r)
                err_diff(i+1,j)=err_diff(i+1,j)+error*8/42;
            end
            if (j+1<=c && i+1<=r)
                err_diff(i+1,j+1)=err_diff(i+1,j+1)+error*4/42;
            end
            if (j+2<=c && i+1<=r)
                err_diff(i+1,j+2)=err_diff(i+1,j+2)+error*2/42;
            end
            if (j-2>0 && i+2<=r)
                err_diff(i+2,j-2)=err_diff(i+2,j-2)+error*1/42;
            end
            if (j-1>0 && i+2<=r)
                err_diff(i+2,j-1)=err_diff(i+2,j-1)+error*2/42;
            end
            if (i+2<=r)
                err_diff(i+2,j)=err_diff(i+2,j)+error*4/42;
            end
            if (j+1<=c && i+2<=r)
                err_diff(i+2,j+1)=err_diff(i+2,j+1)+error*2/42;
            end
            if (j+2<=c && i+2<=r)
                err_diff(i+2,j+2)=err_diff(i+2,j+2)+error*1/42;
            end
       
            j=j-1;
        end
    end

end

writeraw(err_diff,'stucki_dithering.raw');

%results in matlab
figure(1);
imshow(uint8(image));
title('Original image');

figure(2);
imshow(uint8(err_diff));
title('Image obtained through Error Diffusion : Stucki');

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: DITHERING 

function [Threshold_Matrix] = threshold_matrix(IndexMatrix)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[r c]=size(IndexMatrix);
for i=1:r
    for j=1:c
    Threshold_Matrix(i,j)=(IndexMatrix(i,j)+0.5)*255./(r*c);
    end
end

end

%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : 2.DIGITAL HALFTONING
%Implementation: Color Error Diffusion : MBVQ


function [new_pixel_red new_pixel_green new_pixel_blue] = vertex_map( vertex )

    if (isequal('yellow',vertex))
        yellow_vertex=[255,255,0];
        new_pixel_red=yellow_vertex(1,1);
        new_pixel_green=yellow_vertex(1,2);
        new_pixel_blue=yellow_vertex(1,3);
    
    elseif (isequal('white',vertex))
        white_vertex=[255,255,255];
        new_pixel_red=white_vertex(1,1);
        new_pixel_green=white_vertex(1,2);
        new_pixel_blue=white_vertex(1,3);
    
    elseif (isequal('cyan',vertex))
        cyan_vertex=[0,255,255];
        new_pixel_red=cyan_vertex(1,1);
        new_pixel_green=cyan_vertex(1,2);
        new_pixel_blue=cyan_vertex(1,3);
    
    elseif (isequal('magenta',vertex))
        magenta_vertex=[255,0,255];
        new_pixel_red=magenta_vertex(1,1);
        new_pixel_green=magenta_vertex(1,2);
        new_pixel_blue=magenta_vertex(1,3);
    
    elseif (isequal('green',vertex))
        green_vertex=[0,255,0];
        new_pixel_red=green_vertex(1,1);
        new_pixel_green=green_vertex(1,2);
        new_pixel_blue=green_vertex(1,3);
    
    elseif (isequal('red',vertex))
        red_vertex=[255,0,0];
        new_pixel_red=red_vertex(1,1);
        new_pixel_green=red_vertex(1,2);
        new_pixel_blue=red_vertex(1,3);
    
    elseif (isequal('blue',vertex))
        blue_vertex=[0,0,255];
        new_pixel_red=blue_vertex(1,1);
        new_pixel_green=blue_vertex(1,2);
        new_pixel_blue=blue_vertex(1,3);
    
    elseif (isequal('black',vertex))
        black_vertex=[0,0,0];
        new_pixel_red=black_vertex(1,1);
        new_pixel_green=black_vertex(1,2);
        new_pixel_blue=black_vertex(1,3);
    end

end
    

