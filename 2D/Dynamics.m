function Xd = Dynamics(t, X, U)

% Unpack states and control
x = X(1);
z = X(2);
vx = X(3);
vz = X(4);
theta = X(5);
omega = X(6);
m = X(7);

F = U(1);
beta = U(2);

% Constants
g = 1.625;
J = 60;
l = 1;
Isp = 318;
g0 = 9.81;

% Dynamics
xd = vx;
zd = vz;
vxd = F * sin(beta + theta) / m;
vzd = -g + F * cos(beta + theta) / m;
thetad = omega;
omegad = -F * l * sin(beta) / J;
md = -F / (Isp * g0);

Xd = [xd; zd; vxd; vzd; thetad; omegad; md];