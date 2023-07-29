clc;
clear all;
close all;

im=imread('cameraman.jpeg');
im=im2double(rgb2gray(im));

im_noisy=imnoise(im,"gaussian",0.01);
subplot(1,2,1);imshow(im); title('Original Image');
subplot(1,2,2);imshow(im_noisy); title('Noisy Image');

f=1/9*ones(3,3);
D=conv2(im_noisy,f,'same');
figure;
subplot(1,3,1);imshow(im); title('Original Image');
subplot(1,3,2);imshow(im_noisy); title('Noisy Image');
subplot(1,3,3);imshow(D); title('Denoised Image');

