format short e;

f = @(x) 3*x - cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);
x0 = 0.4;
tol = 1e-09;

[xVals, iter] = newtonRaphson(f,fprime,x0,tol)

eocv = 1:9;

fk = f(xVals)

ae = abs(1/6 - xVals)

for k = 2:9
    eoc = log(abs(1/6 - xVals(k)))/log((abs(1/6 - xVals(k-1))))

    eocv(k-1) = eoc;
end

average = mean(eocv)