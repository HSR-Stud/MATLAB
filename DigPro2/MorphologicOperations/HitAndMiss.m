% Hit-and-Miss example

%% Original image
im = imread('circbw.tif');
subplot(1,3,1);
imshow(im);
title('Original image');

%% Hit-and-Miss implementation
% Easier solution: use bwhitmiss() ...

% This extracts all bottom left corners
SEHit = strel('arbitrary', [0 1 0; 0 1 1; 0 0 0]);
SEMiss = strel('arbitrary', [0 0 0; 1 0 0; 1 1 0]);
% Hit-and-Miss
im1 = imerode(im, SEHit) & imerode(~im, SEMiss);

subplot(1,3,2);
imshow(im1);
title('Hit-and-Miss: bottom left corners');

% Extract all top right corners
SEHit = strel('arbitrary', [0 0 0; 1 1 0; 0 1 0]);
SEMiss = strel('arbitrary', [1 1 0; 0 0 1; 0 0 0]);
% Hit-and-Miss mit vorherigem Bild verknüpfen
im2 = imerode(im, SEHit) & imerode(~im, SEMiss);

subplot(1,3,3);
imshow(im2);
title('Hit-and-Miss: top right corners');