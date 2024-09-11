function DrawCurveFit(c, t, y)
%%
%  Given the original data points (t_i, y_i) and the coefficients c_j
%  for the curve fitting ansatz
%     f(t) = c_1 + c_2 cos(2 pi t / T) + c_3 sin(2 pi t / T)
%                + c_4 cos(4 pi t / T) + c_5 sin(4 pi t / T)
%  where T = t(end) - t(1).
%  This function plots the curve fitting and the original points in the
%  same figure.
%
%  INPUT: 
%    c - Vector of coefficient values
%    t - Vector of original time values
%    y - Vector of original data values
%
%  OUTPUT:
%    prints a figure to the screen

%%
%  Compute length of the time interval

   T = t(end) - t(1);

%%
%  Get an enriched set of uniform points in the interval [t(1), t(end)]
%  for nicer plotting

   tt = linspace(t(1), t(end), 200);

%  Compute the curve ansatz on the enriched points

   f = c(1) + c(2) * cos(2 * pi * tt / T) + c(3) * sin(2 * pi * tt / T)...
            + c(4) * cos(4 * pi * tt / T) + c(5) * sin(4 * pi * tt / T);

%%
%  Make a new figure (avoids overwriting an existing figure)

   figure

%%
%  Plot the original data points with blue dots

   plot(t, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 7)
   
%  Plot the curve fitting in the same figure using a solid red line

   hold on
   plot(tt, f, 'r-', 'LineWidth', 1.5)

%  Set x-axis limit, label axes, and increase font size of the figure

   xlim([t(1), t(end)])
   xlabel("time (s)",'interpreter','latex')
   ylabel("blood pressure (mmHg)",'interpreter','latex')
   set(gca, 'FontSize', 20)
   
end