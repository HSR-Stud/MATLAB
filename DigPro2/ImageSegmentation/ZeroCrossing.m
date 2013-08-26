function [ ZC ] = ZeroCrossing( I )
%ZeroCrossing Get all the Zero-Crossings of Image I

[Ix, Iy] = size(I);
ZC = zeros(Ix,Iy);
for a = 2:Ix-1
    for b = 2:Iy-1
        value = (sign(I(a-1,b-1)) * sign(I(a+1, b+1))) + (sign(I(a-1,b)) * sign(I(a+1, b))) + (sign(I(a,b-1)) * sign(I(a, b+1))) + (sign(I(a+1,b-1)) * sign(I(a-1, b+1)));
        if(value < 0)
            ZC(a,b) = 1;
        end;        
    end
end
end

