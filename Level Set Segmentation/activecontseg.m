clc;
clear all;
close all;

x=imread('cortex.jpg');
x=rgb2gray(x);
imshow(x);

x=double(x);
[row col]=size(x);

phi=ones(row,col);
phi(10:row-10,10:col-10)=-1;

u=-phi;
[c h]=contour(u, [0 0],'r');
title('Initial Contour');

sigma=1;
%G=fspecial('gaussian',5,sigma);
delt=1;
Iter=50;
mu=25;

figure;
for n=1:Iter
    [ux uy]=gradient(u);
    %no of pixels where level set is <0
        c1=sum(sum(x.*(u<0)))/(sum(sum(u<0)));
        c2=sum(sum(x.*(u>=0)))/(sum(sum(u>=0)));
    spf=x-(c1+c2)/2;
    spf=spf/(max(abs(spf(:))));
    u=u+delt*(mu*spf.*sqrt(ux.^2+uy.^2));
        imagesc(x,[0,255]);colormap(gray);hold on;
        [c h]=contour(u,[0 0],'r');
        iternum=[num2str(n),'iterations'];
        title(iternum);
        pause(0.02);
    u=(u>=0)-(u<0);
    u
   % u=conv2(u,G,'same');
end
figure;
imagesc(x,[0,255]); colormap(gray); hold on;
[c h]=contour(u,[0 0], 'b');

    
    
    