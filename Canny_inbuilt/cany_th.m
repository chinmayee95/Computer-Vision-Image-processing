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


out = edge(gray_in,'canny',[0.1 0.3]);
% k=1;
% for i=1:r
%     for j=1:c
%         o(k) = out(i,j);
%         k=k+1;
%     end
% end
imshow(out)
writeraw(out,'canny_th.raw');