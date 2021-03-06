%Name : Chinmayee Siddaramaiah
%USC ID : 7919894350
%USC mail : siddaram@usc.edu
%Submission date : 01/28/2020



%read the input raw image
I = readraw('Dog.raw');

%dimensions of the input image
% r = 600;
% c = 532;

n=600;
m=532;
j=1;

k=1;
for i=1:532
    for j=1:600
        image(i,j) = I(k);
        k=k+1;
    end
end

%based on bayer's pattern (RGGB) store the values of red green and blue sensors
%values

% for i=1:n
%     for j=1:m
%         
%         %condition for the red pixel location
%         if (mod(i+1,2) & mod(j,2) == 0)
%             red_ch(i,j) = 0;
%             green_ch(i,j) = 0;
%             blue_ch(i,j) = image(i,j);
%         
%         %condition for the blue pixel location    
%         elseif (mod(i,2)==0 & mod(j+1,2)==0)
%             red_ch(i,j) = image(i,j);
%             green_ch(i,j) = 0;
%             blue_ch(i,j) = 0;
%         
%         %green pixel location
%         else 
%             red_ch(i,j) = 0;
%             green_ch(i,j) = image(i,j);
%             blue_ch(i,j) = 0;
%         end
%     end
% end

% filter

%filter size
f_size = 5;

f_half = (f_size-1)/2;

%create output matrix with padding 

%create a zero matrix with new dimensions
out = zeros(m+f_size-1,n+f_size-1);

%fit the input image within the padding
% for i=1:n
%     for j=1:m
%         out(i+f_half,j+f_half) = image(i,j);
%     end
% end

%padding/reflecting the boundaries
% out = zeros(n+f_size-1,m+f_size-1);

out(f_half+1:m+f_half,f_half+1:n+f_half) = image;

%reflecting the boundary pixels

out(f_half,f_half+1:n+f_half)=out(f_half+1,f_half+1:n+f_half);
out(m+f_half+1,f_half+1:n+f_half)=out(m+f_half,f_half+1:n+f_half);

out(:,f_half)=out(:,f_half+1);
out(:,n+f_half+1)=out(:,n+f_half);


%interpolation

for i = 2:m+1
%     sprintf('%d',i-1)
    for j = 2:n+1
%         sprintf('%d',j-1)
        %condition for red location
        if (mod(i,2)==0 & mod(j+1,2)==0)
            [r g b] = red(out,i,j);
            red_ch(i-1,j-1) = r;
            green_ch(i-1,j-1) = g;
            blue_ch(i-1,j-1) = b;
            
        %condition for blue location
        elseif (mod(i+1,2)==0 & mod(j,2)==0)
            [r g b] = blue(out,i,j);
            red_ch(i-1,j-1) = r;
            green_ch(i-1,j-1) = g;
            blue_ch(i-1,j-1) = b;
            
             %condition for green location
        elseif (mod(i,2)==0 & mod(j,2)==0)
            [r g b] = green_even_rows(out,i,j);
            red_ch(i-1,j-1) = r;
            green_ch(i-1,j-1) = g;
            blue_ch(i-1,j-1) = b;
            
        elseif (mod(i+1,2)==0 & mod(j+1,2)==0)
            [r g b] = green_odd_rows(out,i,j);
            red_ch(i-1,j-1) = r;
            green_ch(i-1,j-1) = g;
            blue_ch(i-1,j-1) = b;
        end
    end
end
   
demosaiced_bilinear_interpolation(1:m,1:n,1)=red_ch(1:m,1:n);
demosaiced_bilinear_interpolation(1:m,1:n,2)=green_ch(1:m,1:n);
demosaiced_bilinear_interpolation(1:m,1:n,3)=blue_ch(1:m,1:n);

out = raw_3d(demosaiced_bilinear_interpolation);

      
        
        
        
