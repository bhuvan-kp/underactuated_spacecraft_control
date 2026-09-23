%%
clear; close all; clc;

%%
% initial condition
X_0 = [500 3000 -10 -60 0 0 100]';

%%
% generation of reference trajectory
data = readmatrix("problem_physical_units.csv");
data(any(isnan(data), 2), :) = [];

h = 0.001;
tf = data(end, 1);
Ts = 0.001;
time_span = 0:h:tf;

xr = makima(data(:, 1), data(:, 2), time_span);
zr = makima(data(:, 1), data(:, 3), time_span);
vxr = makima(data(:, 1), data(:, 4), time_span);
vzr = makima(data(:, 1), data(:, 5), time_span);
thetar = makima(data(:, 1), data(:, 6), time_span);
omegar = makima(data(:, 1), data(:, 7), time_span);
mr = makima(data(:, 1), data(:, 8), time_span);

Fxr = makima(data(:, 9), data(:, 10), time_span);
Fzr = makima(data(:, 9), data(:, 11), time_span);

Fr = makima(data(:, 9), sqrt(data(:, 10).^2 + data(:, 11).^2), time_span);
betar = makima(data(:, 9), atan2(data(:, 10), data(:, 11)), time_span);

%%
% Plots of generated trajectory
figure();
plot(time_span, xr, 'b-');
hold on;
plot(data(:, 1), data(:, 2), 'r--');
hold off;
title('x_{ref} vs t');
xlabel('time (s)');
ylabel('x_{ref} (m)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, zr, 'b-');
hold on;
plot(data(:, 1), data(:, 3), 'r--');
hold off;
title('z_{ref} vs t');
xlabel('time (s)');
ylabel('z_{ref} (m)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(xr, zr, 'b-');
hold on;
plot(data(:, 2), data(:, 3), 'r--');
hold off;
title('z_{ref} vs x_{ref}');
xlabel('x_{ref} (m)');
ylabel('z_{ref} (m)');
axis equal;
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, vxr, 'b-');
hold on;
plot(data(:, 1), data(:, 4), 'r--');
hold off;
title('v_{x_{ref}} vs t');
xlabel('time (s)');
ylabel('v_{x_{ref}} (m/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, vzr, 'b-');
hold on;
plot(data(:, 1), data(:, 5), 'r--');
hold off;
title('v_{z_{ref}} vs t');
xlabel('time (s)');
ylabel('v_{z_{ref}} (m/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, rad2deg(thetar), 'b-');
hold on;
plot(data(:, 1), rad2deg(data(:, 6)), 'r--');
hold off;
title('\theta_{ref} vs t');
xlabel('time (s)');
ylabel('\theta_{ref} (deg)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, omegar, 'b-');
hold on;
plot(data(:, 1), data(:, 7), 'r--');
hold off;
title('\omega_{ref} vs t');
xlabel('time (s)');
ylabel('\omega_{ref} (rad/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, Fxr, 'b-');
hold on;
plot(data(:, 9), data(:, 10), 'r--');
hold off;
title('F_{x_{ref}} vs t');
xlabel('time (s)');
ylabel('F_{x_{ref}} (N)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, Fzr, 'b-');
hold on;
plot(data(:, 9), data(:, 11), 'r--');
hold off;
title('F_{z_{ref}} vs t');
xlabel('time (s)');
ylabel('F_{z_{ref}} (N)');
legend('interpolated', 'optimal');
grid on;

%%
% storage
X_values = zeros(int32(tf / Ts), 7);
U_values = zeros(int32(tf / Ts), 2);
% s_values = zeros(int32(tf / Ts), 3);
% Phir_values = zeros(int32(tf / Ts), 1);
% Phi_cmd_values = zeros(int32(tf / Ts), 3);
% Phie_values = zeros(int32(tf / Ts), 3);
% Omegar_values = zeros(int32(tf / Ts), 3);
% thetadd_values = zeros(int32(tf / Ts), 1);
% F_values = zeros(int32(tf / Ts), 1);
% beta1_values = zeros(int32(tf / Ts), 1);
% beta2_values = zeros(int32(tf / Ts), 1);

%%
% RK4 Integration
X = X_0;
fstate = [0; 0];
% thetad_old = 0;
% Phir = zeros(3, 1);
% Phird = zeros(3, 1);
% U_old = zeros(6, 1);
for t = time_span
    % [U, s, Phir, Phird, Phie, Omegar, Phi_cmd, thetadd] = control_true(t, X, r_ref_values(int32(t/h) + 1, :)', v_ref_values(int32(t/h) + 1, :)', a_ref_values(int32(t/h) + 1, :)', Phir, Phird, U_old(1:3), h);
    % U_old = U;

    % [U, fstate] = Control(t, X, [xr(int32(t * 1000) + 1); zr(int32(t * 1000) + 1); vxr(int32(t * 1000) + 1); vzr(int32(t * 1000) + 1); Fxr(int32(t * 1000) + 1); Fzr(int32(t * 1000) + 1)], fstate, h);
    U = [Fr(int32(t * 1000) + 1); betar(int32(t * 1000) + 1)];

    if isequal(mod(int32(t * 1000), int32(Ts * 1000)), int32(0))
        X_values(int32(t / Ts) + 1, :) = X';
        U_values(int32(t / Ts) + 1, :) = U';
        % s_values(int32(t / Ts) + 1, :) = s';
        % Phir_values(int32(t / Ts) + 1, :) = Phir';
        % Phi_cmd_values(int32(t / Ts) + 1, :) = Phi_cmd';
        % Phie_values(int32(t / Ts) + 1, :) = Phie';
        % Omegar_values(int32(t / Ts) + 1, :) = Omegar';
        % thetadd_values(int32(t / Ts) + 1, :) = thetadd;
    end

    k1 = Dynamics(t, X, U);
    k2 = Dynamics(t + h/2, X + k1 * h/2, U);
    k3 = Dynamics(t + h/2, X + k2 * h/2, U);
    k4 = Dynamics(t + h, X + k3 * h, U);

    X = X + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

%%
% Plots

figure();
plot(time_span, X_values(:, 1), 'b-');
hold on;
plot(time_span, xr, 'r--');
hold off;
title('x vs t');
xlabel('time (s)');
ylabel('x (m)');
legend('x', 'x_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 2), 'b-');
hold on;
plot(time_span, zr, 'r--');
hold off;
title('z vs t');
xlabel('time (s)');
ylabel('z (m)');
legend('z', 'z_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 3), 'b-');
hold on;
plot(time_span, vxr, 'r--');
hold off;
title('v_x vs t');
xlabel('time (s)');
ylabel('v_x (m/s)');
legend('v_x', 'v_{x_{ref}}');
grid on;

figure();
plot(time_span, X_values(:, 4), 'b-');
hold on;
plot(time_span, vzr, 'r--');
hold off;
title('vz vs t');
xlabel('time (s)');
ylabel('vz (m/s)');
legend('v_z', 'v_{z_{ref}}');
grid on;

figure();
plot(time_span, rad2deg(wrapToPi(X_values(:, 5))), 'b-');
hold on;
plot(time_span, rad2deg(thetar), 'r--');
hold off;
title('\theta vs t');
xlabel('time (s)');
ylabel('\theta (deg)');
legend('\theta', '\theta_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 6), 'b-');
hold on;
plot(time_span, omegar, 'r--');
hold off;
title('\omega vs t');
xlabel('time (s)');
ylabel('\omega (rad/s)');
legend('\omega', '\omega_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 7), 'b-');
hold on;
plot(time_span, mr, 'r--');
hold off;
title('m vs t');
xlabel('time (s)');
ylabel('m (kg)');
legend('m', 'Optimal m');
grid on;

figure();
plot(time_span, U_values(:, 1), 'b-');
hold on;
plot(time_span, sqrt(Fxr.*Fxr + Fzr.*Fzr), 'r--');
hold off;
title('F vs t');
xlabel('time (s)');
ylabel('F (N)');
legend('F', 'Optimal F');
grid on;

figure();
plot(time_span, rad2deg(U_values(:, 2)), 'b-');
hold on;
plot(time_span, rad2deg(atan2(Fxr, Fzr)), 'r--');
hold off;
title('\beta vs t');
xlabel('time (s)');
ylabel('\beta (deg)');
legend('\beta', 'Optimal \beta');
grid on;