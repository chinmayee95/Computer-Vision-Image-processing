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
testlabel = [3 2 1 3 1 1 2 4 3 2 4 4 ]';

%----------------------------------------------------------------------------------------------------------------------------
%Random forest training
%----------------------------------------------------------------------------------------------------------------------------
X = traindata;
Y = trainlabel;
iNumBags = 36;
str_method = 'classification';

BaggedEnsemble = generic_random_forests(X,Y,36,'classification')
pred_label = predict(BaggedEnsemble,testdata)
pred_labels = cell2mat(pred_label);
pred_labels = str2num(pred_labels);

%accuracy

errors = sum((pred_labels~=testlabel))/12;
accuracy = (1- errors)*100;

disp('Missclassificatons');disp(errors);
disp('Accuracy'); disp(accuracy);
%accuracy is predicted labels-testlabels
%in this case accuracy is 100%