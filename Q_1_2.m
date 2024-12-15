%%Section 1
t = linspace(-0.005, 0.005, 0.01 * 30000);
m = sinc((10 .^ 3) * t) .^ 2;
mFourier = fftshift(fft(m));
mFphase = angle(mFourier);
mFvalue = abs(mFourier);
Fvector1 = linspace(-2000, 2000, 0.01 * 30000);
figure; subplot(3, 1, 1);
plot(t, m);
title('m(t)');
subplot(3, 1, 2);
plot(Fvector, mFphase);
title('Phase');
subplot(3, 1, 3);
plot(Fvector, mFvalue);
title('Magnitude');

%%Section 2
r = m .* cos(2 * pi * (10^5) * t);
plot(t, r);
title('r(t)');
rFourier = fftshift(fft(r));
rFvalue = abs(rFourier);
rFphase = angle(rFourier);
Fvector2 = linspace(-2000, 2000, 0.01 * 30000);
figure; subplot(3, 1, 1);
plot(t, r);
title('r(t)');
subplot(3, 1, 2);
plot(Fvector, rFphase);
title('Phase');
subplot(3, 1, 3);
plot(Fvector, rFvalue);
title('Magnitude');