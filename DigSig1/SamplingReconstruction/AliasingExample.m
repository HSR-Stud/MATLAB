% Aliasing Example

tmin = 0;
tmax = 0.005;
t = linspace(tmin, tmax, 400);

% Frequenzen in Hz
f1 = 500;
f2 = 1000;
f3 = 1500;

fs = 1500;

%% Originalfunktion berechnen
fx=@(x) 4 + 3*cos(2*pi*f1.*x) + 2*cos(2*pi*f2.*x) + cos(2*pi*f3.*x);

x = fx(t);
hold off;
plot(t, x);
xlabel('t (seconds)');

%% Sampling Punkte berechnen
T = 1/fs;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
samples = fx(n*T);
hold on;
stem(n*T, samples, 'color', 'black');

%% Calculate Aliased Signal
f1_a = modAlias(f1,fs);
f2_a = modAlias(f2,fs);
f3_a = modAlias(f3,fs);
fx_a=@(x) 4 + 3*cos(2*pi*f1_a.*x) + 2*cos(2*pi*f2_a.*x) + cos(2*pi*f3_a.*x);
x_a = fx_a(t);
hold on
plot(t,x_a, 'Color', 'red');
legend('Original Signal', 'Sampling Points', 'Aliased Signal');