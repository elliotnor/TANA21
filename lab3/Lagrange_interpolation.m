function [pnx] = Lagrange_interpolation(z,x,y)
%%
%  Implementation to evaluate an interpolating polynomial p_n(x) 
%  at the point x = z. The polynomial uses the standard Lagrange
%  basis functions.
%
%  INPUT:
%
%     z    - 1x1 value to evaluate
%     ???
%
%  OUTPUT:
%
%     pnx - value of the polynomial interpolant at x = z
%

%%
%  compute the polynomial interpolation sum evaluated at x = z
   pnx = 0;
   for i = 1:length(x)
       L(i) = 1;

      for j = 1:length(x)
          if j ~= i
              L(i) = L(i) * (z-x(j))/(x(i)-x(j));
          end
      end

      pnx = pnx + L(i)*y(i);
   end
end
