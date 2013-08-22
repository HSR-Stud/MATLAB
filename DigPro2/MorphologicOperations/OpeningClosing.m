% Opening and Closing an image

% Original image
im = imread('circles.png');
subplot(2,3,1);
imshow(im);
[x,y] = size(im);
title(sprintf('Original image (%dx%d)', x,y));

% Structing element
se = strel('square', 10);

%% Opening
% Erroded image
im1 = imerode(im, se);
% Opened image
im2 = imdilate(im1, se);

subplot(2,3,2);
imshow(im1); title('Eroded image');
subplot(2,3,3);
imshow(im2); title('Opened image');

%% Closing
% Dilate image
im1 = imdilate(im, se);
% Close image
im2 = imerode(im1, se);

subplot(2,3,5);
imshow(im1);
title('Dilated image');
subplot(2,3,6);
imshow(im2);
title('Closed image');