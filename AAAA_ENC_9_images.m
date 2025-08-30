clc;        % clear screeon
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

 bigimg_all = [img1,  img2, img3; img4, img5, img6; img7, img8, img9]; % Merging all images to single big image
%  bigimg_all = [img1,  img2; img3, img4]; % Merging all images to single big image
 imwrite(bigimg_all, 'bigimg_1024.tiff','tiff');

% bigimg = cat(3, img1, img2, img3, img4);
bigimg = cat(3, img1, img2, img3, img4, img5, img6, img7, img8, img9);


% bigimg(100, 100, 2) = 200;



bigimg = uint8(bigimg);
bigimgorg = bigimg;   %Use to calculate entropy of orignal image

[m,n,p] = size(bigimg);
bigimg = double(bigimg);

Result = ENC9Images(bigimg);  %Function Call


time = toc;


% figure
% % histogram(bigimg(:,:,1),256,'EdgeColor','r','FaceColor','r')
% % set(gca,'FontSize',17);
% histogram(Defuse,256)
% histogram(bigimg,256)
% set(gca,'FontSize',17);
% 

Defuse = Result;

bi = Defuse;


variancee = var(bi(:));
varianceall = sprintf('%.4f',variancee)
variance = floor(variancee);

% % % Entropy of the Orignal Image
bigimgorg = uint8(bigimgorg);
ERorg = vpa(entropy(bigimgorg));
ERRorg = entropy(bigimgorg);

% % % Entropy of the Encrypted Image
bi = uint8(bi);
ER = vpa(entropy(bi));
ERR = entropy(bi);
Entropy = [ERRorg, ERR, variance,  time]


R1 = Defuse(:,:,1);  % Separating Red plan
R1 = uint8(R1);
% imshow(R1);
imwrite(R1, 'All_Enc_1.tiff','tiff');

R2 = Defuse(:,:,2);  % Separating Red plan
R2 = uint8(R2);
% imshow(R2);
imwrite(R2, 'All_Enc_2.tiff','tiff');

R3 = Defuse(:,:,3);  % Separating Red plan
R3 = uint8(R3);
% imshow(R3);
imwrite(R3, 'All_Enc_3.tiff','tiff');


R4 = Defuse(:,:,4);  % Separating Red plan
R4 = uint8(R4);
% imshow(R4);
imwrite(R4, 'All_Enc_4.tiff','tiff');

R5 = Defuse(:,:,5);  % Separating Red plan
R5 = uint8(R5);
% imshow(R5);
imwrite(R5, 'All_Enc_5.tiff','tiff');

R6 = Defuse(:,:,6);  % Separating Red plan
R6 = uint8(R6);
% imshow(R6);
imwrite(R6, 'All_Enc_6.tiff','tiff');

R7 = Defuse(:,:,7);  % Separating Red plan
R7 = uint8(R7);
% imshow(R7);
imwrite(R7, 'All_Enc_7.tiff','tiff');

R8 = Defuse(:,:,8);  % Separating Red plan
R8 = uint8(R8);
% imshow(R8);
imwrite(R8, 'All_Enc_8.tiff','tiff');

R9 = Defuse(:,:,9);  % Separating Red plan
R9 = uint8(R9);
% imshow(R9);
imwrite(R9, 'All_Enc_9.tiff','tiff');

bigDefused_all = [R1, R2, R3; R4, R5, R6;R7, R8, R9]; % Merging all images to single big image
imshow(bigDefused_all);
imwrite(bigDefused_all, 'bigDefused_1024.tiff','tiff');
% imwrite(bigDefused_all, 'bigDefused_PixelChanged.tiff','tiff');

