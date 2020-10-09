%3rd method Jacobian Partial Dervative 


d1 = 1;
a2 = 1;
syms q1 q2 d3 real;
H =  simplify(Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3));
R = H(1:3,1:3);
% the inverse of the rotation matrix
R_i = [R^-1 zeros(3,1);0 0 0 1];
%m = simplify(Rz(q1)* H * R_i);

H_dot = sym('A', [6 3]);

s = 6;
for r = 1:3
    
    H_dot(r,1) = diff(H(r,4),q1);
    H_dot(r,2) = diff(H(r,4),q2);
    H_dot(r,3) = diff(H(r,4),d3);

end



w1=simplify(Rzd(q1)*inv(Rz(q1)));
wx1 = w1(3,2);
wy1 = w1(1,3);
wz1 = w1(2,1);
H_dot(4,1) = wx1;
H_dot(5,1) = wy1;
H_dot(6,1) = wz1;

w2=simplify(Rz(q1)*Ryd(q2)*inv(Rz(q1)*Ry(q2)));
wx2 = w2(3,2);
wy2 = w2(1,3);
wz2 = w2(2,1);
H_dot(4,2) = wx2;
H_dot(5,2) = wy2;
H_dot(6,2) = wz2;
w3=simplify(Rz(q1)*Ry(q2)*Txd(d3)*inv(Rz(q1)*Ry(q2)*Tx(d3)));
wx3 = w3(3,2);
wy3 = w3(1,3);
wz3 = w3(2,1);
H_dot(4,3) = wx3;
H_dot(5,3) = wy3;
H_dot(6,3) = wz3;

J_PD = H_dot
Test= simplify(J_PD - J_Skew)