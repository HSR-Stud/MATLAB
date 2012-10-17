% Aufgabe:
% Ein Bild laden und davon 100 Versionen mit verschiedenem
% additivem Rauschen erstellen. Über alle Bilder den Mittelwert
% berechnen und sehen was passiert.
clear all;

% Bild laden, Colormap festlegen, Grösse bestimmen
I = imread('pout.tif');
colormap('gray');
[x,y] = size(I);

% Originalbild anzeigen
figure(1);
subplot(2,2,1);
imagesc(I, [0,255]);
title('Original Bild');

anzahlBilder = 100;

images = zeros(x,y,anzahlBilder);

for i = 1:100
    images(:,:,i) = imnoise(I, 'gaussian');
end

J = mean(images, 3);

subplot(2,2,3);
imagesc(images(:,:,1), [0,255]);
title('Bild mit Rauschen 1');

subplot(2,2,4);
imagesc(images(:,:,2), [0,255]);
title('Bild mit Rauschen 2');


subplot(2,2,2);
imagesc(J, [0,255]);
title('Rekonstruiertes Bild');
    