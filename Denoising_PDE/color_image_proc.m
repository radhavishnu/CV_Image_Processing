clc;
clear all;
close all;

i=imread('lena_color.jpg');
imshow(i);
i=im2double(i);
% f=[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
f=[0 1 0; 1 -4 1; 0 1 0];
i1=zeros(size(i));
i1(:,:,1)=conv2(i(:,:,1),f,'same');
i1(:,:,2)=conv2(i(:,:,2),f,'same');
i1(:,:,3)=conv2(i(:,:,3),f,'same');

figure;
imshow(i1);

