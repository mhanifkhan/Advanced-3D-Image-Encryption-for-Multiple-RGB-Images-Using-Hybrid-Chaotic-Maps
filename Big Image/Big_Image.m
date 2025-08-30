clc;        % clear screen
clear all;      % clear all

tic


img1 = imread('1.tiff');
img2 = imread('2.tiff');
img3 = imread('3.tiff');
img4 = imread('4.tiff');
img5 = imread('5.tiff');
img6 = imread('6.tiff');
img7 = imread('7.tiff');
img8 = imread('8.tiff');
img9 = imread('9.tiff');
img10 = imread('10.tiff');



bigimg = [img1,  img2, img3 ; img4, img5, img6; img7, img8, img9 ]; % Merging all images to single big image

bigimg1 = [img1,  img2; img6, img10]; % Merging all images to single big image

imshow(bigimg);

% imwrite(bigimg, 'Big_Image.tiff','tiff');
% 
% imwrite(bigimg1, 'Big_Image1.tiff','tiff');

imwrite(bigimg, 'Big_Image.jpg');

imwrite(bigimg1, 'Big_Image1.jpg');

img1_resized = imresize(img1, [198 198]);

img_resized2 = imresize(bigimg, [256 256]);

img_resized = imresize(bigimg, [128 128]);

img_resized1 = imresize(bigimg1, [128 128]);

% imwrite(img_resized, 'Small_Image.tiff','tiff');
% 
% imwrite(img_resized1, 'Small_Image1.tiff','tiff');
% 

imwrite(img1_resized, 'Small_Img1.jpg');

imwrite(img_resized, 'Small_Image.jpg');

imwrite(img_resized1, 'Small_Image1.jpg');


imwrite(img_resized2, 'Small_Image256.jpg');







