function Xd = DynamicModel(t, X, U)

% Unpack states
x = X(1);
z = X(2);
xd = X(3);
zd = X(4);
theta = X(5);
omega = X(6);
m = X(7);

% Unpack control
F = U(1);
beta = U(2);

% Constants
g = 1.67;
J = 80;
l = 1;
Isp = 315;
g0 = 9.81;

% Dynamics
Xd = [xd; ...
      zd; ...
      F * sin(beta + theta) / m; ...
      -g + F * cos(beta + theta) / m; ...
      omega; ...
      -F * l * sin(beta) / J; ...
      -F / (Isp * g0)];