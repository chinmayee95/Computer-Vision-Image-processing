function [label_dim_reduced_data] = texture_PCA_test(test,cent_pca)

X_data=test';%15x36

for i=1:15
    mean_data(i,:)=mean(X_data(i,:));
    normalised_data(i,:)=X_data(i,:)-mean_data(i,:);
end

[U S V]=svd(normalised_data);

dim_reduced_matrix=U(:,(1:3))*S((1:3),:)*V';

U_dim_reduced=U(:,(1:3));
dimensionality_Reduced_data=U_dim_reduced'*dim_reduced_matrix;

label_dim_reduced_data=kmeans(dimensionality_Reduced_data',4,'MaxIter',1,'Start',cent_pca);
% label_dim_reduced_data=kmeans(dimensionality_Reduced_data',4);
% disp('Centroids PCA applied test data:');disp(centroids);

disp('kmeans clustering on reduced dimenionsality (testing data)');disp(label_dim_reduced_data);

plot_pca(dimensionality_Reduced_data,12);
end
