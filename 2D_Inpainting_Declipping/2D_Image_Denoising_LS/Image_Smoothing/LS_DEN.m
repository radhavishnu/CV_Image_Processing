function [ output ] = LS_DEN( img,lamda )

y=img;
[M,N]= size(y);
e = ones(M, 1);
D = spdiags([e -2*e e], 0:2, M, M);
D1 = spdiags([e -2*e e], 0:2, N, N);
%% Solve the least square problem
 
   
    lam=lamda;
    F = speye(M) + lam * (D'*D);
    F1 = speye(N) + lam * (D1'*D1);
    x = F \ y; 
    x1 = F1 \ x'; 
    output=x1';


end

