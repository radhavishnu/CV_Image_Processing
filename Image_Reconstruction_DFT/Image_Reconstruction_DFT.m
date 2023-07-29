% This program is written for simple 2 D FFT for image reconstruction without %using fft2 and ifft2 matlab inbuilt function
clc
close all
clear all
 
f =im2double(imread('Lena512.png'));
imshow((f));

f1=fft2(f);
f2=ifft2(f1);

figure;
imshow(f2);
 
[M, N] = size(f);
wM        = zeros(M, M);
wN        = zeros(N, N);
 
for u = 0 : (M - 1)
    for x = 0 : (M - 1)
        wM(u+1, x+1) = exp(-2 * pi * 1i / M * x * u);
    end    
end
 
for v = 0 : (N - 1)
    for y = 0 : (N - 1)
        wN(y+1, v+1) = exp(-2 * pi * 1i / N * y * v);
    end    
end
 
F = wM * f * wN;

%% INVERSE FOURIER TRANSFORM
[M, N] = size(F);
wM        = zeros(M, M);
wN        = zeros(N, N);
 
for x = 0 : (M - 1)
    for u = 0 : (M - 1)
        wM(x+1,u+1) = exp(2 * pi * 1i / M * x * u);
    end    
end
 
for y = 0 : (N - 1)
    for v = 0 : (N - 1)
        wN( v+1,y+1) = exp(2 * pi * 1i / N * y * v);
    end    
end
 
g= (1/(M*N))*( wM * F * wN);
figure;
imshow(g);


%https://www.researchgate.net/publication/307607352_Matlab_codes_for_2_d_DFT_without_using_fft2_and_ifft2

%http://faculty.salina.k-state.edu/tim/mVision/freq-domain/image_DFT.html
