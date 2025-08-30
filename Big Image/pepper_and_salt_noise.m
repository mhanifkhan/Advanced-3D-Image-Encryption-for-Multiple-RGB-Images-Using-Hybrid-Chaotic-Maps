clear;
% img1 = imread('Lena_out.tiff'); % Read image
% j = imnoise(img1, 'salt & pepper', 0.001);
%  %figure
%  imshow(j);
%  imwrite(j,'Lena_pas_out.tiff','tiff');
%  
 
%  img2 = imread('Baboon_out.tiff'); % Read image
% jj = imnoise(img2, 'salt & pepper', 0.01);
%  %figure
%  imshow(jj);
%  imwrite(jj,'Baboon_pas_out.tiff','tiff');
 
% img3 = imread('Big_Image.jpg'); % Read image
% jjj = imnoise(img3, 'salt & pepper', 0.1);
%  %figure
%  imshow(jjj);
%  imwrite(jjj,'Big_Image_SP4.jpg');
 


img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.05);
 %figure
 imshow(jjj);
 imwrite(jjj,'Small_Image_SP05.jpg');
 

img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.1);
imwrite(jjj,'Small_Image_SP1.jpg');

 
img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.2);
imwrite(jjj,'Small_Image_SP2.jpg');
 

img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.25);
imwrite(jjj,'Small_Image_SP25.jpg');


img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.3);
imwrite(jjj,'Small_Image_SP3.jpg');
 

img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.35);
imwrite(jjj,'Small_Image_SP35.jpg');
 


img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.4);
imwrite(jjj,'Small_Image_SP4.jpg');
 



img3 = imread('Small_Image.jpg'); % Read image
jjj = imnoise(img3, 'salt & pepper', 0.45);
imwrite(jjj,'Small_Image_SP45.jpg');
 