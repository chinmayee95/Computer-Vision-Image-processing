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
% tune_out = tuning(gray_out,204);

writeraw(normalised_out,'Dogs_norm_sobel.raw');
% writeraw(normalised_x,'Dogs_normx_sobel.raw');
% writeraw(normalised_y,'Dogs_normy_sobel.raw');

%histogram


hist=zeros(1,256);
% [r c]=size(gray_out);
s=r*c;
for i=1:r
  for j=1:c
      int_val=round(normalised_out(i,j));
      hist(int_val+1)=hist(int_val+1)+1;
   end
end
hist_P=hist./s; %Normalized Histogram(PDF)
     
cdf=zeros(1,256);
  for j=1:length(cdf)
       if(j ==1)
       cdf(j)=hist(j);
       else
       cdf(j)=hist(j)+cdf(j-1);         
       end
  end
 
cdf = cdf/s;
cdf = round(cdf,2);
% threshold = 90;
val =  .9*cdf(j);
flag = 1;
i=1;
while flag
    if(cdf(i)==(val))
        break;
    else
        i=i+1;
        flag = 1;
    end
end
  
writeraw(gray_in,'Dogs_gray_input.raw');
writeraw(normalised_x,'Dogs_normx_sobel.raw');
writeraw(normalised_y,'Dogs_normy_sobel.raw');
writeraw(gray_out,'Dogs_sobel.raw');
% writeraw(tune_out,'Dogs_sobel_tune.raw');

% threshold_80 = percentile(gray_out,80);
threshold_85 = tuning(gray_out,(i));
% threshold_90 = percentile(gray_out,90);
% threshold_95 = percentile(gray_out,95);
% 
% writeraw(threshold_95,'Dogs_threshold_95.raw');
% writeraw(threshold_80,'Dogs_threshold_80.raw');
writeraw(threshold_85,'Dogs_threshold_85.raw');

% imshow(unit8(threshold_85));
% writeraw(threshold_90,'Dogs_threshold_90.raw');

%performance evaluation


%% detect edge and visualize results
I = imread('Dogs.jpg');
tic, E=threshold_85 ; toc
imshow(E);
% E = imcomplement(E);
for j=1:5
[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,'Dogs_GT.mat',j);
R = cntR./sumR;
P = cntP./sumP;
cnt=0;
for i=1:length(R)
    if R(i)==0
        break;
    else
        cnt = cnt + 1;
    end
end
recall = sum(R(1:cnt))/cnt;
precision = sum(P(1:cnt))/cnt;
F = (recall*precision*2)/(recall+precision);
out = [j precision recall F];
disp(out);

end
