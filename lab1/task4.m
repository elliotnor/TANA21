format long;

A=[0.913 0.659; 0.457 0.33]; 
b=[0.254; 0.127];

x_exact=[1;-1];
exact = A*x_exact-b
x_num=A\b


b_hat=[0.2539949; 0.1272061]; 
b_tilde=[0.252428; 0.126213];

x_hat=A\b_hat
x_tilde = A\b_tilde

r_hat = b-(A*x_hat);
r_tilde = b-(A*x_tilde);

norm_hat = norm(r_hat,1)
norm_tilde = norm(r_tilde, 1)