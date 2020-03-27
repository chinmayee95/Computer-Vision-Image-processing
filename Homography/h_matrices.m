clc;
clear;

% Read the first image from the image set.
image_raw=readraw('middle.raw');

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

%convert to gray image
gray_middle = 0.2989 * rimage + 0.5870 * gimage + 0.1140 * bimage;
gray_middle = double(gray_middle)/255;
% I = double(I)/255;
image_left=readraw('left.raw');

row = 720;
col = 480;

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

%convert to gray image
gray_left = 0.2989 * left_rimage + 0.5870 * left_gimage + 0.1140 * left_bimage;
gray_left = double(gray_left)/255;

image_right=readraw('right.raw');

row = 720;
col = 480;

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

%convert to gray image
gray_right = 0.2989 * right_rimage + 0.5870 * right_gimage + 0.1140 * right_bimage;
gray_right = double(gray_right)/255;

% Initialize features for I(1)
% grayImage_middle = rgb2gray(I);
points = detectSURFFeatures(gray_middle);
[features, points] = extractFeatures(gray_middle, points);

    % Store points and features for I(n-1).
    pointsPrevious = points;
    featuresPrevious = features;
    % Detect and extract SURF features for I(n).
    points_left = detectSURFFeatures(gray_left);    
    [featuresleft, points_left] = extractFeatures(gray_left, points_left);
  
    % Find correspondences between I(n) and I(n-1).
    indexPairs_left = matchFeatures(featuresleft, featuresPrevious, 'Unique', true);
       
    matchedPoints_left = points_left(indexPairs_left(:,1), :);
    matchedPointsPrevleft = pointsPrevious(indexPairs_left(:,2), :);        
    
    P11 = matchedPoints_left.Location;
    P21 = matchedPointsPrevleft.Location;
    a=1;
    b=2;
    c=3;
    d=4;
    hleft = [P11(a,2) P11(b,2) P11(c,2) P11(d,2);P11(a,1) P11(b,1) P11(c,1) P11(d,1);1 1 1 1]/[P21(a,2) P21(b,2) P11(c,2) P21(d,2);P21(a,1) P21(b,1) P21(c,1) P21(d,1);1 1 1 1];
    
%     hleft = [P1(:,1)' ;P1(:,2)' ;ones(size(P1',2),1)]/[P2(:,1)' ;P2(:,2)' ;ones(size(P1',2),1)]
    % Detect and extract SURF features for I(n).
    points_right = detectSURFFeatures(gray_right);    
    [featuresright, points_right] = extractFeatures(gray_right, points_right);
  
    % Find correspondences between I(n) and I(n-1).
    indexPairs_right = matchFeatures(featuresright, featuresPrevious, 'Unique', true);
       
    matchedPoints_right = points_right(indexPairs_right(:,1), :);
    matchedPointsPrevright = pointsPrevious(indexPairs_right(:,2), :);
    
    P21 = matchedPoints_right.Location;
    P22 = matchedPointsPrevright.Location;
%     a=5;
%     b=15;
%     c=31;
%     d=48;
    hright = [P21(a,2) P21(b,2) P21(c,2) P21(d,2);P21(a,1) P21(b,1) P21(c,1) P21(d,1);1 1 1 1]/[P22(a,2) P22(b,2) P21(c,2) P22(d,2);P22(a,1) P22(b,1) P22(c,1) P22(d,1);1 1 1 1];
% figure; showMatchedFeatures(uint8(I),uint8(left_I),matchedPointsPrevleft,matchedPoints_left);

%     pts = cpselect(uint8(left_I),uint8(I));
    
%     hright = [P2(:,1)' ;P2(:,2)'; ones(size(P1',2),1)]/[P1(:,1)' ;P1(:,2)' ;ones(size(P1',2),1)]
% figure; showMatchedFeatures(uint8(left_I),uint8(I),matchedPoints_left,matchedPointsPrevleft);


% ,matchedPoints_left.Location,matchedPointsPrevleft.Location);


% tforms(1) = estimateGeometricTransform(matchedPoints_left, matchedPointsPrevleft,...
%         'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);
%  
% tforms(2) = estimateGeometricTransform(matchedPoints_right, matchedPointsPrevright,...
%         'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);
%     
%     % Compute T(n) * T(n-1) * ... * T(1)
% tforms(n).T = tforms(n).T * tforms(n-1).T;
% 
% % Compute the output limits  for each transform
% for i = 1:numel(tforms)           
%     [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);    
% end
% 
% avgXLim = mean(xlim, 2);
% 
% [~, idx] = sort(avgXLim);
% 
% centerIdx = floor((numel(tforms)+1)/2);
% 
% centerImageIdx = idx(centerIdx);
% 
% Tinv = invert(tforms(centerImageIdx));
% 
% for i = 1:numel(tforms)    
%     tforms(i).T = tforms(i).T * Tinv.T;
% end
% 
% 
% for i = 1:numel(tforms)           
%     [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);
% end
% 
% maxImageSize = max(imageSize);
% 
% % Find the minimum and maximum output limits 
% xMin = min([1; xlim(:)]);
% xMax = max([maxImageSize(2); xlim(:)]);
% 
% yMin = min([1; ylim(:)]);
% yMax = max([maxImageSize(1); ylim(:)]);
% 
% % Width and height of panorama.
% width  = round(xMax - xMin);
% height = round(yMax - yMin);
% 
% % Initialize the "empty" panorama.
% panorama = zeros([height width 3], 'like', I);
% 
% blender = vision.AlphaBlender('Operation', 'Binary mask', ...
%     'MaskSource', 'Input port');  
% 
% % Create a 2-D spatial reference object defining the size of the panorama.
% xLimits = [xMin xMax];
% yLimits = [yMin yMax];
% panoramaView = imref2d([height width], xLimits, yLimits);
% 
% % Create the panorama.
% for i = 1:numImages
%     
%     I = readimage(buildingScene, i);   
%    
%     % Transform I into the panorama.
%     warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);
%                   
%     % Generate a binary mask.    
%     mask = imwarp(true(size(I,1),size(I,2)), tforms(i), 'OutputView', panoramaView);
%     
%     % Overlay the warpedImage onto the panorama.
%     panorama = step(blender, panorama, warpedImage, mask);
% end
% 
% figure
% imshow(panorama)
