clc;
clear all;
close all;

x=imread('lena512.bmp');
x=im2double(x);
x=(imresize(x,[256,256]));

sigma=0.08;
x1 = x + sigma*randn(size(x));
subplot(1,2,1);imshow(x); title('Original Image');
subplot(1,2,2);imshow(x1); title('Noisy Image');

[c l]=wavedec2(x1,4,'haar');
T=2*sigma;

a=appcoef2(c,l,'haar',1);
[h v d]=detcoef2('all',c,l,1);

l1=[a h; v d];

a=appcoef2(c,l,'haar',2);
[h2 v2 d2]=detcoef2('all',c,l,2);

l2=[a h2; v2 d2];
l2_f=[l2 h; v d];

% a=appcoef2(c,l,'haar',3);
% [h3 v3 d3]=detcoef2('all',c,l,3);
% 
% l3=[a h3; v3 d3];
% l3=[l3 h2; v2 d2];
% l3_f=[l3 h; v d];


figure;
imshow(l2_f); title("Wavelet Coefficients")

c1=c.*(abs(c)>T);
x_denoise=waverec2(c1,l,'haar');

figure;
subplot(1,2,1);imshow(x1); title('Noisy Image');
subplot(1,2,2);imshow(x_denoise); title('Denoised Image');

psnr(x,x1)
psnr(x,x_denoise)