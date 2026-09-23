%% Problem formulation
function [problem] = lunarLanding
% Template problem
%
% Syntax:  [problem] = TemplateProblem
%
% Outputs:
%    problem - Structure with information on the optimal control problem

%------------- BEGIN CODE --------------
% Set system dynamics
problem.dynamicsFunc = @dynamics;

% Set Lagrange cost (Stagewise cost) to be minimized
problem.stageCost = @stageCost;

% Set Mayer cost (Terminal cost)
problem.terminalCost = @terminalCost;

% Settings file
problem.settings = @settings;

% Initial time. t0<tf. NOTE: t_0 has to be zero.
problem.time.t0 = 0; 

% Final time. tf is fixed.
problem.time.tf = 1;

% Number of states.
problem.nx = 10;

% Number of inputs.
problem.nu = 2;

% Scale factors
M = 100;
Lt = 3000;
Lr = 1;
Tt = 24.807;
Tr = 1.5;
Tm = 1123.049;

xscale = [Lt Lt (Lt/Tt) (Lt/Tt) 1 (1/Tr) M Tt];
uscale = [(M*Lt/Tt^2) (M*Lt/Tt^2)];

% Initial conditions for system. Bounds if x0 is free s.t. x0l=< x0 <=x0u
% If fixed, x0l == x0u
problem.states.x0l = [500 3000 -10 -60 0 0 100 0.2] ./ xscale; % Lower bound on initial state
problem.states.x0u = [500 3000 -10 -60 0 0 100 500] ./ xscale; % Upper bound on initial state

% State bounds. xl=< x <=xu
problem.states.xl = [-inf 0 -inf -inf -pi/4 -pi/6 10 0.1] ./ xscale; % Lower bound on state
problem.states.xu = [inf inf inf inf pi/4 pi/6 100.0001 inf] ./ xscale; % Upper bound on state

% Terminal state bounds. xfl=< xf <=xfu. If fixed: xfl == xfu
problem.states.xfl = [-inf 0 0 0 0 0 10 0.1] ./ xscale; % Lower bound on final state
problem.states.xfu = [inf 0 0 0 0 0 100.0001 inf] ./ xscale; % Upper bound on final state

% Input bounds
problem.inputs.ul = [0 -250] ./ uscale; % Lower bound on control
problem.inputs.uu = [250 250] ./ uscale; % Upper bound on control

% Bounds on the first control action
problem.inputs.u0l = [0 0] ./ uscale; % Lower bound on initial control
problem.inputs.u0u = [0 0] ./ uscale; % Upper bound on initial control

N_guess = 101;
x0 = problem.states.x0u;
xf_guess = [0 0 0 0 0 0 50/M 122/T];
problem.guess.states = zeros(problem.nx, N_guess);
for k_ = 1:problem.nx
    problem.guess.states(k_,:) = linspace(x0(k_), xf_guess(k_), N_guess);
end
problem.guess.inputs = repmat([100/F; 0], 1, N_guess);

%-------------- END CODE ---------------
end


%% System dynamics
function [dx] = dynamics(x,u,t)
% Problem dynamics
%
% Syntax:  
%          [dx] = Dynamics(x,u,t)	(Dynamics Only)
% 
% Inputs:
%    x  - state vector
%    u  - input vector
%    t  - time
%
% Output:
%    dx - time derivative of x
%
%------------- BEGIN CODE --------------

% g = 1.625 m/s²
% J = 100 kg-m², l = 1 m
% Isp = 325 s, g0 = 9.81 m/s²

g = 1.625 / (Lt/Tt^2);
Isp = 325 / Tm;
g0 = 9.81 / (Lt/Tt^2);
J = 60 / (M * Lr^2);
l = 1 / Lr;

dx1 = x(8) * x(3);
dx2 = x(8) * x(4);
dx3 = x(8) * (u(1) * cos(x(5)) + u(2) * sin(x(5))) / x(7);
dx4 = x(8) * (-g + (-u(1) * sin(x(5)) + u(2) * cos(x(5))) / x(7));
dx5 = x(8) * x(6) * (Tt / Tr);
dx6 = x(8) * (-u(1) * l / J) * (Lt / Lr) * (Tr / Tt); 
dx7 = x(8) * (-sqrt(u(1)^2 + u(2)^2) / (Isp * g0)) * (Tt / Tm); 
dx8 = 0;

dx = [dx1; dx2; dx3; dx4; dx5; dx6; dx7; dx8];

%-------------- END CODE ---------------
end


%% Cost functions

function lag = stageCost(x,u,t)
% Lagrange cost to be minimized
%
% Syntax:  
%          [lag] = stageCost(x,u,t)	(stageCost Only)
% 
% Inputs:
%    x  - state vector
%    u  - input
%    t  - time
%
% Output:
%    lag - stage wise cost (lagrange cost)
%
%------------- BEGIN CODE --------------

lag = 0;

%-------------- END CODE ---------------
end


function mayer = terminalCost(x,u,t)
% Mayer cost to be minimized
%
% Syntax:  
%          [mayer] = terminalCost(x,u,t)
% 
% Inputs:
%    x  - state vector
%    u  - input
%    t  - time
%
% Output:
%    mayer - terminal cost (mayer cost)
%
%------------- BEGIN CODE --------------

mayer = -x(7);

%-------------- END CODE ---------------
end
