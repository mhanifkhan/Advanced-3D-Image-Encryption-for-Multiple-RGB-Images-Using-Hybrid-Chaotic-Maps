clear;
img = imread('Big_Image.jpg'); % Read image

red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
% double format
red=double(red);
green=double(green);
blue=double(blue);

for i = 1: 80
    for j = 1: 170
        red(20 + j, 20 + i) = 255;
    end
end

for i = 1: 80
    for j = 1: 170
        green(20 + j, 20 + i) = 255;
    end
end

for i = 1: 80
    for j = 1: 170
        blue(20 + j, 20 + i) = 255;
    end
end

%image making
 I(:,:,1)= red;
 I(:,:,2)= green;
 I(:,:,3)= blue;

 I1 = uint8(I);
  figure
 imshow(I1);
 imwrite(I1,'lena_dl_out.tiff','tiff');
