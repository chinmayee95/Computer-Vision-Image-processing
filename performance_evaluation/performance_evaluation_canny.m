%EE 569 Homework Assignment#2
%Date: 02/16/2019
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem : Edge detection
%Implementation: Canny edge detector

edge_dog = canny_threshold('Dogs.raw',0.1,0.3);
imshow(imcomplement(edge_dog));
writeraw(imcomplement(edge_dog),'canny_th_dog.raw');

edge_gallery = canny_threshold('Gallery.raw',0.1,0.3);
imshow(imcomplement(edge_gallery));
writeraw(imcomplement(edge_gallery),'canny_th_gallery.raw');



%% detect edge and visualize results
% I = imread('Dogs.jpg');
% tic, E=edge_dog; toc
% 
% for j=1:5
% [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,'Dogs_GT.mat',j);
% R = cntR./sumR;
% P = cntP./sumP;
% cnt=0;
% for i=1:length(R)
%     if R(i)==0
%         break;
%     else
%         cnt = cnt + 1;
%     end
% end
% recall = sum(R(1:cnt))/cnt;
% precision = sum(P(1:cnt))/cnt;
% F = (recall*precision*2)/(recall+precision);
% out = [j precision recall F];
% disp(out);
% 
% end

I = imread('Gallery.jpg');
tic, E=edge_gallery; toc

for j=1:5
[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,'Gallery_GT.mat',j);
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