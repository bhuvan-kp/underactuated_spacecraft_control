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

x_opt = makima(data(:, 1), data(:, 2), time_span);
z_opt = makima(data(:, 1), data(:, 3), time_span);
vx_opt = makima(data(:, 1), data(:, 4), time_span);
vz_opt = makima(data(:, 1), data(:, 5), time_span);
theta_opt = makima(data(:, 1), data(:, 6), time_span);
omega_opt = makima(data(:, 1), data(:, 7), time_span);
m_opt = makima(data(:, 1), data(:, 8), time_span);

Fx_opt = makima(data(:, 9), data(:, 10), time_span);
Fz_opt = makima(data(:, 9), data(:, 11), time_span);

F_opt = makima(data(:, 9), sqrt(data(:, 10).^2 + data(:, 11).^2), time_span);
beta_opt = makima(data(:, 9), atan2(data(:, 10), data(:, 11)), time_span);

%%
% Plots of generated trajectory
figure();
plot(time_span, x_opt, 'b-');
hold on;
plot(data(:, 1), data(:, 2), 'r--');
hold off;
title('x_{ref} vs t');
xlabel('time (s)');
ylabel('x_{ref} (m)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, z_opt, 'b-');
hold on;
plot(data(:, 1), data(:, 3), 'r--');
hold off;
title('z_{ref} vs t');
xlabel('time (s)');
ylabel('z_{ref} (m)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(x_opt, z_opt, 'b-');
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
plot(time_span, vx_opt, 'b-');
hold on;
plot(data(:, 1), data(:, 4), 'r--');
hold off;
title('v_{x_{ref}} vs t');
xlabel('time (s)');
ylabel('v_{x_{ref}} (m/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, vz_opt, 'b-');
hold on;
plot(data(:, 1), data(:, 5), 'r--');
hold off;
title('v_{z_{ref}} vs t');
xlabel('time (s)');
ylabel('v_{z_{ref}} (m/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, rad2deg(theta_opt), 'b-');
hold on;
plot(data(:, 1), rad2deg(data(:, 6)), 'r--');
hold off;
title('\theta_{ref} vs t');
xlabel('time (s)');
ylabel('\theta_{ref} (deg)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, omega_opt, 'b-');
hold on;
plot(data(:, 1), data(:, 7), 'r--');
hold off;
title('\omega_{ref} vs t');
xlabel('time (s)');
ylabel('\omega_{ref} (rad/s)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, Fx_opt, 'b-');
hold on;
plot(data(:, 9), data(:, 10), 'r--');
hold off;
title('F_{x_{ref}} vs t');
xlabel('time (s)');
ylabel('F_{x_{ref}} (N)');
legend('interpolated', 'optimal');
grid on;

figure();
plot(time_span, Fz_opt, 'b-');
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
cstate_values = zeros(int32(tf / Ts), 2);

%%
% RK4 Integration
X = X_0;
cstate = [0; 0]; % thetar; thetard

for t = time_span

    [U, cstate] = Control(t, X, [x_opt(int32(t * 1000) + 1); z_opt(int32(t * 1000) + 1); vx_opt(int32(t * 1000) + 1); vz_opt(int32(t * 1000) + 1); Fx_opt(int32(t * 1000) + 1); Fz_opt(int32(t * 1000) + 1)], cstate, h);
    % U = [F_opt(int32(t * 1000) + 1); beta_opt(int32(t * 1000) + 1)];

    if isequal(mod(int32(t * 1000), int32(Ts * 1000)), int32(0))
        X_values(int32(t / Ts) + 1, :) = X';
        U_values(int32(t / Ts) + 1, :) = U';
        cstate_values(int32(t / Ts) + 1, :) = cstate';
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
plot(time_span, x_opt, 'r--');
hold off;
title('x vs t');
xlabel('time (s)');
ylabel('x (m)');
legend('x', 'x_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 2), 'b-');
hold on;
plot(time_span, z_opt, 'r--');
hold off;
title('z vs t');
xlabel('time (s)');
ylabel('z (m)');
legend('z', 'z_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 3), 'b-');
hold on;
plot(time_span, vx_opt, 'r--');
hold off;
title('v_x vs t');
xlabel('time (s)');
ylabel('v_x (m/s)');
legend('v_x', 'v_{x_{ref}}');
grid on;

figure();
plot(time_span, X_values(:, 4), 'b-');
hold on;
plot(time_span, vz_opt, 'r--');
hold off;
title('vz vs t');
xlabel('time (s)');
ylabel('vz (m/s)');
legend('v_z', 'v_{z_{ref}}');
grid on;

figure();
plot(time_span, X_values(:, 5), 'b-');
hold on;
plot(time_span, cstate_values(:, 1), 'r--');
hold off;
title('\theta vs t');
xlabel('time (s)');
ylabel('\theta (rad)');
legend('\theta', '\theta_{ref}');
grid on;

figure();
plot(time_span, wrapToPi(cstate_values(:, 1) - X_values(:, 5)), 'b-');
title('e_\theta vs t');
xlabel('time (s)');
ylabel('e_\theta (rad)');
legend('e_\theta');
grid on;

figure();
plot(time_span, X_values(:, 6), 'b-');
hold on;
plot(time_span, cstate_values(:, 2), 'r--');
hold off;
title('\omega vs t');
xlabel('time (s)');
ylabel('\omega (rad/s)');
legend('\omega', '\omega_{ref}');
grid on;

figure();
plot(time_span, X_values(:, 7), 'b-');
hold on;
plot(time_span, m_opt, 'r--');
hold off;
title('m vs t');
xlabel('time (s)');
ylabel('m (kg)');
legend('m', 'Optimal m');
grid on;

figure();
plot(time_span, U_values(:, 1), 'b-');
hold on;
plot(time_span, sqrt(Fx_opt.*Fx_opt + Fz_opt.*Fz_opt), 'r--');
hold off;
title('F vs t');
xlabel('time (s)');
ylabel('F (N)');
legend('F', 'Optimal F');
grid on;

figure();
plot(time_span, rad2deg(U_values(:, 2)), 'b-');
hold on;
plot(time_span, rad2deg(atan2(Fx_opt, Fz_opt)), 'r--');
hold off;
title('\beta vs t');
xlabel('time (s)');
ylabel('\beta (deg)');
legend('\beta', 'Optimal \beta');
grid on;