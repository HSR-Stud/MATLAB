% Originalbild
I = imread('pout.tif');

tSize = 200;
dX = 40;
dY = 70;

% Bildausschnitte wählen und mit Noise überlagern
I1 = I(1:tSize, 1:tSize);
I1 = imnoise(I1, 'gaussian', 0, 0.001);
subplot(2,4,1);
imshow(I1);
title('Bildausschnitt 1');

I2 = I(dY+1:tSize+dY, dX+1:tSize+dX);
I2 = imnoise(I2, 'gaussian', 0, 0.001);
subplot(2,4,2);
imshow(I2);
title('Bildausschnitt 2');

% Fouriertransformierte
F1 = fft2(I1);
subplot(2,4,5);
imshow(log(abs(F1)), []);
title('Fouriertransformierter Ausschnitt 1');

F2 = fft2(I2);
subplot(2,4,6);
imshow(log(abs(F2)), []);
title('Fouriertransformierter Ausschnitt 2');

% cross-power spectrum
F3 = (F1.*conj(F2))./(abs(F1.*conj(F2)));
subplot(2,4,7);
imshow(log(abs(F3)), []);
title('Spektrum Kreuzprodukt');

% Rücktransformation
I3 = ifft2(F3);
subplot(2,4,3);
imshow(I3, []);
title('Rücktransformierte des Kreuzprodukt');

% Weisser Punkt in der Rücktransformation finden
[y,x] = find(I3 == max(I3(:)))

% Array erstellen in dem beide Bilder Platz haben
I4 = zeros(tSize+y, tSize+x);
I4(1:tSize, 1:tSize) = I1;
I4(y+1:y+tSize, x+1:x+tSize) = I2;


subplot(2,4,4)
imshow(I4, []);
title('Zusammengesetztes Bild');



