vartestn(train);
%save the results of vartest mean and std in vertest_data.mat
file = load('vartest_data.mat');
fieldnames(file)
length('unnamed')
unnamed

mean_features = unnamed(:,2)
std_features = unnamed(:,3)

intra_class_var = zeros(15,1);
inter_class_var = zeros(15,1);

for i=1:15
    intra_class_var(i) = std_features(i)^2;
end

for i=1:15
    for j=1:15
        if i~=j
            inter_class_var(i) = inter_class_var(i) + (mean_features(i) - mean_features(j))^2;
        end
    end
end

discri_power = inter_class_var./intra_class_var