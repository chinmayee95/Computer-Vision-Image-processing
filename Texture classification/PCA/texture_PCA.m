function [label_dim_reduced_data,centroids] = texture_PCA(train)

X_data=train';%15x36

for i=1:15
    mean_data(i,:)=mean(X_data(i,:));
    normalised_data(i,:)=X_data(i,:)-mean_data(i,:);
end

[U S V]=svd(normalised_data);

dim_reduced_matrix=U(:,(1:3))*S((1:3),:)*V';

U_dim_reduced=U(:,(1:3));
dimensionality_Reduced_data=U_dim_reduced'*dim_reduced_matrix;

[label_dim_reduced_data centroids]=kmeans(dimensionality_Reduced_data',4);
disp('kmeans clustering on reduced dimenionsality (training data)');disp(label_dim_reduced_data);

plot_pca(dimensionality_Reduced_data,36);
end
