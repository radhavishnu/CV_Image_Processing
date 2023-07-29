clc;
clear all;
close all;

% load 'test.mat';
% I=u0;
% imshow(uint8(I));
% u0=I.*D;
% imshow(uint8(u0));
% imwrite(uint8(u0),'inpaint_img.tif','tif');
% imwrite(D,'img_mask.tif','tif');

u0=double(imread('inpaint_img.tif'));
D=imread('img_mask.tif');
%figure;
%subplot(121); imshow(uint8(u0));
%subplot(122); imshow(D);

[x]=lsinpaintnew(u0,D);

subplot(121);imshow(uint8(u0)); title('Original Image');
subplot(122);imshow((D));title('Mask Image');
figure;
subplot(121);imshow(uint8(u0)); title('Original Image');
subplot(122);imshow(uint8(x));title('Inpainted Image');
