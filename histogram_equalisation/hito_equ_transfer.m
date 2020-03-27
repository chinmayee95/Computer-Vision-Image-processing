%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020

%read the raw RGB image
I = readraw('Toy.raw');

r = 560;
c = 400;

k=1;
for i=1:r
    for j=1:c
        red_ch(i,j) = I(k);
        green_ch(i,j) = I(k+1);
        blue_ch(i,j) = I(k+2);
        k = k + 3;
    end
end

%create one d array of the above for easier calculations

l=1;
for i=1:r
    for j=1:c
        red(l) = red_ch(i,j); 
        g(l) = green_ch(i,j); 
        b(l) = blue_ch(i,j); 
        l = l + 1;
    end
end


%histogram

pixel_intensity = zeros(256,1);

for i = 0:255
    pixel_intensity(i+1) = i;
end

num_pixels(:,1) = pixel_intensity;
%red channel pdf
num_pixels(:,2) = zeros(256,1);
%green channel pdf
num_pixels(:,3) = zeros(256,1);
%blue channel pdf
num_pixels(:,4) = zeros(256,1);

%number of pixels - pdf 
for i = 1:l-1
    for j = 1:256
        if red(i) == pixel_intensity(j)
            num_pixels(j,2) = num_pixels(j,2) + 1;
        end
        if g(i) == pixel_intensity(j)
            num_pixels(j,3) = num_pixels(j,3) + 1;
        end
        if b(i) == pixel_intensity(j)
            num_pixels(j,4) = num_pixels(j,4) + 1;
        end
    end
end

%histogram plotting

subplot(2,3,1);
plot(num_pixels(:,1),num_pixels(:,2),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Red channel histogram of original image'); 

subplot(2,3,2);
plot(num_pixels(:,1),num_pixels(:,3),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Green channel histogram of original image'); 

subplot(2,3,3);
plot(num_pixels(:,1),num_pixels(:,4),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Blue channel histogram of original image'); 


%calculating probability - dividing pdf by total number of
%pixels(rows*cols)
num_pixels(:,2) = num_pixels(:,2)/l;
num_pixels(:,3) = num_pixels(:,3)/l;
num_pixels(:,4) = num_pixels(:,4)/l;

num_pixels(:,5:7) = zeros(256,3);

%zero internsity value of cdf = pdf
num_pixels(1,5) = num_pixels(1,2);
num_pixels(1,6) = num_pixels(1,3);
num_pixels(1,7) = num_pixels(1,4);

%calculating cumulative probability
for i = 2:256
    num_pixels(i,5) = num_pixels(i,2) + num_pixels(i-1,5);
    num_pixels(i,6) = num_pixels(i,3) + num_pixels(i-1,6);
    num_pixels(i,7) = num_pixels(i,4) + num_pixels(i-1,7);
end

new_pixels(:,1) = pixel_intensity;
new_pixels(:,2:4) = zeros(256,3);

%w = 255*(1/(r*c));

%getting new pixel values
new_pixels(:,2:4) = num_pixels(:,5:7) * 255;

%output
%he_im = new_pixels(:,2:4);
out_pixels(:,1) = pixel_intensity;

out_pixels(:,2:4) = zeros(256,3);


l=1;
u=1;
while u < (r*c)
        he_im(l) = new_pixels(red(u)+1,2); 
        out_pixels(red(u)+1,2) = out_pixels(red(u)+1,2) + 1;
        disp(out_pixels(red(u)+1,2));%red value pdf
        he_im(l+1) = new_pixels(g(u)+1,3);
        out_pixels(g(u)+1,3) = out_pixels(g(u)+1,3) + 1;%green value pdf
        he_im(l+2) = new_pixels(b(u)+1,4); 
        out_pixels(b(u)+1,4) = out_pixels(b(u)+1,4) + 1;%blue value pdf
        l = l + 3;
        u = u + 1;
end


%calculating probability - dividing pdf by total number of
%pixels(rows*cols)
out_pixels(:,2) = out_pixels(:,2);
out_pixels(:,3) = out_pixels(:,3);
out_pixels(:,4) = out_pixels(:,4);

out_pixels(:,5:7) = zeros(256,3);

%zero internsity value of cdf = pdf
out_pixels(1,5) = out_pixels(1,2);
out_pixels(1,6) = out_pixels(1,3);
out_pixels(1,7) = out_pixels(1,4);

%calculating cumulative probability
for i = 2:256
    out_pixels(i,5) = out_pixels(i,2) + out_pixels(i-1,5);
    out_pixels(i,6) = out_pixels(i,3) + out_pixels(i-1,6);
    out_pixels(i,7) = out_pixels(i,4) + out_pixels(i-1,7);
end

out_pixels(:,5:7) = out_pixels(:,5:7)/(r*c);


%number of pixels - pdf 

% out_pixels(:,1) = pixel_intensity;
% 
% out_pixels(:,2:4) = zeros(256,3);

% i=1;
% while i < (3*r*c)
%     for j = 1:256
%         if he_im(i) == pixel_intensity(j)
%             out_pixels(j,2) = out_pixels(j,2) + 1;
%         end
%         if he_im(i+1) == pixel_intensity(j)
%             out_pixels(j,3) = out_pixels(j,3) + 1;
%         end
%         if he_im(i+2) == pixel_intensity(j)
%             out_pixels(j,4) = out_pixels(j,4) + 1;
%         end
%         
%         i = i + 1;
%         
%     end
% end

subplot(2,3,4);
plot(out_pixels(:,1),out_pixels(:,5),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Red channel histogram of enhanced image'); 

subplot(2,3,5);
plot(out_pixels(:,1),out_pixels(:,6),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Green channel histogram of enhanced image'); 

subplot(2,3,6);
plot(out_pixels(:,1),out_pixels(:,7),'-');
xlabel('Intensity values');
ylabel('Number of pixels');
title('Blue channel histogram of enhanced image'); 


%transfer function plotting
subplot(1,3,1);
plot(num_pixels(:,5),out_pixels(:,5),'-');
xlabel('CDF of input image');
ylabel('CDF of enhanced image');
title('RED channel transfer function');

subplot(1,3,2);
plot(num_pixels(:,6),out_pixels(:,6));
xlabel('CDF of input image');
ylabel('CDF of enhanced image');
title('GREEN channel transfer function');


subplot(1,3,3);
plot(num_pixels(:,7),out_pixels(:,7))
xlabel('CDF of input image');
ylabel('CDF of enhanced image');
title('BLUE channel transfer function');

writeraw(he_im,'he_cdf.raw');
