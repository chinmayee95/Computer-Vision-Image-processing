% Im(:,:,1) = rimage;
% Im(:,:,2) = gimage;
% Im(:,:,3) = bimage;

row = 720;
col = 480;

k=1;
for i=1:row
    for j=1:col
        rimage(i,j) = image_raw(k);
        gimage(i,j) = image_raw(k+1);
        bimage(i,j) = image_raw(k+2);
        k = k + 3;
    end
end

I(:,:,1) = rimage;
I(:,:,2) = gimage;
I(:,:,3) = bimage;

image_left=readraw('left.raw');

k=1;
for i=1:row
    for j=1:col
        left_rimage(i,j) = image_left(k);
        left_gimage(i,j) = image_left(k+1);
        left_bimage(i,j) = image_left(k+2);
        k = k + 3;
    end
end

left_I(:,:,1) = left_rimage;
left_I(:,:,2) = left_gimage;
left_I(:,:,3) = left_bimage;


image_right=readraw('right.raw');

k=1;
for i=1:row
    for j=1:col
        right_rimage(i,j) = image_right(k);
        right_gimage(i,j) = image_right(k+1);
        right_bimage(i,j) = image_right(k+2);
        k = k + 3;
    end
end

right_I(:,:,1) = right_rimage;
right_I(:,:,2) = right_gimage;
right_I(:,:,3) = right_bimage;

rows = 2*row;
cols = 4*col;
image_new = zeros(2*row,4*col,3);
% image_new(16:16+row-1,123:123+col-1,1:3) = I;
image_new(200:200+row-1,316:316+col-1,1:3) = I;
image_new_left = zeros(1440,723);

hleft = (hleft);
for x=1:rows
    for y=1:cols
        i = round((hleft(1,1)*x+hleft(1,2)*y+hleft(1,3))/(hleft(3,1)*x + hleft(3,2)*y + hleft(3,3)));
        j = round((hleft(2,1)*x+hleft(2,2)*y+hleft(2,3))/(hleft(3,1)*x + hleft(3,2)*y + hleft(3,3)));
        if(i>0 & i<=row & j>0 & j<=col)
            image_new_left(x,y,1) = left_I(i,j,1);
            image_new_left(x,y,2) = left_I(i,j,2);
            image_new_left(x,y,3) = left_I(i,j,3);
        end
    end
end
image_new(200:1640-1,330:330+723-1,1:3) = image_new_left;

image_new_right = zeros(1400,660);

hright = inv(hright);
for x=1:rows
    for y=1:cols
        i = round((hright(1,1)*x+hright(1,2)*y+hleft(1,3))/(hright(3,1)*x + hright(3,2)*y + hright(3,3)));
        j = round((hright(2,1)*x+hright(2,2)*y+hright(2,3))/(hright(3,1)*x + hright(3,2)*y + hright(3,3)));
        offsetx=0;
        offsety = 0;
        if(i>0 & i<=row & j>0 & j<=col)
            image_new_right(offsetx+x,offsety+y,1) = right_I(i,j,1);
            image_new_right(offsetx+x,offsety+y,2) = right_I(i,j,2);
            image_new_right(offsetx+x,offsety+y,3) = right_I(i,j,3);
        end
    end
end
image_new(200:1600-1,440:440+660-1,:) = image_new_right;
image_new(200:200+row-1,416:416+col-1,1:3) = I;


% hright=[ 1.0082   -0.0225 -158.3440;
%    -0.0357    1.0833  -14.1725;
%     ;0.0000 0.0000 1.0000]; %Homography matrix 

% for i=1:new_r
%     for j=1:new_c
%         a=[i,j,1];
%         W=1/((Hinv(3,1)*i)+(Hinv(3,2)*j)+Hinv(3,3));
%         b=Hinv.*a;
%         
%         x=b(1)/W;
%         y=b(2)/W;
% hright = inv(hright);        
% for x=1:rows
%     for y=1:cols
%         i = round(hright(1,1)*x+hright(1,2)*y+hright(1,3));
%         j = round(hright(2,1)*x+hright(2,2)*y+hright(2,3));
%         if(i>0 & i<=col & j>0 & j<=row)
%             offset_x=250;
%             offset_y=300;
%             image_new(offset_y+y,offset_x+x,1) = right_I(j,i,1);
%             image_new(offset_y+y,offset_x+x,2) = right_I(j,i,2);
%             image_new(offset_y+y,offset_x+x,3) = right_I(j,i,3);
% %             image_new(162+x,500+y,1) = right_I(i,j,1);
% %             image_new(162+x,500+y,2) = right_I(i,j,2);
% %             image_new(162+x,500+y,3) = right_I(i,j,3);
%         end
%     end
% end

% image_new = left_insertion(image_new,left_I);
% image_new = right_insertion(image_new,right_I);
% image_new = middle_insertion(image_new,I);

imshow(uint8(image_new));

k=1;
for i=1:rows
    for j=1:cols
        image_h(k) = image_new(i,j,1);
        image_h(k+1) = image_new(i,j,2);
        image_h(k+2) = image_new(i,j,3);
        k=k+3;
    end
end
writeraw(image_h,'homography.raw');