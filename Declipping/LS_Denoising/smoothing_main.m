%% Least squares smoothing 

clc;
clear all;
close all;

%% Load data

load data.txt;

y = data;         % data value
N = length(y);


%% Smoothing (degree = 2)
% D is the second-order difference matrix.
% It approximates the second-order derivative.
% In order to exploit fast banded solvers in Matlab,
% we define D as a sparse matrix using 'spdiags'.

e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);
full(D);
%%
% Observe the first and last corners of D.
% (D is too big to display, so we show
% the first and last corners only.)

%%
% First corner of D:

%full(D(1:5, 1:5));

%%
% Last corner of D:

%full(D(end-4:end, end-4:end));

%%
% Solve the least square problem

lam = 1.7;                            % Matlab uses a fast solver for banded systems)

F = (speye(N)) +lam*(D' * D);% F is a banded matrix

x = F \ y;  


%figure;
subplot(2,1,1);plot(y);title('Data');
grid('on')
subplot(2,1,2);plot(x);title('Least squares smoothing')
grid('on');
