format short e;

f= @(x) 3*x- cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);

x0 = 0,4;
tol = 1e-09;

[xVals, iter] = steffensen(f,fprime, x0, tol)

%{
fxvals = f(xVals)
absolute = abs((1/6)-xVals)

eocs = [];

for k = 2:iter
    eoc = log(absolute(k))/(log(absolute(k-1)));
    eocs(k-1) = eoc;
end

eocs
meanVal = mean(eocs);
%}