function Xd = dynamics_virtual(t, X, U)

% unpack states
x = X(1);
r = X(2);
theta = X(3);

xd = X(4);
rd = X(5);
thetad = X(6);

alpha = X(7);
phi = X(8);
gamma = X(9);

w1 = X(10);
w2 = X(11);
w3 = X(12);

% unpack control
F_a = U(1:3);
tau_a = U(4:6);

% translational dynamics
mu = 4.902800118e12;
rm = 1738e3;
m = 100;

xdd = -mu * x / (x^2 + r^2)^1.5 + F_a(1) / m;
rdd = -mu * r / (x^2 + r^2)^1.5 + r * thetad^2 + F_a(2) / m;
thetadd = -2 * rd * thetad / r + F_a(3) / (m * r);

% rotational dynamics
Phi = [alpha; phi; gamma];
Omega = [w1; w2; w3];

W = [1 0 -sin(phi); 0 cos(alpha) cos(phi)*sin(alpha); 0 -sin(alpha) cos(phi)*cos(alpha)];
Re1 = [cos(gamma)*cos(phi); cos(gamma)*sin(alpha)*sin(phi)-cos(alpha)*sin(gamma); sin(alpha)*sin(gamma)+cos(alpha)*cos(gamma)*sin(phi)];

Phid = W \ (Omega - Re1 * thetad);

J = diag([100 90 80]);
tau_g = [0; 0; 0];

Omegad = J \ (cross(J*Omega, Omega) + tau_g + tau_a);

Xd = [xd; rd; thetad; xdd; rdd; thetadd; Phid; Omegad];