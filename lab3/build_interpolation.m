function [X,L] = build_interpolation(M,xVals,yVals) 

    X = linspace(xVals(1), xVals(end), M);

    for k = 1:M
        L(k) = Lagrange_interpolation(X(k), xVals, yVals)
    end 

end