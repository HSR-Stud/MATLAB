% Dilating and eroding an image

% Original image
im = imread('circbw.tif');
subplot(1,3,1);
imshow(im);
title('Original image');

%% Dilation
% Create a structuring element
se = strel('square', 3);
% Dilate the image with the structuring element
im1 = imdilate(im, se);
subplot(1,3,2);
imshow(im1);
title('Dilated image');

%% Erosion
% Create a structuring element
se = strel('arbitrary', eye(5));
im2 = imerode(im, se);
subplot(1,3,3);
imshow(im2);
title('Eroded image');