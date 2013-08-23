% Gradient Example

% Original image
img = double(imread('spine.tif'));
[y,x] = size(img);
subplot(2,2,1);
imshow(img, []);
title(sprintf('Original image (%dx%d)', x,y));

% Smooth image
smoothSize = 3;
img1 = conv2(img, 1/(smoothSize^2) * ones(smoothSize));
subplot(2,2,2);
imshow(img1, []);
title('Smoothed image');

% Sobel masks
gx_mask = [-1, -2, -1; 0, 0 , 0; 1, 2, 1];
gy_mask = [-1, 0, 1; -2, 0, 2; -1, 0, 1];


%% Edge detection original image
gx = conv2(img, gx_mask);
gy = conv2(img, gy_mask);
M = sqrt(gx.^2 + gy.^2);


subplot(2,2,3);
imshow(M, []);
title('Edges Original image');

%% Edge detection smoothed image
gx = conv2(img1, gx_mask);
gy = conv2(img1, gy_mask);
M1 = sqrt(gx.^2 + gy.^2);


subplot(2,2,4);
imshow(M1, []);
title('Edges Smoothed image');