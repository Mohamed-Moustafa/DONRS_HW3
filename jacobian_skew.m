%2nd method Jacobian Skew Theory 
d1 = 1;
a2 = 1;
syms q1 q2 d3 real;

T00 = eye(4)
T01 = Rz(q1) * Tz(d1)
T02 = Rz(q1) * Tz(d1) * Ry(q2)
T03 = Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3)

O0 = T00(1:3,4)
O1 = T01(1:3,4)
O2 = T02(1:3,4)
O3 = T03(1:3,4)

z0 = T00(1:3,3) 
z1 = T01(1:3,2) 
z2 = T02(1:3,1) 




J1 = [cross(z0,(O3 - O0)); z0]
J2 = [cross(z1,(O3-O1)); z1]
J3 = [z2; zeros(3,1)]
J_full = [J1 J2 J3]
J_Skew = simplify(J_full)

test = simplify(J_Numerical - J_Skew)