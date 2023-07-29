clc;
clear all;
close all;

a1=imread('time1.bmp');
a1=rgb2gray(a1);
a2=imread('time2.bmp');
a2=rgb2gray(a2);
imshow(a1);
figure;
imshow(a2);
a1=im2double(a1);
a2=im2double(a2);
c1=a1(:);
c2=a2(:);
c3=[c1,c2];
cm=cov(c3);
[v,d]=eig(cm);
if(d(1,1)>d(2,2))
    
    s1=v(:,1)/sum(v(:,1));
    
else
    
    s1=v(:,2)/sum(v(:,2));
end 

s2=((a1*s1(1,1))+(a2*s1(2,1)));
    
figure
imshow((s2))
    
    

    
