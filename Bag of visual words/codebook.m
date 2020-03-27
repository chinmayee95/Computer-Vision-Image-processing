% --------------------------------------------------------------------
%                                                    Create image pair
% --------------------------------------------------------------------

Ia = imread('/Users/chinmayees/Documents/MATLAB/HW4_image/Husky_1.jpg') ;
Ib = imread('/Users/chinmayees/Documents/MATLAB/HW4_image/Husky_2.jpg') ;
Ic = imread('/Users/chinmayees/Documents/MATLAB/HW4_image/Husky_3.jpg') ;
Id = imread('/Users/chinmayees/Documents/MATLAB/HW4_image/Puppy_1.jpg') ;

% --------------------------------------------------------------------
%                                                     Extract features
% --------------------------------------------------------------------

[fa,da] = vl_sift(im2single(rgb2gray(Ia))) ;
[fb,db] = vl_sift(im2single(rgb2gray(Ib))) ;
[fc,dc] = vl_sift(im2single(rgb2gray(Ic))) ;
[fd,dd] = vl_sift(im2single(rgb2gray(Id))) ;

% --------------------------------------------------------------------
%                                                              K-means
% --------------------------------------------------------------------

[idxa,Ca] = kmeans(double(da'),8);
[idxb,Cb] = kmeans(double(db'),8);
[idxc,Cc] = kmeans(double(dc'),8);
[idxd,Cd] = kmeans(double(dd'),8);

% --------------------------------------------------------------------
%                                                           codebook
% --------------------------------------------------------------------

descriptors = [da'; db'; dd'];
[idx,Centroids] = kmeans(double(descriptors),8);

% --------------------------------------------------------------------
%                                                    nearest-neighbour
% --------------------------------------------------------------------
dim = size(Centroids);
siz = dim(2);

codeword_img1 = zeros(siz);
codeword_img2 = zeros(siz);
codeword_img3 = zeros(siz);
codeword_img4 = zeros(siz);

codeword_img1 = dist_norm_l2(double(da'), Centroids);
codeword_img2 = dist_norm_l2(double(db'), Centroids);
codeword_img3 = dist_norm_l2(double(dc'), Centroids);
codeword_img4 = dist_norm_l2(double(dd'), Centroids);

% --------------------------------------------------------------------
%                                                           error-rates
% --------------------------------------------------------------------

error_rate_1 = match_codewords(codeword_img1,codeword_img3);
error_rate_2 = match_codewords(codeword_img2,codeword_img3);
error_rate_3 = match_codewords(codeword_img4,codeword_img3);

minimum_1=min(error_rate_1,error_rate_2);
minimum_2=min(minimum_1,error_rate_3);
minimum_imum=minimum_2;

% --------------------------------------------------------------------
%                                                               results
% --------------------------------------------------------------------

disp('Error Rates :');
disp('Error Rate 1 :');disp(error_rate_1);
disp('Error Rate 2 :');disp(error_rate_2);
disp('Error Rate 3 :');disp(error_rate_3);

if (minimum_imum==error_rate_1)
    disp('Husky 3 is close to Husky 1');
end
if (minimum_imum==error_rate_2)
    disp('Husky 3 is close to Husky2');
end
if (minimum_imum==error_rate_3)
    disp('Husky 3 is close to Puppy');
end
