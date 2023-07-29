clc;
clear all;
close all;

u=imread('cameraman.jpeg');
u=rgb2gray(u);
u=imresize(u,[256,256]);
u=im2double(u);
imshow(u); title('Original Cameraman Image');

[m n]=size(u);

ux=(u(:,[2:n,n])-u(:,[1,1:n-1]))/2;
ux1=u(:,[2:n,n])-u(:,[1:n-1,n-1]);
figure; subplot(1,2,1);imshow(ux);title('Partial Derivative-(x,2 diff)');
subplot(1,2,2);imshow(ux1);title('Partial Derivative-(x,unit diff)');

uy=(u([2:m,m],:)-u([1,1:m-1],:))/2;
uy1=u([2:m,m],:)-u([1:m-1,m-1],:);
figure; subplot(1,2,1);imshow(uy);title('Partial Derivative-(y,2 diff)');
subplot(1,2,2);imshow(uy1);title('Partial Derivative-(y,unit diff)');

uxx=u(:,[2:n,n])-2*u + u(:,[1,1:n-1]);
uyy=u([2:m,m],:)-2*u + u([1,1:m-1],:);
% uxy=(u([2:m,m],[2:n,n])+u([1,1:m-1],[1,1:n-1])-u([1,1:m-1],[2:n,n])-u([2:m,m],[1,1:n-1]))/4;
L=uxx+uyy;

figure; subplot(1,2,1);imshow(uxx);title('Partial double Derivative-(x)');
subplot(1,2,2);imshow(uyy);title('Partial double Derivative-(y)');
% figure; imshow(uxy);title('Partial double Derivative-(xy)');
figure; imshow(L);title('Laplacian derivative-PDE');

K=[0 1 0; 1 -4 1; 0 1 0];
L=conv2(u,K,'same');
figure; imshow((L));title('Laplacian derivative-Filter');

L=del2(u);
figure; imshow((L));title('Laplacian derivative-Inbuilt');