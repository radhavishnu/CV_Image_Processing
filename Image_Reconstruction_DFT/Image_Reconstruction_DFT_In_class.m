% simple 2D FFT for image reconstruction using fft2 and ifft2 matlab inbuilt function
clc
close all
clear all
 
f =im2double(imread('Lena512.png'));
imshow((f));

f1=fft2(f);
f2=ifft2(f1);

figure;
imshow(f2);
 

%http://faculty.salina.k-state.edu/tim/mVision/freq-domain/image_DFT.html
