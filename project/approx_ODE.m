function [x, y, k] = approx_ODE(omega, x_bounds, y_bounds, r, s, t, n)
    %%
    % Solves ODE on the form f’’(x) = r(x)f’(x) + s(x)f(x) + t(x)
    %
    % INPUT:
    % x_bounds - [x_min, x_max] defining the bounds for x
    % y_bounds - [y_min, y_max] defining the bounds for y
    % r, s, t - functions representing the ODE
    % n - number of sub-intervals
    % omega - relaxation factor between 1 and 2
    %
    % OUTPUT:
    % x - n+1 by 1 vector containing the x-values
    % y - n+1 by 1 vector containing the solution values
    % k - number of iterations used in SOR
    
    % Init parameters
    x_min = x_bounds(1);
    x_max = x_bounds(2);
    cL = y_bounds(1);
    cR = y_bounds(2);
    h = (x_max - x_min) / n;
    x = x_min:h:x_max;
    
    % Evaluate the function values over the x grid
    sx = s(x);
    rx = r(x);
    tx = zeros(1, n+1);
    for i = 1:n+1
        tx(i) = t(x(i));
    end
    
    % Create the matrix A for the finite difference approximation
    uD = -1 + h * rx(1:end-1) / 2;
    lD = -1 - h * rx(2:end) / 2;
    mD = 2 + h^2 * sx;
    
    A = diag(uD, 1) + diag(lD, -1) + diag(mD);
    A = A(2:end-1, :); % Adjust matrix size to exclude boundary conditions
    A = A(:, 2:end-1);
    
    
    % Set up the right-hand side vector
    rhs = -h^2 * tx(2:end-1)' + [(1 + h * rx(2) / 2) * cL; zeros(n-3, 1); (1 - h * rx(end-1) / 2) * cR]
    l_rhs = length(rhs)
    
    % Solve using SOR method
    [y_inner, k] = SOR(A, rhs, ones(n-1, 1), 10^(-11), omega);
    y = [cL; y_inner; cR]; % Append boundary conditions to the solution
end
