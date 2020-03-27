%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

I = readraw('Corn_noisy.raw');

r=320;  c=320;
k=1;
for i=1:320
    for j=1:320
        image(i,j) = I(k);
        k=k+1;
    end
end

sigma_c = 20;
sigma_s = 15;

window = 7;

f_size = window;
f_half = (f_size-1)/2;

out = zeros(r+f_size-1,c+f_size-1);

out(f_half+1:r+f_half,f_half+1:c+f_half) = image;

%reflecting the boundary pixels
out(f_half , f_half + 1 : c + f_half) = out(f_half + 1 , f_half + 1 : c + f_half);
out(r + f_half + 1 , f_half + 1 : c + f_half) = out(r + f_half , f_half + 1 : c + f_half);

out(:,f_half)=out(:,f_half+1);
out(:,c+f_half+1)=out(:,c+f_half);
for i=1:r
    for j=1:c
        out_new(i,j) = bilateral_filter(out,i+f_half,j+f_half,window,sigma_s,sigma_c);
    end
end

writeraw(out_new,'Corn_bilat.raw');

Y = readraw('Corn_gray.raw');

r=320;  c=320;
k=1;
for i=1:320
    for j=1:320
        image_y(i,j) = Y(k);
        k=k+1;
    end
end

Y = image_y;

X = out_new;

psnr_db = psnr(Y,X);


