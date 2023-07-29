function [x]=lsinpaintnew(u0,D)
I=u0;
p=find(I==0);
I(p)=NaN;
[he wi]=size(I);

x1=[];

for i=1:he 
    
y=(I(i,:))';

if sum(isnan(y))>0
N = length(y);
n = 1:N;
e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N, N);
k = isfinite(y);                    % k : logical vector, indexes known values

S = speye(N)
disp("bed")
S(~k, :) = []                      % S : sampling matrix

Sc = speye(N);                      % Sc : complement of S
Sc(k, :) = [];

L = sum(~k) ;                       % L : number of missing values

v = -(Sc * (D' * D) * Sc') \ ( Sc * D' * D * S' * y(k));    % v : estimated samples   


x = zeros(N,1);
x(k) = y(k);
x(~k) = v;
else
    x=y;
end
x1=[x1;x'];
end

x2=[];
for i=1:wi   
y=(I(:,i));

if sum(isnan(y))>0
N = length(y);
n = 1:N;
e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N, N);
k = isfinite(y);                    % k : logical vector, indexes known values

S = speye(N);
S(~k, :) = [];                      % S : sampling matrix

Sc = speye(N);                      % Sc : complement of S
Sc(k, :) = [];

L = sum(~k) ;                       % L : number of missing values

v = -(Sc * (D' * D) * Sc') \ ( Sc * D' * D * S' * y(k));    % v : estimated samples   


x = zeros(N,1);
x(k) = y(k);
x(~k) = v;
else
    x=y;
end
x2=[x2 x];
end
 
x=(x1+x2)/2;
