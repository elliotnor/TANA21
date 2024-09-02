f= @(x) 3*x- cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);

x0 = 0,4;
tol = exp(-9)

[xVals, iter] = newtonRaphson(f, fprime, x0, tol)