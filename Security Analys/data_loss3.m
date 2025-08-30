clear;
img = imread('tree_out.tiff'); % Read image

red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
% double format
red=double(red);
green=double(green);
blue=double(blue);

for i = 1: 256
    for j = 1: 128
        red(j, i) = 255;
    end
end

for i = 1: 256
    for j = 1: 128
        green(j, i) = 255;
    end
end

for i = 1: 256
    for j = 1: 128
        blue(j, i) = 255;
    end
end

%image making
 I(:,:,1)= red;
 I(:,:,2)= green;
 I(:,:,3)= blue;

 I1 = uint8(I);
  figure
 imshow(I1);
 imwrite(I1,'tree_dl_out.tiff','tiff');
