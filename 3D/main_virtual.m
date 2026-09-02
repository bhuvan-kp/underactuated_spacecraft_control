%%
clear; close all; clc;

%%
% initial condition
X_0 = [1738e3+4000; 2500; 0.6435; -10; -5; -0.0028; deg2rad(5); deg2rad(5); deg2rad(5); 0*deg2rad(5); deg2rad(5); deg2rad(5)];

%%
% Calculation of guidance parameters
T = [0 1 0; 0 0 1; 1 0 0];
ri = T * [X_0(1) - 1738e3; X_0(2) * cos(X_0(3)); X_0(2) * sin(X_0(3))];
vi = T * [X_0(4); X_0(5) * cos(X_0(3)) - X_0(2) * X_0(6) * sin(X_0(3)); X_0(5) * sin(X_0(3)) + X_0(2) * X_0(6) * cos(X_0(3))];
guidance_test;

%%
% generation of reference trajectory
h = 0.001;
tf = t0 + tv + th;
Ts = 0.001;
time_span = 0:h:tf;

r_ref_values = zeros(int32(tf / Ts), 3);
v_ref_values = zeros(int32(tf / Ts), 3);
a_ref_values = zeros(int32(tf / Ts), 3);
pr_values = zeros(int32(tf / Ts), 3);
prd_values = zeros(int32(tf / Ts), 3);
for t = time_span
    [r_ref_values(int32(t / Ts) + 1, :), v_ref_values(int32(t / Ts) + 1, :), a_ref_values(int32(t / Ts) + 1, :)] = Reference(t, ri, vi, t0, t1, th, tv, xh, yh, u1, u2);
    T = [0 1 0; 0 0 1; 1 0 0];
    pr = T' * [r_ref_values(int32(t / Ts) + 1, 1); r_ref_values(int32(t / Ts) + 1, 2); r_ref_values(int32(t / Ts) + 1, 3)] + [1738e3; 0; 0];
    pr_values(int32(t / Ts) + 1, :) = [pr(1); sqrt(pr(2)^2 + pr(3)^2); wrapToPi(atan2(pr(3), pr(2)))];
    prd = T' * v_ref_values(int32(t / Ts) + 1, :)';
    prd_values(int32(t / Ts) + 1, :) = [prd(1); (pr(2)*prd(2) + pr(3)*prd(3)) / sqrt(pr(2)^2 + pr(3)^2); (pr(2)*prd(3) - pr(3)*prd(2)) / (pr(2)^2 + pr(3)^2)];
end

%%
% Plots of generated trajectory
figure();
plot3(r_ref_values(1:end-1, 1), r_ref_values(1:end-1, 2), r_ref_values(1:end-1, 3), 'k-')
title('ref position vs. time');
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');
xlim([min(min(r_ref_values(:, 1)), -500) max(max(r_ref_values(:, 1)), 500)]);
ylim([min(min(r_ref_values(:, 2)), -500) max(max(r_ref_values(:, 2)), 500)]);
zlim([0 max(r_ref_values(:, 3))+100]);
axis square;
grid on;

figure();
plot(time_span, r_ref_values(1:size(time_span, 2), 1), 'b-');
title('x vs t');
xlabel('time (s)');
ylabel('x (m)');
grid on;

figure();
plot(time_span, r_ref_values(1:size(time_span, 2), 2), 'b-');
title('y vs t');
xlabel('time (s)');
ylabel('y (m)');
grid on;

figure();
plot(time_span, r_ref_values(1:size(time_span, 2), 3), 'b-');
title('z vs t');
xlabel('time (s)');
ylabel('z (m)');
grid on;

figure();
plot(time_span, pr_values(1:size(time_span, 2), 1) - 1738e3, 'b-');
title('x vs t');
xlabel('time (s)');
ylabel('x (m)');
grid on;

figure();
plot(time_span, pr_values(1:size(time_span, 2), 2), 'b-');
title('r vs t');
xlabel('time (s)');
ylabel('r (m)');
grid on;

figure();
plot(time_span, pr_values(1:size(time_span, 2), 3), 'b-');
title('theta vs t');
xlabel('time (s)');
ylabel('theta (rad)');
grid on;

%%
% storage
X_values = zeros(int32(tf / Ts), 12);
U_values = zeros(int32(tf / Ts), 6);
s_values = zeros(int32(tf / Ts), 6);
Phir_values = zeros(int32(tf / Ts), 3);
Phi_cmd_values = zeros(int32(tf / Ts), 3);
Phie_values = zeros(int32(tf / Ts), 3);
Omegar_values = zeros(int32(tf / Ts), 3);
thetadd_values = zeros(int32(tf / Ts), 1);

%%
% RK4 Integration
X = X_0;
thetad_old = 0;
Phir = zeros(3, 1);
Phird = zeros(3, 1);
U_old = zeros(6, 1);
for t = time_span
    [U, s, Phir, Phird, Phie, Omegar, Phi_cmd, thetadd] = control_virtual(t, X, r_ref_values(int32(t/h) + 1, :)', v_ref_values(int32(t/h) + 1, :)', a_ref_values(int32(t/h) + 1, :)', Phir, Phird, U_old(1:3), h);
    U_old = U;

    if isequal(mod(int32(t * 1000), int32(Ts * 1000)), int32(0))
        X_values(int32(t / Ts) + 1, :) = X';
        U_values(int32(t / Ts) + 1, :) = U';
        s_values(int32(t / Ts) + 1, :) = s';
        Phir_values(int32(t / Ts) + 1, :) = Phir';
        Phi_cmd_values(int32(t / Ts) + 1, :) = Phi_cmd';
        Phie_values(int32(t / Ts) + 1, :) = Phie';
        Omegar_values(int32(t / Ts) + 1, :) = Omegar';
        thetadd_values(int32(t / Ts) + 1, :) = thetadd;
    end

    k1 = dynamics_virtual(t, X, U);
    k2 = dynamics_virtual(t + h/2, X + k1 * h/2, U);
    k3 = dynamics_virtual(t + h/2, X + k2 * h/2, U);
    k4 = dynamics_virtual(t + h, X + k3 * h, U);

    X = X + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

%%
for i = 1:1:3
    figure();
    plot(time_span(1:int32(Ts / h):end), X_values(:, i) - 1738e3 * (i == 1), 'k-');
    hold on;
    plot(time_span, pr_values(1:size(time_span, 2), i) - 1738e3 * (i == 1), 'r--');
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    hold off;
    grid on;
    title(sprintf('x_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('x_{%u}', i));
end

%%
for i = 4:1:6
    figure();
    plot(time_span(1:int32(Ts / h):end), X_values(:, i), 'k-');
    hold on;
    plot(time_span(1:int32(Ts / h):end), prd_values(:, i - 3), 'r--');
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    grid on;
    title(sprintf('x_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('x_{%u}', i));
end

%%
for i = 1:1:3
    figure();
    plot(time_span(1:int32(Ts / h):end), rad2deg(wrapToPi(Phir_values(:, i))), 'g-.');
    hold on;
    plot(time_span(1:int32(Ts / h):end), rad2deg(wrapToPi(X_values(:, i + 6))), 'k-');
    plot(time_span(1:int32(Ts / h):end), rad2deg(Phi_cmd_values(:, i)), 'r--');
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    hold off;
    grid on;
    title(sprintf('\\Phi_{%u} vs. \\Phi_{r%u}', i, i));
    xlabel('time (s)');
    ylabel(sprintf('\\Phi_{%u} (deg)', i));
end

%%
for i = 1:1:3
    figure();
    plot(time_span(1:int32(Ts / h):end), rad2deg(Phie_values(:, i)), 'k-');
    hold on;
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    hold off;
    grid on;
    title(sprintf('\\Phi_{e%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('\\Phi_{e%u} (deg)', i));
end

%%
for i = 1:1:3
    figure();
    plot(time_span(1:int32(Ts / h):end), Omegar_values(:, i), 'r--');
    hold on;
    plot(time_span(1:int32(Ts / h):end), X_values(:, i + 9), 'k-');
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    hold off;
    grid on;
    title(sprintf('\\Omega_{%u} vs. \\Omega_{r%u}', i, i));
    xlabel('time (s)');
    ylabel(sprintf('\\Omega_{%u} (rad/s)', i));
end

%%
for i = 1:1:6
    figure();
    plot(time_span(1:int32(Ts / h):end), U_values(:, i), 'k-');
    hold on;
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    grid on;
    title(sprintf('u_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('u_{%u}', i));
end

%%
figure();
plot(time_span(1:int32(Ts / h):end), vecnorm(U_values(:, 1:3), 2, 2), 'k-');
hold on;
xline(t0, 'b--');
xline(t0+t1, 'b--');
xline(t0+th, 'b--');
xline(t0+th+tv, 'b--');
grid on;
title('Thrust');
xlabel('time (s)');
ylabel('Thrust (N)');

%%
figure();
plot(time_span(1:int32(Ts / h):end), vecnorm(U_values(:, 4:6), 2, 2), 'k-');
hold on;
xline(t0, 'b--');
xline(t0+t1, 'b--');
xline(t0+th, 'b--');
xline(t0+th+tv, 'b--');
grid on;
title('Torque');
xlabel('time (s)');
ylabel('Torque (Nm)');

%%
for i = 1:1:6
    figure();
    plot(time_span(1:int32(Ts / h):end), s_values(:, i), 'k-');
    hold on;
    xline(t0, 'b--');
    xline(t0+t1, 'b--');
    xline(t0+th, 'b--');
    xline(t0+th+tv, 'b--');
    grid on;
    title(sprintf('s_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('s_{%u}', i));
end