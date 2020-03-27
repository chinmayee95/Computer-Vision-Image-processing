%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020
%read image
I=readraw('Toy.raw'); 

r = 560;
c = 400;

size = r*c;

k=1;
for i=1:3:(size*3)
   
    red_ch(k) = I(i);
    green_ch(k) = I(i+1);
    blue_ch(k) = I(i+2);
    k = k + 1;
%     i = i + 3;
    
end

l=1;
for i=1:r
    for j=1:c
        red_channel(i,j) = red_ch(l); 
        green_channel(i,j) = green_ch(l); 
        blue_channel(i,j) = blue_ch(l); 
        l = l + 1;
    end
end

bucket_size = l/256;
Rpixel_cnt=0;
Gpixel_cnt=0;
Bpixel_cnt=0;
R_sum=0;
G_sum=0;
B_sum=0;

bins=0;
R_channel_out=zeros(560,400);
for i=1:256 
    for row=1:560
        for col=1:400
            if red_channel(row,col)==i-1
                if Rpixel_cnt<=875          %check if maximum bin level has reached
                    Rpixel_cnt=(Rpixel_cnt+1);   
                    R_channel_out(row,col)=bins;
                else
                    bins=bins+1;
                    Rpixel_cnt=0;      
                end
            end
        end
    end
end

bins=0;
G_channel_out=zeros(560,400);
for i=1:256 
    for row=1:560
        for col=1:400
            if green_channel(row,col)==i-1
                if Gpixel_cnt<=875          %check if maximum bin level has reached
                    Gpixel_cnt=(Gpixel_cnt+1);   
                    G_channel_out(row,col)=bins;
                else
                    bins=bins+1;
                    Gpixel_cnt=0;      
                end
            end
        end
    end
end

bins=0;
B_channel_out=zeros(560,400);
for i=1:256 
    for row=1:560
        for col=1:400
            if blue_channel(row,col)==i-1
                if Bpixel_cnt<=875          %check if maximum bin level has reached
                    Bpixel_cnt=(Bpixel_cnt+1);   
                    B_channel_out(row,col)=bins;
                else
                    bins=bins+1;
                    Bpixel_cnt=0;      
                end
            end
        end
    end
end

l=1;
for i=1:r
    for j=1:c
        bucket_out(l)=R_channel_out(i,j);
        bucket_out(l+1)=G_channel_out(i,j);
        bucket_out(l+2)=B_channel_out(i,j);
        l = l + 3;
    end
end

writeraw(bucket_out,'he_bin.raw');

pdf_red = zeros(1,256);
pdf_green = zeros(1,256);
pdf_blue = zeros(1,256);

%pdf and cdf 
for p=0:255
    for i=1:r
        for j=1:c
            if R_channel_out(i,j) == p
                pdf_red(p+1) = pdf_red(p+1) + 1;
            end
            if G_channel_out(i,j) == p
                pdf_green(p+1) = pdf_green(p+1) + 1;
            end
            if B_channel_out(i,j) == p
                pdf_blue(p+1) = pdf_blue(p+1) + 1;
            end
        end
    end
end

i = 1;

cdf_red(i) = pdf_red(i);
cdf_green(i) = pdf_green(i);
cdf_blue(i) = pdf_blue(i);

for i=2:256
    cdf_red(i) = cdf_red(i-1) + pdf_red(i);
    cdf_green(i) = cdf_green(i-1) + pdf_green(i);
    cdf_blue(i) = cdf_blue(i-1) + pdf_blue(i);
end

subplot(1,3,1);
plot(0:255,cdf_red);
xlabel('Intensity values');
ylabel('CDF of enhanced image');
title('Equalised histogram-red channel CDF')

subplot(1,3,2);
plot(0:255,cdf_green);
xlabel('Intensity values');
ylabel('CDF of enhanced image');
title('Equalised histogram-green channel CDF')

subplot(1,3,3);
plot(0:255,cdf_blue);
xlabel('Intensity values');
ylabel('CDF of enhanced image');
title('Equalised histogram-blue channel CDF')

