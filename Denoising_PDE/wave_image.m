clc;
clear all;
close all;

x=imread('lena512.bmp');
x=im2double(x);
x=(imresize(x,[256,256]));

[c l]=wavedec2(x,4,'haar');

a=appcoef2(c,l,'haar',1);
[h v d]=detcoef2('all',c,l,1);

l1=[a h; v d];
imshow(l1);

a=appcoef2(c,l,'haar',2);
[h2 v2 d2]=detcoef2('all',c,l,2);

l2=[a h2; v2 d2];
l2_f=[l2 h; v d];
figure;
imshow(l2_f);
