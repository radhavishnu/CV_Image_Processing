%https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/9554/versions/5/previews/
%numerical-tour/denoising_linear/index.html

clc;
clear all;
close all;

name = 'Piece-Regular';
n = 1024;
x0 = MakeSignal(name,n);
x0 = rescale(x0);


sigma = .04; % noise level
x = x0 + sigma*randn(size(x0));
clf;
subplot(2,1,1);
plot(x0); axis([1 n -.05 1.05]);
subplot(2,1,2);
plot(x); axis([1 n -.05 1.05]);

mu = 4;
% compute a Gaussian filter of width mu
t = (-length(x)/2:length(x)/2-1)';
h = exp( -(t.^2)/(2*mu^2) );
h = h/sum(h(:));
h=h';

% Fourier transform of the (centered) filter
hf = real( fft(fftshift(h)) );
hf = fftshift(hf);
% display
figure;
subplot(2,1,1);
plot( t,h  ); axis('tight');
title('Filter h');
subplot(2,1,2);
plot( t,hf  ); axis('tight');
title('Fourier transform');


% Fourier coefficients of the noisy signal
xf = fft(x);
% Fourier coefficients of the denoised signal
xhf = xf .* fft(fftshift(h));
% Denoised signal
xh = real( ifft(xhf) );

figure;
subplot(2,1,1);
plot( t,x  ); axis('tight');
title('Noisy');
subplot(2,1,2);
plot( t,xh  ); axis('tight');
title('Denoised');


% log of Fourier transforms
epsilon = 1e-10;
L0 = log10(epsilon+abs(fftshift(fft(x0))));
L = log10(epsilon+abs(fftshift(xf)));
Lh = log10(epsilon+abs(fftshift(xhf)));


% display Fourier transforms
figure;
subplot(2,1,1);
plot( t, L, '-' );
axis([-length(x)/2 length(x)/2 -4 max(L)]);
title('log of noisy Fourier coefs.');
subplot(2,1,2);
plot( t, Lh, '-' );
axis([-length(x)/2 length(x)/2 -4 max(L)]);
title('log of denoised Fourier coefs.');

