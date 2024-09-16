run("pressure_data.m");
A = zeros(length(t),5)
tm = t(length(t));
T = tm - t(1);
b = y

for i = 1 : length(t)
    A(i, :) = [1 cos(2*pi*t(i)/T) sin(2*pi*t(i)/T) cos(4*pi*t(i)/T) sin(4*pi*t(i)/T)];
end

[Q, R] = thinQR(A);

c = R \ (Q' * b)

DrawCurveFit(c, t, y)