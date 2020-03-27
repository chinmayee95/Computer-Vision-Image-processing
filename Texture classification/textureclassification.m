%EE 569 HW 4
%Name: Chinmayee Siddaramaiah
%ID: 7919894350
%email: siddaram@usc.edu
%--------------------------------------
%Problem :  Texture Analysis
%Implementation: Texture Classification
%M-file name: texture_classification.m
%---------------------------------------

clear all;
clc;

%filter size
N=5;

%------------------------------------------------------------
%TRAINING DATA
%------------------------------------------------------------
%read textures from train data
textures = read_textures_train();

%apply laws filters

texture_vector = zeros(36,15);

for i=1:36
    texture = cell2mat(textures(i));
    texture_vector(i,:) = laws_filtering(N,texture);%36x15
end

%standardization across every data point

for i=1:36
    texture_vector_std(i,:)=(texture_vector(i,:)-mean(texture_vector(i,:)))./std(texture_vector(i,:),1);
end

% k-means without PCA
train = texture_vector_std;  %36x15

[predicted_labels cent_train] = kmeans(train,4);
disp('kmeans clustering (inbuilt) on training data');disp(predicted_labels);
disp('Centroids kmeans inuilt on train data:');disp(cent_train);

pred_label = k_means_clustering(train,4);
disp('kmeans clustering (self) on training data');disp(pred_label);

% PCA
[label_dim_reduced_data cent_pca] = texture_PCA(train);

%--------------------------------------------------------------------------------------------------------
% TEST DATA
%--------------------------------------------------------------------------------------------------------

%read textures from train data
textures_test = read_textures_test();

%apply laws filters

texture_vector_test = zeros(12,15);

for i=1:12
    texture_test = cell2mat(textures_test(i));
    texture_vector_test(i,:) = laws_filtering(N,texture_test);%12x15
end

%standardization across every data point

for i=1:12
    texture_vector_std_test(i,:)=(texture_vector_test(i,:)-mean(texture_vector_test(i,:)))./std(texture_vector_test(i,:),1);
end

% k-means without PCA
test = texture_vector_std_test;  %12x15
% [~,idx_test]
% [~,predicted_labels_test] = pdist2(cent_train,test,'euclidean','Smallest',1);
predicted_labels_test=kmeans(test,4,'MaxIter',1,'Start',cent_train);
disp('kmeans clustering (inbuilt) on test data');disp(predicted_labels_test);

%PCA
pred_labels_test=texture_PCA_test(test,cent_pca);
disp('k means on PCA used test data');disp(pred_labels_test');

% testlabel = [3 1 1 2 4 3 2 4 4 2 1 3]';
