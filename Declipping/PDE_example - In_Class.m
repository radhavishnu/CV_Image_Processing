clc;
clear all;
close all;

M=randi(4,4);

%M=im2double((imread('cameraman.jpeg')));
%M=rgb2gray(M);

M_x = M(:,[2:end])- M(:,[1:end-1]);
M_xx1 = M_x(:,[2:end])- M_x(:,[1:end-1])
M_xx = M(:,[3:end]) - 2*M(:,[2:end-1]) + M(:,[1:end-2])

M_y = M([2:end],:)- M([1:end-1],:);
M_yy1 = M_y([2:end],:)- M_y([1:end-1],:)
M_yy = M([3:end],:) - 2*M([2:end-1],:) + M([1:end-2],:)


%subplot(1,2,1);imshow(M_xx1);title('Vertical Variations: First Derivative: Twice');
%subplot(1,2,2);imshow(M_xx); title('Vertical Variations : Second Derivative');

%figure;
%subplot(1,2,1);imshow(M_yy1);title('Horizontal Variations: First Derivative: Twice');
%subplot(1,2,2);imshow(M_yy); title('Horizontal Variations : Second Derivative');



