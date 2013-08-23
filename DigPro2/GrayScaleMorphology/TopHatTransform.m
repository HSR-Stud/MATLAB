% Top-hat transform example
% Shading correction of an image

%% Original image
im = imread('rice.png');
[y,x] = size(im);
subplot(1,3,1);
imshow(im);
title(sprintf('Original image (%d x %d)',x,y));


%% open the image
% Structing element (disk, radius 15)
se = strel('disk', 15);
im2 = imopen(im, se);
subplot(1,3,2);
imshow(im2);
title('Opened image (disk, radius 15)');

%% calculate top hat image
% Substract opened image from original
im3 = im - im2;
subplot(1,3,3);
imshow(im3);
title('Top-Hat image');

