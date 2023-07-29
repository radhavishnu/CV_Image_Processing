%Signal Approximation Using Wavelets and Fourier Coefficents
clc;
clear all;
close all;

n=256; 
axis([1 n 0 1]); %sets scaling for the x- and y-axes on the current plot.
x=MakeSignal('Piece-Regular',n); %load the original signal
x=rescale(x,0.05,0.95); 

[c s]=wavedec(x,4,'haar'); %four level wavelet decomposition of the signal using haar wavelet
c(81:256)=0; %except the first eighty coefficients the rest are made zero
r=waverec(c,s,'haar') ; %wavelet reconstruction of the signal
z=(fft(x)); %compute fourier transform of the original signal

z(81:256)=0; %except the first eighty coefficients the rest are made zero
rf=real(ifft(z)); %compute inverse fourier transform of the signal
subplot(3,1,1);plot(x);title('Original signal');
subplot(3,1,2);plot(r);title('Wavelet reconstructed signal');
subplot(3,1,3);plot(rf);title('fourier reconstructed signal');

sw=psnr(x,r); %calculate snr value for wavelet reconstructed signal
sprintf('The signal to noise ratio of the Wavelet reconstructed signal =%6.4f',sw)
sf=psnr(x,rf); %calculate snr value for fourier reconstructed signal
sprintf('The signal to noise ratio of the fourier reconstructed signal =%6.4f',sf)
