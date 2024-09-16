A = [4 -2 1; 3 2 -6; 1 -1 1];

lufact(A);

B = [2 0 6 3; -4 0 1 -9; 1 11 2 -4.75; -2 6 -7 -11]


[L,U,P] = lufact(B)

[L_ex, U_ex, P_ex] = lu(B)
