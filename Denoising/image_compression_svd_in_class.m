clc;
clear all;
close all;

im=imread('cameraman.jpeg');
im=im2double(rgb2gray(im));
[m,n]=size(im);
[u s v]= svd(im);


out=u(:,1)*s(1,1)*v(:,1)';


subplot(1,2,1);imshow(im); title('Original Image');
subplot(1,2,2);imshow(out);title('Compressed Image');

