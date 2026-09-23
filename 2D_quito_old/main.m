% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.

% -------------------------------------------------------------------------
% Primary Contributors: 
% - Rihan Aaron D'Silva, Indian Institute of Technology Bombay
% - Siddhartha Ganguly, Indian Institute of Technology Bombay
% Refer the article: S. Ganguly, N. Randad, D. Chatterjee, and R. Banavar
% Constrained trajectory synthesis via quasi-interpolation, 
% IEEE Conference on Decision & Control, 2022, Cancun, Mexico
% -------------------------------------------------------------------------
clear all;
close all;
clc;

%% Set-up and solve problem

problem = lunarLanding;          % Fetch the problem definition
opts = options(100, 2);        % Get options and solver settings (N,D),  
                               %where step size h=(tf-t0)/N
solution = solveProblem(problem, opts);

%% Save solution as csv

L = 3000; g = 1.625; T = sqrt(L/g); M = 100;
l = 1; J = 60;
V = L/T; F = M*g;
Trot = T*sqrt(J/(M*l*L));

% scale(i) divides state i; x5 (angle) has scale 1
scale  = [L L V V 1 Trot M T];
uscale = [F 1];   % u1 divided by F, u2 (angle) unscaled

X_out = full(solution.output.value(solution.X))' .* scale;
tau_out = solution.tau;
U_out = zeros(length(tau_out), problem.nu);
for i = 1:length(tau_out)
    U_out(i,:) = full(solution.output.value(solution.U_hat(tau_out(i))))' .* uscale;
end

writematrix(X_out', 'X_traj.csv');   % each row = one time node, columns = x1..x8
writematrix(U_out', 'U_traj.csv');   % each row = one time node, columns = u1, u2
writematrix(tau_out', 'tau.csv');

%% Post-processing

postProcess(solution, problem, opts)
