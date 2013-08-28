% Marr Hilderth Algorithm

%% Settings:
sigma = 8;
laplacian = [1 1 1; 1 -8 1; 1 1 1];

laplacian = [
     0    -1     0;
    -1     4    -1;
     0    -1     0;
     ];

%% Bild laden
I = double(imread('coins.png'));
[Ix, Iy] = size(I);
maskSize = floor(ceil((6 * sigma))/2)*2 + 1;
subplot(2,2,1);
imshow(I, []);

%% Filter (mask) LoG und Vektoren Gx und Gy generieren
mask = zeros(maskSize,maskSize);
Gx = zeros(maskSize, 1);
for a = 1:maskSize
    x = a - round(maskSize / 2);
    Gx(a) = exp(-x^2/(2*sigma^2));
    for b = 1:maskSize        
        y = b - round(maskSize / 2);
        mask(a,b) = exp(-(x^2+y^2)/(2*sigma^2));
    end
end
Gy = Gx';

mask = conv2(mask, laplacian);
tic
%% Bild mit gesamtem LoG Filter falten und Zero-Crossing berechnen
I2 = ZeroCrossing(conv2(I, mask));
br = floor(size(mask,1)/2);
I2 = I2(br+1:end-br, br+1:end-br);
toc

subplot(2,2,2);
imshow(I2);

%% Bild mit 4 1-D Faltungen Segmentieren
nabX = [1 -2 1];
nabY = nabX';

tic
Itemp = conv2(conv2(I,Gx), Gy);
I3 = ZeroCrossing((conv2(Itemp, nabX,'same') + conv2(Itemp, nabY,'same')));
toc

br = floor(size(Gx,1)/2);
subplot(2,2,4);
Itemp = Itemp(br+1:end-br, br+1:end-br);
imshow(Itemp, []);

subplot(2,2,3);
I3 = I3(br+1:end-br, br+1:end-br);
imshow(I3);
