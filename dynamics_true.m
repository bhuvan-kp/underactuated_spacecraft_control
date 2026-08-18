function Xd = dynamics_true(t, X, U)

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
Phi = [alpha; phi; gamma];

w1 = X(10);
w2 = X(11);
w3 = X(12);

% unpack control
F_a = U(1:3);
F = U(4);
beta1 = U(5);
beta2 = U(6);

% translational dynamics
mu = 4.902800118e12;
rm = 1738e3;
m = 100;

F_vec = [F * cos(beta1) * cos(beta2); F * cos(beta1) * sin(beta2); F * sin(beta1)];

R = Euler2RotMat(Phi');

F_a = R' * F_vec;

xdd = -mu * x / (x^2 + r^2)^1.5 + F_a(1) / m;
rdd = -mu * r / (x^2 + r^2)^1.5 + r * thetad^2 + F_a(2) / m;
thetadd = -2 * rd * thetad / r + F_a(3) / (m * r);

% rotational dynamics
Omega = [w1; w2; w3];

W = [1 0 -sin(phi); 0 cos(alpha) cos(phi)*sin(alpha); 0 -sin(alpha) cos(phi)*cos(alpha)];
Re1 = [cos(gamma)*cos(phi); cos(gamma)*sin(alpha)*sin(phi)-cos(alpha)*sin(gamma); sin(alpha)*sin(gamma)+cos(alpha)*cos(gamma)*sin(phi)];

Phid = W \ (Omega - Re1 * thetad);

J = diag([100 90 80]);
tau_g = [0; 0; 0];

l = 1;
chi = [-l; 0; 0];
tau_a = cross(chi, F_vec);

Omegad = J \ (cross(J*Omega, Omega) + tau_g + tau_a);

Xd = [xd; rd; thetad; xdd; rdd; thetadd; Phid; Omegad];