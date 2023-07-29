clc;
clear all;
close all;

n=200;

[Y X]=meshgrid(1:n,1:n);

r=n/3;

c=[r r]+30;

ucirc=r-(sqrt((X-c(1)).^2+(Y-c(2)).^2));

imagesc(ucirc);colormap(gray);
hold on;
%Oth level set function taken value 0 for diff x y
contour(ucirc,[0,0],'g','LineWidth',3);
%4 th level set
contour(ucirc,[4,4],'r','LineWidth',3);
%-4 th level set
contour(ucirc,[-4,-4],'c','LineWidth',3);

axis ij;
axis off;

