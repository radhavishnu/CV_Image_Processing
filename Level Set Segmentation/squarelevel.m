clc;
clear all;
close all;

n=200;

[Y X]=meshgrid(1:n,1:n);

r=n/3;

c=[r r]+30;

usq=r-max(abs(X-c(1)),abs(Y-c(2)));

imagesc(usq);colormap(gray);
hold on;
contour(usq,[0,0],'g','LineWidth',3);

contour(usq,[4,4],'r','LineWidth',3);

contour(usq,[-4,-4],'c','LineWidth',3);

axis ij;
axis off;

