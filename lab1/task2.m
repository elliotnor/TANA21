format short e;

n= 12
inbuilt = factorial(n)
comp = sqrt(2*pi*n) * (n/exp(1))^n

absoluteError = abs(inbuilt - comp)
relative = abs(inbuilt - comp)/abs(inbuilt)
