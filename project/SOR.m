function [x, k] = SOR(A, b, x0, tol, omega)
    %%
    % SOR iterative method to approximate the solution of a
    % linear system Ax = b up to a user-defined tolerance
    %
    % INPUT:
    % A - n by n square, non-singular matrix
    % b - n by 1 right-hand side vector
    % x0 - n by 1 vector containing the initial guess for the iteration
    % tol - tolerance for the stopping condition in the iteration
    % omega - relaxation factor (1 for Gauss-Seidel, less than 2 for convergence)
    %
    % OUTPUT:
    % x - n by 1 vector containing the iterative solution
    % k - number of iterations
    %%
    
    % Get the system size
    n = length(A);
    
    % Set maximum iterations
    max_its = 22000;
    
    % Initialize the solution vector
    x = x0;
    
    % Iterate using the SOR method
    for k = 1:max_its
        for i = 1:n
            sum = 0;
            for j = 1:n
                if j ~= i
                    sum = sum + A(i, j) * x(j);
                end
            end
            x(i) = (1 - omega) * x(i) + (omega / A(i, i)) * (b(i) - sum);
        end
        
        % Check for convergence
        r = b - A * x;
        if norm(r, 2) < (tol * norm(b, 2))
            break;
        end
    end
end
