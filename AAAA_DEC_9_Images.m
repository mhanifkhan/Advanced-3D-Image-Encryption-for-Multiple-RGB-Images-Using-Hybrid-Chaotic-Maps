clc;        % clear screen
clear all;      % clear all

tic


img1 = imread('All_Enc_1.tiff');
img2 = imread('All_Enc_2.tiff');
img3 = imread('All_Enc_3.tiff');
img4 = imread('All_Enc_4.tiff');
img5 = imread('All_Enc_5.tiff');
img6 = imread('All_Enc_6.tiff');
img7 = imread('All_Enc_7.tiff');
img8 = imread('All_Enc_8.tiff');
img9 = imread('All_Enc_9.tiff');

% % bigimg = cat(3, img1, img2, img3, img4);
% 
bigimg = cat(3, img1, img2, img3, img4, img5, img6, img7, img8, img9);

% bigimg = imread('Pepper_Salt_noise_01.tiff');

[m,n,p] = size(bigimg);

bigimg = double(bigimg);

Result = DEC9Images(bigimg);  %Function Call

toc

bigimg = Result;

R1 = bigimg(:,:,1);  % Separating Red plan
R1 = uint8(R1);
imshow(R1);
imwrite(R1, 'All_Dec_1.tiff','tiff');

R2 = bigimg(:,:,2);  % Separating Red plan
R2 = uint8(R2);
% imshow(R2);
imwrite(R2, 'All_Dec_2.tiff','tiff');

R3 = bigimg(:,:,3);  % Separating Red plan
R3 = uint8(R3);
% imshow(R3);
imwrite(R3, 'All_Dec_3.tiff','tiff');


R4 = bigimg(:,:,4);  % Separating Red plan
R4 = uint8(R4);
% imshow(R4);
imwrite(R4, 'All_Dec_4.tiff','tiff');

R5 = bigimg(:,:,5);  % Separating Red plan
R5 = uint8(R5);
% imshow(R5);
imwrite(R5, 'All_Dec_5.tiff','tiff');

R6 = bigimg(:,:,6);  % Separating Red plan
R6 = uint8(R6);
% imshow(R6);
imwrite(R6, 'All_Dec_6.tiff','tiff');

R7 = bigimg(:,:,7);  % Separating Red plan
R7 = uint8(R7);
% imshow(R7);
imwrite(R7, 'All_Dec_7.tiff','tiff');

R8 = bigimg(:,:,8);  % Separating Red plan
R8 = uint8(R8);
% imshow(R8);
imwrite(R8, 'All_Dec_8.tiff','tiff');


R9 = bigimg(:,:,9);  % Separating Red plan
R9 = uint8(R9);
% imshow(R9);
imwrite(R9, 'All_Dec_9.tiff','tiff');


 bigimg_all_Dec = [R1,  R2, R3; R4, R5, R6; R7, R8, R9]; % Merging all images to single big image
%  bigimg_all = [img1,  img2; img3, img4]; % Merging all images to single big image
 imwrite(bigimg_all_Dec, 'bigimg_Dec_1024.tiff','tiff');

