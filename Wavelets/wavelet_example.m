clc;
clear all;
close all;

% x=[56 40 8 24 48 48 40 16];
% 
% h0=[1/2,1/2];
% 
% c=conv(x,h0)
% 
% c1=c(2:2:end)
% 
% h1=[-1/2, 1/2];
% 
% d=conv(x,h1);
% 
% d1=d(2:2:end)
% 
% 
% 
% x=[56 40 8 24 48 48 40 16];
% 
% [LO_D,HI_D,LO_R,HI_R] = wfilters('haar')
% 
% c=conv(x,LO_D)
% 
% c1=c(2:2:end);
% 
% d=conv(x,HI_D);
% 
% d1=d(2:2:end);
% 
% wc=[c1 d1]
% 
% [c s]=wavedec(x,1,'haar')
% 
% 
% c1_r=upsample(c1,2);
% 
% d1_r=upsample(d1,2);
% 
% c1_r=conv(c1_r,LO_R);
% 
% d1_r=conv(d1_r,HI_R);
% 
% c1_r+d1_r

x=[56 40 8 24 48 48 40 16];
[c1 s1]=wavedec(x,1,'haar')
[c2 s2]=wavedec(x,2,'haar')