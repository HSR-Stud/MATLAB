function [ f_a ] = modAlias(f, fs )
%modAlias Modulo Operator zur Berechnung der Aliasing Frequenz bei einer
%bestimmten Sampling Frequenz.
%   Diese Funktion mapt die Frequenz f in das Nyquist-Interval
%   [-fs/2,fs/2].
f_a = f;
while abs(f_a) > fs/2
   if f_a > 0
       f_a = f_a - fs;
   else
       f_a = f_a + fs;
   end
end
end

