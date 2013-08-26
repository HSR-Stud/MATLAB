% Marr Hilderth Algorithm

%% Settings:
sigma = 4;
laplacian = [1 1 1; 1 -8 1; 1 1 1];

%% Bild laden
I = double(imread('cameraman.tif'));
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
mask = conv2(mask,laplacian, 'same');

%% Bild mit gesamtem LoG Filter falten und Zero-Crossing berechnen
tic
I2 = ZeroCrossing(conv2(I, mask, 'same'));
toc

subplot(2,2,2);
imshow(I2);

%% Bild mit 4 1-D Faltungen Segmentieren
nabX = [1 -2 1];
nabY = nabX';

tic
Itemp = conv2(conv2(I,Gx, 'same'), Gy, 'same');
I3 = ZeroCrossing(conv2(Itemp, nabX, 'same') + conv2(Itemp, nabY, 'same'));
toc

subplot(2,2,4);
imshow(Itemp, []);

subplot(2,2,3);
imshow(I3);