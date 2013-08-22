% Dilating and eroding an image

% Original image
im = imread('circbw.tif');
subplot(2,3,1);
imshow(im);
[x,y] = size(im);
title(sprintf('Original image (%dx%d)', x,y));

%% Dilation
% Create a structuring element
se = strel('square', 3);
% Dilate the image with the structuring element
im1 = imdilate(im, se);
subplot(2,3,2);
imshow(im1);
title('Dilated image');

%% Erosion
% Create a structuring element
se = strel('square', 3);
im2 = imerode(im, se);
subplot(2,3,3);
imshow(im2);
title('Eroded image');

%% Erosion und Dilation are dual:
se = strel('square', 3);
im3 = 1 - imerode(1-im, se);
subplot(2,3,5);
imshow(im3);
title('Eroded Background');

im4 = 1 - imdilate(1-im, se);
subplot(2,3,6);
imshow(im4);
title('Dilated Background');