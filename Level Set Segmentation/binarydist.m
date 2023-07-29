clc;
clear all;
close all;

x=imread('cortex.jpg');
x=rgb2gray(x);
imshow(x);
xb=[x>(max(x(:))/10)];

u1=(1-xb).*bwdist(xb);
u2=(xb.*bwdist(1-xb));

u=u1-u2;
figure;
imagesc(u); colormap ('gray'); hold on;
contour(u,[0,0],'g','linewidth',2);
axis off;



