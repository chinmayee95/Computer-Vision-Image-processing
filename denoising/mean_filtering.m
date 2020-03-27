%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

% if true
% r=320;  c=320;
% %[r c] = size('Dog_ori.raw');
% fir=fopen('Corn_noisy.raw','r');
% I=fread(fir,r*c,'uint8=>uint8'); 
% Z=reshape(I,r,c);
% Z=Z';
% k=imshow(Z)
% end
% image = Z;

I = readraw('Corn_noisy.raw');

r=320;  c=320;
k=1;
for i=1:320
    for j=1:320
        image(i,j) = I(k);
        k=k+1;
    end
end

        
f_size = 7;
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
        out_new(i,j) = mean_filter(out,i+1,j+1);
    end
end

%writing the output to raw format
writeraw(out_new,'Corn_mean.raw');

%reading the original image without noise

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




% for i=2:r+f_half
%     for j=2:c+f_half
%         out_new(i-1,j-1) = mean_filter(out,i,j);
%     end
% end

% for i=2:r+f_half
%     for j=i+1:c+f_half
%         temp = out_new(i,j);
%         out_new(i,j) = out_new(j,i);
%         out_new(j,i) = temp;
%     end
% end

% imshow(out_new);




% for i=1:f_half
%     
%     out(2:i,:)=out(2,:)
% %     out((r+f_half+1),:) = out((r+f_half-i),:);
% %     out(f_half,:) = out(f_half+i+1,:);
% %     out(:,f_half) = out(:,(f_half+i+1));
% %     out(:,(c+f_half+1)) = out(:,(c+f_half-i));
% end
