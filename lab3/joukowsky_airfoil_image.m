function joukowsky_airfoil_image
%%
%  This perfoms the conformal mapping to create a particular instance of a Joukowsky airfoil
%
  theta = linspace(0,2*pi,300); % angles
  r     = 1.0;                  % radius
  s     = 0.175 + 1i*0.215;     % circle origin
  zeta  = s + r*exp(1i*theta);  % original circle values in complex space (written in polar form)
  k     = r - s;                % transformation parameter
  z     = zeta + k^2./zeta;     % conformal mapping of airfoil surface in complex space
  z     = z*exp(1i*pi/11);      % rotate airfoil location
  
  plot(-real(z),imag(z),'-k','LineWidth',1.5) % plot the transformed airfoil

% plot the top and bottom curves
%   plot(topx,topy,'-k',botx,boty,'-k','LineWidth',1.5)
   hold on
% set limits and size of figure
   set(gcf,'Position',[10, 10, 1500, 400])
   set(gca,'FontSize',16);
   xlim([-2.0 2.0])
   ylim([-0.2 0.9])
% fill with gray color for better visualization
   h1 = fill(-real(z),imag(z),'k','LineStyle','none');
   set(h1,'facealpha',0.05);
%
%    for i = 1:length(z)
%       plot(-real(z(i)),imag(z(i)),'ro','MarkerSize',10)
%    end
end