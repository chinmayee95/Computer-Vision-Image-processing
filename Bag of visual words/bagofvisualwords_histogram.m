% ----------------------------------------------------------------

% ----------------------------------------------------------------
feature_vector=[da'];
k=8;
[idx,C]=kmeans(double(feature_vector),k);
centroid_location_a=C';

%Histograms

X=[da'];

label1=0;
label2=0;
label3=0;
label4=0;
label5=0;
label6=0;
label7=0;
label8=0;

[m n]=size(X);

for i=1:m
    if (idx(i)==1)
        label1=label1+1;
    elseif (idx(i)==2)
        label2=label2+1;
    elseif (idx(i)==3)
        label3=label3+1;
    elseif (idx(i)==4)
        label4=label4+1;
    elseif (idx(i)==5)
        label5=label5+1;
    elseif (idx(i)==6)
        label6=label6+1;
    elseif (idx(i)==7)
        label7=label7+1;
    elseif (idx(i)==8)
        label8=label8+1;
    end
end

X=[1 2 3 4 5 6 7 8];
Y=[label1 label2 label3 label4 label5 label6 label7 label8];
figure(1);
bar(X,Y,0.05);
title('Histogram for Bag of visual words for Husky_1');
xlabel('Number of centroids (classes) in the training codebook');
ylabel('Total count for each class');

% ---------------------------------------------------------------

% ---------------------------------------------------------------

feature_vector=[db'];
k=8;
[idx,C]=kmeans(double(feature_vector),k);
centroid_location_b=C';

%Histograms

X=[db'];

label1=0;
label2=0;
label3=0;
label4=0;
label5=0;
label6=0;
label7=0;
label8=0;

[m n]=size(X);

for i=1:m
    if (idx(i)==1)
        label1=label1+1;
    elseif (idx(i)==2)
        label2=label2+1;
    elseif (idx(i)==3)
        label3=label3+1;
    elseif (idx(i)==4)
        label4=label4+1;
    elseif (idx(i)==5)
        label5=label5+1;
    elseif (idx(i)==6)
        label6=label6+1;
    elseif (idx(i)==7)
        label7=label7+1;
    elseif (idx(i)==8)
        label8=label8+1;
    end
end

X=[1 2 3 4 5 6 7 8];
Y=[label1 label2 label3 label4 label5 label6 label7 label8];
figure(2);
bar(X,Y,0.05);
title('Histogram for Bag of visual words for Husky_2');
xlabel('Number of centroids (classes) in the training codebook');
ylabel('Total count for each class');
% ---------------------------------------------------------------

% ---------------------------------------------------------------

feature_vector=[dc'];
k=8;
[idx,C]=kmeans(double(feature_vector),k);
centroid_location_c=C';

%Histograms

X=[dc'];

label1=0;
label2=0;
label3=0;
label4=0;
label5=0;
label6=0;
label7=0;
label8=0;

[m n]=size(X);

for i=1:m
    if (idx(i)==1)
        label1=label1+1;
    elseif (idx(i)==2)
        label2=label2+1;
    elseif (idx(i)==3)
        label3=label3+1;
    elseif (idx(i)==4)
        label4=label4+1;
    elseif (idx(i)==5)
        label5=label5+1;
    elseif (idx(i)==6)
        label6=label6+1;
    elseif (idx(i)==7)
        label7=label7+1;
    elseif (idx(i)==8)
        label8=label8+1;
    end
end

X=[1 2 3 4 5 6 7 8];
Y=[label1 label2 label3 label4 label5 label6 label7 label8];
figure(3);
bar(X,Y,0.05);
title('Histogram for Bag of visual words for Husky_3');
xlabel('Number of centroids (classes) in the training codebook');
ylabel('Total count for each class');

% ---------------------------------------------------------------

% ---------------------------------------------------------------

feature_vector=[dd'];
k=8;
[idx,C]=kmeans(double(feature_vector),k);
centroid_location_d=C';

%Histograms

X=[dd'];

label1=0;
label2=0;
label3=0;
label4=0;
label5=0;
label6=0;
label7=0;
label8=0;

[m n]=size(X);

for i=1:m
    if (idx(i)==1)
        label1=label1+1;
    elseif (idx(i)==2)
        label2=label2+1;
    elseif (idx(i)==3)
        label3=label3+1;
    elseif (idx(i)==4)
        label4=label4+1;
    elseif (idx(i)==5)
        label5=label5+1;
    elseif (idx(i)==6)
        label6=label6+1;
    elseif (idx(i)==7)
        label7=label7+1;
    elseif (idx(i)==8)
        label8=label8+1;
    end
end

X=[1 2 3 4 5 6 7 8];
Y=[label1 label2 label3 label4 label5 label6 label7 label8];
figure(4);
bar(X,Y,0.05);
title('Histogram for Bag of visual words for Puppyy_1');
xlabel('Number of centroids (classes) in the training codebook');
ylabel('Total count for each class');

% ----------------------------------------------------------------

% ----------------------------------------------------------------
