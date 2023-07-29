clc;
clear all;
close all;

u=imread('cameraman.jpeg');
u=imresize(u,[256,256]);
imshow(u); title('Original Cameraman Image');
u=heat(u);