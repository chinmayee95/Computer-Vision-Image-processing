function [ out ] = canny_threshold( image , t1, t2 )
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here

I = readraw(image);

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


out = edge(gray_in,'canny',[t1 t2],1.4);

% for i=1:r
%     for j=1:c
%         if (out(i,j)>128)
%             out1(i,j) = 0;
%         else
%             out1(i,j) = 255;
%             
%         end
%     end
% end

% k=1;
% for i=1:r
%     for j=1:c
%         o(k) = out(i,j);
%         k=k+1;
%     end
% end

end

