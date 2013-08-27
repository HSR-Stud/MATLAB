% Boundary Extraction in a Binary Image

%% Load the image
I = uint8(imread('circles.png'));
[Ix, Iy] = size(I);
subplot(2,2,1);
imshow(I, []);
title('Original Bild');

% Eigene Implemetation von imerode(I, strel('square', 3));
Ieroded = zeros(Ix,Iy, 'uint8');
for x=2:Ix-2
    for y=2:Iy-2
        if all(I(x-1:x+1, y-1:y+1) == 1) 
            Ieroded(x,y) = 1;
        end
    end
end

subplot(2,2,2);
imshow(Ieroded, []);
title('Erroded image');

overlay = I + Ieroded;
subplot(2,2,3);
imshow(overlay, []);
title('Overlay of the Original image and the erroded image')

% Boundary Extraction
I2 = I - Ieroded;

subplot(2,2,4);
imshow(I2, []);
title('Boundary');