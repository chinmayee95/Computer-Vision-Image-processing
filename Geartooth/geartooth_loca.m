% freq_label =
% 
%      1    65
%      2    28
%      3   271
%      4   279
%      5     1
%      6     1
%      7     1
%      8     1
%      9    56
%     10    26
%     11    22
%     12     1


% %     1    65
% %      2     0
% %      3     0
% %      4     0
% %      5     0
% %      6    28
% %      7     0
% %      8   271
% %      9     0
% %     10     0
% %     11   279
% %     12     0
% %     13     0
% %     14     0
% %     15     0
% %     16     0
% %     17     0
% %     18     0
% %     19     0
% %     20     0
% %     21     0
% %     22     0
% %     23     0
% %     24     0
% %     25     0
% %     26     0
% %     27     0
% %     28     0
% %     29     0
% %     30     0
% %     31     0
% %     32     0
% %     33     0
% %     34     0
% %     35     0
% %     36     0
% %     37     0
% %     38     0
% %     39     0
% %     40     0
% %     41     0
% %     42     0
% %     43     1
% %     44     1
% %     45     1
% %     46     1
% %     47     0
% %     48     0
% %     49     0
% %     50     0
% %     51     0
% %     52     0
% %     53     0
% %     54     0
% %     55     0
% %     56    56
% %     57     0
% %     58    26
% %     59     0
% %     60     0
% %     61    22
% %     62     0
% %     63     0
% %     64     0
% %     65     0
% %     66     0
% %     67     0
% %     68     0
% %     69     0
% %     70     0
% %     71     0
% %     72     0
% %     73     0
% %     74     1
% label_freq_matrix
location = zeros(4,2);
for i=1:row
    for j=1:col
        if label_matrix(i,j)==43
            location(1,1) = i;
            location(1,2) = j;
        end
        if label_matrix(i,j)==44
            location(2,1) = i;
            location(2,2) = j;
        end
        if label_matrix(i,j)==45
            location(3,1) = i;
            location(3,2) = j;
        end
        if label_matrix(i,j)==46
            location(4,1) = i;
            location(4,2) = j;
        end
    end
end

disp('Centres of the 4 black circle locations');
disp(location);

x_cent = sum(location(:,1))/4.0;
y_cent = sum(location(:,2))/4.0;
centre = [x_cent y_cent];
% Centres of the 4 black circle locations
%     84    94
%     93   167
%    156    85
%    165   157

disp('Centre of the gearwheel');
disp(centre);

% Centre of the gearwheel
%   124.5000  125.7500

x_cent = round(x_cent);
y_cent = floor(y_cent);
centre = [x_cent y_cent];

disp('Centre of the gearwheel after rounding');
disp(centre);

% i=(y_cent);
% while i<row
% i=i+1;
% end
radius = row-y_cent;
diameter = 2*radius;
disp('outside diameter');
disp(diameter);

%the circle is divided into 12 parts
%the angle between each part is 30degrees
%sin and cos positions obtained and added/subtracted from the center accordingly

sin30_radius = radius*sind(30);
sin60_radius = radius*sind(60);
cos30_radius = radius*cosd(30);
cos60_radius = radius*cosd(60);

y_dist60 = cos60_radius;
y_dist30 = cos30_radius;
x_dist60 = sin60_radius;
x_dist30 = sin30_radius;


gear_location = zeros(12,2);
% for i=1:12
%     gear_location(i,:,:) = i;
% end

 i=1;
    gear_location(i,1) = x_cent - x_dist60;
    gear_location(i,2) = y_cent + y_dist60;
 i=i+1;  
    gear_location(i,1) = x_cent - x_dist30;
    gear_location(i,2) = y_cent + y_dist30;
 i=i+1;   
    gear_location(i,1) = x_cent ;
    gear_location(i,2) = y_cent+radius;
 i=i+1;    
    gear_location(i,1) = x_cent + x_dist30;
    gear_location(i,2) = y_cent + y_dist30;
 i=i+1;   
    gear_location(i,1) = x_cent + x_dist60;
    gear_location(i,2) = y_cent + y_dist60;
 i=i+1;   
    gear_location(i,1) = x_cent+radius ;
    gear_location(i,2) = y_cent+radius;
 i=i+1;    
    gear_location(i,1) = x_cent + x_dist60;
    gear_location(i,2) = y_cent - y_dist60;
 i=i+1;    
    gear_location(i,1) = x_cent + x_dist30;
    gear_location(i,2) = y_cent - y_dist30;
 i=i+1;    
    gear_location(i,1) = x_cent ;
    gear_location(i,2) = y_cent-radius;
 i=i+1;   
    gear_location(i,1) = x_cent - x_dist30;
    gear_location(i,2) = y_cent - y_dist30;
 i=i+1;    
    gear_location(i,1) = x_cent - x_dist60;
    gear_location(i,2) = y_cent - y_dist60;
 i=i+1;    
    gear_location(i,1) = x_cent-radius ;
    gear_location(i,2) = y_cent-radius;
    
% disp('gear_location');
% disp(gear_location);

disp('Present gear locations');
for i=1:12
    if i==3|i==8
        continue;
    else
        disp(round(gear_location(i,:)));
    end
end

%missing location 3 and 8
disp('Missing gear locations');
disp(round(gear_location(3,:)));
disp(round(gear_location(8,:)));

% for i=1:12
%     image(gear_location(i,:))=1;
% end