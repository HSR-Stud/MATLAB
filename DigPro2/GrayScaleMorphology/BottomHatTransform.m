% Bottom-hat transform example
% Shading correction of an image

%% Original image
im = imread('rice.png');
[y,x] = size(im);
subplot(1,3,1);
imshow(im);
title(sprintf('Original image (%d x %d)',x,y));


%% close the image
% Structing element (disk, radius 15)
se = strel('disk', 30);
im2 = imclose(im, se);
subplot(1,3,2);
imshow(im2);
title('closed image (disk, radius 15)');

%% calculate bottom hat image
% Substract original image from closed image
im3 = im2 - im;
subplot(1,3,3);
imshow(im3);
title('Bottom-Hat image');