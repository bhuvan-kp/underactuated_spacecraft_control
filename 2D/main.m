%%
clear; close all; clc;

%%
% initial condition
X_0 = [0; 500; 1; -5; 0; 0; 100];

%%
% time
h = 0.001;
tf = 100;
Ts = 0.001;
time_span = 0:h:tf;

% storage
X_values = zeros(int32(tf / Ts), 7);
U_values = zeros(int32(tf / Ts), 2);

%%
% RK4 Integration
X = X_0;

for t = time_span
    U = [-167 * X(4) / 5.0; 0];

    if isequal(mod(int32(t * 1000), int32(Ts * 1000)), int32(0))
        X_values(int32(t / Ts) + 1, :) = X';
        U_values(int32(t / Ts) + 1, :) = U';
    end

    k1 = DynamicModel(t, X, U);
    k2 = DynamicModel(t + h/2, X + k1 * h/2, U);
    k3 = DynamicModel(t + h/2, X + k2 * h/2, U);
    k4 = DynamicModel(t + h, X + k3 * h, U);

    X = X + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

%%
for i = 1:1:7
    figure();
    plot(time_span(1:int32(Ts / h):end), X_values(:, i), 'k-');
    hold off;
    grid on;
    title(sprintf('x_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('x_{%u}', i));
end


%%
for i = 1:1:2
    figure();
    plot(time_span(1:int32(Ts / h):end), U_values(:, i), 'k-');
    grid on;
    title(sprintf('u_{%u}', i));
    xlabel('time (s)');
    ylabel(sprintf('u_{%u}', i));
end