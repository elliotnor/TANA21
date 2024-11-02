%% Part 1

clear all
close all

N = 5;
A = full(gallery('tridiag', N, -1, 2.1, -1));
known_x = ones(N, 1); % make known solution vector of 1s
manuf_b = A * known_x; % manufacture the right-hand-side
omega = linspace(1, 2, 10);
tol = 10^(-11);
x0 = zeros(N, 1);

for i = 1:10
    omega(i)
    [x, k] = SOR(A, manuf_b, x0, tol, omega(i));
end

%% Part 2

x_bounds = [0 3 * pi / 2];
y_bounds = [1 1 / exp(1)];

omega = 0;

s = @(x) cos(x);
r = @(x) -sin(x);
t = @(x) 0;
n = 6;

y_exact = @(x) exp(sin(x));
[x, y, ~] = approx_ODE(1, x_bounds, y_bounds, s, r, t, 6);

err = [];
err_prev = 0;

n = [10, 20, 40, 80];
for i = 1:4
    %h = (3 * pi / 2) / n(i);
    [x, y, ~] = approx_ODE(1, x_bounds, y_bounds, s, r, t, n(i));
    
    f = @(x) exp(sin(x));
    y_exact = f(x);
    plot(x, y, '.', x, y_exact);
    legend('Approximated value', 'Exact value', 'Location', 'southwest');
    
    err_abs = norm(y' - y_exact, 'inf');
    err_ratio = err_prev / err_abs;
    eoc = log(err_ratio) / log(2);
    err = [err; err_abs, err_ratio, eoc];
    err_prev = err_abs;
end

err
