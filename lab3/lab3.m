%{
n = 10;
h = 1/n;

f = @(x) exp(sin(4.*x));
f_chain = @(x) 4. * exp(sin(4.*x)) .* cos(4.*x);
func1 = @(x) 2 * x.^2;
func2 = @(x) x.^3 + 2.*x -3;

points = linspace(0, 1, n+1);
f_ones = ones(n+1,1);

fval = f(points)';
f_chain_vals = f_chain(points)';


Dx_diag = [-3/2; zeros(n-1, 1); 3/2];
Dx_upper = [2; 0.5*ones(n-1, 1)];
Dx_upper2 = [-1/2; zeros(n-2, 1)];
Dx_lower = [-0.5*ones(n-1, 1); 2];
Dx_lower2 = [zeros(n-2, 1); 1/2];

%Dx = (diag(Dx_diag) + diag(Dx_upper, 1) + diag(Dx_lower, -1))/h;
Dx2 = (diag(Dx_diag) + diag(Dx_upper, 1) + diag(Dx_lower, -1) + diag(Dx_upper2, 2) + diag(Dx_lower2, -2))/h;

f_prime = Dx2 * fval;
%f_bla = Dx * f_ones;


for i = 1:n
    err(i) = abs(f_chain_vals(i)-f_prime(i));
end
biggest_error = max(err);
%}

%{
%% 3.2

M = 150;

func1 = @(x) 2 * x.^2;
func2 = @(x) x.^3 + 2.*x -3;

xVals = [-1 0 1];
yVals = [2 0 2];

xVals2 = [-1.0 0.0 1.0 1.5];
yVals2 = [-6.0 -3.0 0.0 3.375];

[X1,L1] = build_interpolation(M,xVals,yVals);
[X2,L2] = build_interpolation(M,xVals2,yVals2);

norm(func1(X1) - L1,inf)
norm(func2(X2) - L2,inf)

%plot(X1,func1(X1),'-k',X1,L1,'--r',xVals,yVals,'rd','MarkerFaceColor','r','MarkerSize',7);
%plot(X2,func2(X2),'-k',X2,L2,'--r',xVals2,yVals2,'rd','MarkerFaceColor','r','MarkerSize',7);
%}

%{
%% 3.3
M = 150;
z = 6;
xVals = [1 2 3 4 5];
yVals = [1 1 2 6 24];

[X,L1] = build_interpolation(M,xVals,yVals);
[pnx] = Lagrange_interpolation(z,xVals,yVals)

gamma_z = gamma(z)
err = abs(gamma(z) - pnx)

norm(gamma(X) - L1,inf);
plot(X,gamma(X),'-k',X,L1,'--r',xVals,yVals,'rd','MarkerFaceColor','r','MarkerSize',7);
%}

%% 3.4
M = 150;
xVals = x_joukow;
yVals = y_joukow;

[X,L1] = build_interpolation(M,xVals,yVals);

x = linspace(-1.775, 1.695, M);

s = spline(x_joukow, y_joukow, X);

%hold
%joukowsky_airfoil_image

plot(X,s,'-.g','LineWidth',2)
%plot(x,L1,'--r','MarkerFaceColor','b','MarkerSize',8)
%plot(x_joukow,y_joukow,'bo','MarkerFaceColor','b','MarkerSize',8)

