
clc;        % clear screeon
clear all;      % clear all

% Histogrmas

 I = imread('AA_Encrypted.tiff');
 
 img = double(img);

R = img(:,:,1);  % Separating Red plan
G = img(:,:,2);  % Separating Green plan
B = img(:,:,3);  % Separating Blue plan


 
%I=imread('out.png');
% 
% I=double(I);
% figure
% histogram(I,256,'EdgeColor','b','FaceColor','g');


figure
hist(I(:,:,1),256,'EdgeColor','r','FaceColor','r');
title('Red Channel');

figure
histogram(I(:,:,2),256','EdgeColor','g','FaceColor','g');
title('Green Channel');

figure
histogram(I(:,:,3),256','EdgeColor','b','FaceColor','b');
title('Blue Channel');

