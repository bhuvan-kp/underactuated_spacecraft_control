function [U, cstate] = Control(t, X, Xr, cstate, h)

% Unpack states, control and reference
x = X(1);
z = X(2);
vx = X(3);
vz = X(4);
theta = X(5);
omega = X(6);
m = X(7);

xr = Xr(1);
zr = Xr(2);
vxr = Xr(3);
vzr = Xr(4);
axr = (Xr(5) * cos(theta) + Xr(6) * sin(theta)) / m;
azr = (-Xr(5) * sin(theta) + Xr(6) * cos(theta)) / m;

thetar = cstate(1);
thetard = cstate(2);

% Constants
g = 1.625;
J = 60;
l = 1;
Isp = 318;
g0 = 9.81;

% Translational control
e1 = [x - xr; z - zr];
e1d = [vx - vxr; vz - vzr];
c1 = 1;
lambda1 = 1;
eta1 = 0.1;
s1 = e1d + c1 * e1;
a_cmd = [axr; azr] - c1 * e1d - lambda1 * s1 - eta1 * sign(s1);

% Rotational control
theta_cmd = atan2(a_cmd(1), a_cmd(2));

wn = 30;
zeta = 0.5;
thetardd = wn^2 * wrapToPi(theta_cmd - thetar) - 2 * zeta * wn * thetard;
thetard = thetard + h * thetardd;
thetar = thetar + h * thetard;

e2 = wrapToPi(theta - thetar);
e2d = omega - thetard;
c2 = 0.06;
lambda2 = 1;
eta2 = 0.1;
s2 = e2d + c2 * e2;
tau_cmd = J * (thetardd - c2 * e2d - lambda2 * s2 - eta2 * sign(s2));

% Control allocation
Fx_cmd = (a_cmd(1) * cos(theta) - a_cmd(2) * sin(theta)) * m;
Fz_cmd = (a_cmd(1) * sin(theta) + a_cmd(2) * cos(theta)) * m;
F_vec = pinv([1 0; 0 1; -l 0]) * [Fx_cmd; Fz_cmd; tau_cmd];
% F = lasso()
% F_vec = [Fx_cmd; Fz_cmd];
F = norm(F_vec);
beta = atan2(F_vec(1), F_vec(2));

U = [F; beta];
cstate = [thetar; thetard];