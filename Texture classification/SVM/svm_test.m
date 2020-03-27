%----------------------------------------------------------------------------------------------------------------------------
%TRAIN DATA
%----------------------------------------------------------------------------------------------------------------------------

%read textures from test data
textures = read_textures_train();

%apply laws filters

texture_vector_train = zeros(36,15);

for i=1:36
    texture = cell2mat(textures(i));
    texture_vector_train(i,:) = laws_filtering(N,texture);%36x15
end

%standardization across every data point

for i=1:36
    texture_vector_train_std(i,:)=(texture_vector_train(i,:)-mean(texture_vector_train(i,:)))./std(texture_vector_train(i,:),1);
end

%----------------------------------------------------------------------------------------------------------------------------
%TEST DATA
%----------------------------------------------------------------------------------------------------------------------------

%read textures from test data
textures = read_textures_test();

%apply laws filters

texture_vector_test = zeros(12,15);

for i=1:12
    texture = cell2mat(textures(i));
    texture_vector_test(i,:) = laws_filtering(N,texture);%12x15
end

%standardization across every data point

for i=1:12
    texture_vector_test_std(i,:)=(texture_vector_test(i,:)-mean(texture_vector_test(i,:)))./std(texture_vector_test(i,:),1);
end
%----------------------------------------------------------------------------------------------------------------------------
%blanket -1 brick -2 rice -4 grass -3
%----------------------------------------------------------------------------------------------------------------------------

traindata = texture_vector_train_std;
trainlabel = [1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4]';

testdata = texture_vector_test_std;
testlabel = [3 1 1 2 4 3 2 4 4 2 1 3]';

%----------------------------------------------------------------------------------------------------------------------------
%FITTING THE MODEL
%----------------------------------------------------------------------------------------------------------------------------

SVMModels = cell(4,1);
classes = unique(trainlabel);
for j = 1:numel(classes)
    indx(trainlabel~=j)=-1;indx(trainlabel==j)=1; % Create binary classes for each classifier
    SVMModels{j} = fitcsvm(data,indx,'Standardize',true); % SVMModels is the trained model. save it at end for doing testing
end
save('SVMModels.mat','SVMModels');

%----------------------------------------------------------------------------------------------------------------------------
%TRAINING
%----------------------------------------------------------------------------------------------------------------------------

% train performance
train_label = zeros(size(data,1),numel(classes));
for j = 1:numel(classes)
    label = predict(SVMModels{j},traindata);
    train_label(:,j) = label; % Second column contains positive-class train_label
end
train_label
[~,maxtrain_label] = max(train_label,[],2)
perf=sum(maxtrain_label==trainlabel)/size(maxtrain_label,1) % performance in the range of 0 to 1

%----------------------------------------------------------------------------------------------------------------------------
%TESTING
%----------------------------------------------------------------------------------------------------------------------------

% for testing load the trained model
load('SVMModels.mat');
numclasses = 4;
% testlabel = zeros(12);
testdata = texture_vector_test_std; % take 1 new unknown observation and give to trained model

test_label = zeros(size(testdata,1),numel(classes));
    for j = 1:numel(classes)
        label = predict(SVMModels{j},testdata);
        test_label(:,j) = label; % Second column contains positive-class train_label
    end

test_label
[~,maxtest_label] = max(test_label,[],2)
perf_test=sum(maxtest_label==testLabel)/size(maxtest_label,1) % performance in the range of 0 to 1
%----------------------------------------------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------------------------------------------
