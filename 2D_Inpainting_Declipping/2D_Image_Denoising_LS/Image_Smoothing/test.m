clc;
clear all; close all;


A1= imread('cameraman.jpeg');
A1=rgb2gray(A1);

A2=imnoise(A1,'gaussian',0,.005);
img=double(A2);
%Have for variyaing lamda and get that graph in paper
lamda=0.9;
output=LS_DEN(img,lamda);
A4= uint8(output);

subplot(1,2,1);
imshow(A2);
title('noisy image')

subplot(1,2,2);
imshow(A4);
title('denoised image')

