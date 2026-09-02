function [u, s, Phir, Phird, Phie, Omegar, Phi_cmd, thetadd] = control_true(t, X, r_ref, v_ref, a_ref, Phir, Phird, F_a_old, h)

% unpack states
x = X(1);
r = X(2);
theta = X(3);
X1 = X(1:3);

xd = X(4);
rd = X(5);
thetad = X(6);
X2 = X(4:6);

alpha = X(7);
phi = X(8);
gamma = X(9);
Phi = X(7:9);

w1 = X(10);
w2 = X(11);
w3 = X(12);
Omega = X(10:12);

% reference trajectory [pos; vel] = [X1r; X2r]
rm = 1738e3;

T = [0 1 0; 0 0 1; 1 0 0];
pr = T' * [r_ref(1); r_ref(2); r_ref(3)] + [rm; 0; 0];
prd = T' * v_ref;
prdd = T' * a_ref;

xr = pr(1);
rr = sqrt(pr(2)^2 + pr(3)^2);
thetar = atan2(pr(3), pr(2));

xrd = prd(1);
rrd = (pr(2)*prd(2) + pr(3)*prd(3)) / sqrt(pr(2)^2 + pr(3)^2);
thetard = (pr(2)*prd(3) - pr(3)*prd(2)) / (pr(2)^2 + pr(3)^2);

xrdd = prdd(1);
rrdd = (rr*(prd(2)^2 + pr(2)*prdd(2) + prd(3)^2 + pr(3)*prdd(3)) - (pr(2)*prd(2) + pr(3)*prd(3))*rrd) / rr^2;
thetardd = (rr^2*(pr(2)*prdd(3) - prdd(2)*pr(3)) - (pr(2)*prd(3) - pr(3)*prd(2))*2*rr*rrd) / rr^4;

X1r = [xr; rr; thetar];
X2r = [xrd; rrd; thetard];
X2rd = [xrdd; rrdd; thetardd];

% translational control
mu = 4.902800118e12;
m = 100;

f2 = [-mu * x / (x^2 + r^2)^1.5; -mu * r / (x^2 + r^2)^1.5 + r * thetad^2; -2 * rd * thetad / r];
g2 = diag([1/m 1/m 1/(m*r)]);

X1e = X1 - X1r;
X2e = X2 - X2r;

% k11 = 0.25;
% k12 = 0.25;
% p1 = 0.5;
% q1 = 1.5;
% 
% k11p = 0.5;
% k12p = 0.5;
% p1p = 0.5;
% q1p = 1.5;
% 
% s1 = X2e + k11 * abs(X1e).^p1 .* sign(X1e) + k12 * abs(X1e).^q1 .* sign(X1e);
% F_a = g2 \ (-f2 + X2rd - (k11 * p1 * abs(X1e + 1e-3*ones(3,1)).^(p1 - 1) + k12 * q1 * abs(X1e).^(q1 - 1)) .* X2e - k11p * abs(s1).^p1p .* sign(s1) - k12p * abs(s1).^q1p .* sign(s1));

c1 = 0.001;
lambda1 = 0.01;
eta1 = 0.02;

s1 = c1 * X1e + X2e;

if any(abs(s1) < 5e-2)
    F_a = g2 \ (-c1 * X2e - f2 + X2rd - lambda1 * s1 - eta1 * s1 / 5e-2);
else
    F_a = g2 \ (-c1 * X2e - f2 + X2rd - lambda1 * s1 - eta1 * sign(s1));
end

if F_a(1) < 0
    F_a(1) = 0;
end

% determine reference attitude
F_a_norm = norm(F_a);
phi_cmd = asin(F_a(3) / -F_a_norm);
gamma_cmd = atan2(F_a(2), F_a(1));
alpha_cmd = 0;
Phi_cmd = [alpha_cmd; phi_cmd; gamma_cmd];

wn = 30;
zeta = 0.5;
Phirdd = wn^2 * (wrapToPi(Phi_cmd - Phir)) - 2 * zeta * wn * Phird;
Phird = Phird + h * Phirdd;
Phir = Phir + h * Phird;

W = [1 0 -sin(phi); ...
     0 cos(alpha) cos(phi)*sin(alpha); ...
     0 -sin(alpha) cos(phi)*cos(alpha)];

Re1 = [cos(gamma)*cos(phi); ...
       cos(gamma)*sin(alpha)*sin(phi)-cos(alpha)*sin(gamma); ...
       sin(alpha)*sin(gamma)+cos(alpha)*cos(gamma)*sin(phi)];

Omegar = W*Phird + Re1*thetad;

% rotational control
J = diag([100 90 80]);

thetadd = -2 * rd * thetad / r + F_a_old(3) / (m * r);
Phid = W \ (Omega - Re1 * thetad);

dW_dalpha = [0 0 0; ...
             0 -sin(alpha) cos(phi)*cos(alpha); ...
             0 -cos(alpha) -cos(phi)*sin(alpha)];

dW_dphi = [0 0 -cos(phi); ...
           0 0 -sin(phi)*sin(alpha); ...
           0 0 -sin(phi)*cos(alpha)];

Wd = dW_dalpha * Phid(1) + dW_dphi * Phid(2);

dWinv_dalpha = [0 cos(alpha)*tan(phi) -sin(alpha)*tan(phi); ...
                0 -sin(alpha) -cos(alpha); ...
                0 cos(alpha)*sec(phi) -sin(alpha)*sec(phi)];

dWinv_dphi = [0 sin(alpha)*sec(phi)^2 cos(alpha)*sec(phi)^2; ...
              0 0 0; ...
              0 sin(alpha)*sec(phi)*tan(phi) cos(alpha)*sec(phi)*tan(phi)];

Winvd = dWinv_dalpha * Phid(1) + dWinv_dphi * Phid(2);

dRe1_dalpha = [0; ...
               cos(gamma)*cos(alpha)*sin(phi) + sin(alpha)*sin(gamma); ...
               cos(alpha)*sin(gamma) - sin(alpha)*cos(gamma)*sin(phi)];

dRe1_dphi = [-cos(gamma)*sin(phi); ...
             cos(gamma)*sin(alpha)*cos(phi); ...
             cos(alpha)*cos(gamma)*cos(phi)];

dRe1_dgamma = [-sin(gamma)*cos(phi); ...
               -sin(gamma)*sin(alpha)*sin(phi) - cos(alpha)*cos(gamma); ...
               sin(alpha)*cos(gamma) - cos(alpha)*sin(gamma)*sin(phi)];

Re1d = dRe1_dalpha * Phid(1) + dRe1_dphi * Phid(2) + dRe1_dgamma * Phid(3);

Phie = wrapToPi(Phi - Phir);
% Phie(1) = wrapToPi(Phie(1));
% Phie(3) = wrapToPi(Phie(3));

Omegae = Omega - Omegar;

% c2 = 5;
% lambda2 = 2.5;
% eta2 = 2.5;
% 
% s2 = W \ Omegae + c2 * Phie;
% 
% tau_a = -cross(J*Omega, Omega) + (J*W) * (-Winvd*Omegae - c2*W\Omegae + W\(Wd*Phird) + Phirdd + W\(Re1d*thetad+Re1*thetadd) - lambda2*s2 - eta2*sign(s2));

k21 = 1;
k22 = 1;
p2 = 0.5;
q2 = 1.5;

k21p = 1.1;
k22p = 1.1;
p2p = 0.5;
q2p = 1.5;

s2 = k21 * abs(Phie).^p2 .* sign(Phie) + k22 * abs(Phie).^q2 .* sign(Phie);

if abs(s2) < 5e-2
    tau_a = -cross(J*Omega, Omega) + (J * W) * (-Winvd * Omegae + W \ (Wd * Phird) + Phirdd + W \ (Re1d * thetad + Re1 * thetadd) - (k21 * p2 * abs(Phie + 1e-3*ones(3,1)).^(p2 - 1) + k22 * q2 * abs(Phie).^(q2 - 1)) .* (W \ Omegae) - k21p * abs(s2).^p2p .* (s2 / 5e-2) - k22p * abs(s2).^q2p .* (s2 / 5e-2));
else
    tau_a = -cross(J*Omega, Omega) + (J * W) * (-Winvd * Omegae + W \ (Wd * Phird) + Phirdd + W \ (Re1d * thetad + Re1 * thetadd) - (k21 * p2 * abs(Phie + 1e-3*ones(3,1)).^(p2 - 1) + k22 * q2 * abs(Phie).^(q2 - 1)) .* (W \ Omegae) - k21p * abs(s2).^p2p .* sign(s2) - k22p * abs(s2).^q2p .* sign(s2));
end

% calculate thrust magnitude and gimbal angles
l = 1;
chi = [-l; 0; 0];
chi_tilde = [0 -chi(3) chi(2); ...
             chi(3) 0 -chi(1); ...
             -chi(2) chi(1) 0];

R = Euler2RotMat(Phi');
F_a = R * F_a;

F_a_possible = pinv([eye(3); chi_tilde]) * [F_a; tau_a];

% R = Euler2RotMat(Phi');
% 
% F_vec = R * F_a;
% 
% F_y = -tau_a(3) / l;
% F_z = -tau_a(2) / l;
% 
% %if abs(F_y)
% 
% F_vec(2) = F_vec(2) + F_y;
% F_vec(3) = F_vec(3) + F_z;

F = norm(F_a_possible);
beta1 = asin(F_a_possible(3) / F); % atan2(F_vec(3), sqrt(F_vec(1)^2 + F_vec(2)^2));
beta2 = atan2(F_a_possible(2), F_a_possible(1));

s = [s1; s2];
u = [F_a; F; beta1; beta2];