
% Parameters
n = 20;
x_start = 0;
x_end = 3*pi/2;
h = (x_end - x_start) / (n + 1);
x = linspace(x_start, x_end, n+2)';  % Include boundary points


% Initialize A and b
A = zeros(n, n);
b = zeros(n, 1);

% Fill the matrix A using central difference approximations
for i = 1:n
    xi = x(i+1);  % Current x point (excluding boundary)
    A(i, i) = -2/h^2 - sin(xi);  % y_i term
    if i > 1
        A(i, i-1) = 1/h^2 - cos(xi) / (2*h);  % y_{i-1} term
    end
    if i < n
        A(i, i+1) = 1/h^2 + cos(xi) / (2*h);  % y_{i+1} term
    end
end

% Boundary conditions
b(1) = -(1/h^2 - cos(x(2))/(2*h)) * 1;  % y(0) = 1
b(end) = -(1/h^2 + cos(x(end-1))/(2*h)) * (1/exp(1));  % y(3*pi/2) = 1/e

