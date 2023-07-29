function u=heat(u0)
dt=0.1;
T=20;
u0=double(u0);
u=u0;
for t=0:dt:T
u=u+dt*del2(u);
subplot(121); imshow(uint8(u0)); title('Original image');
subplot(122);imshow(uint8(u)); title(['Time t=', num2str(t)]);
colormap gray; drawnow;
end