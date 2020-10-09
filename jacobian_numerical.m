%1st method Jacobian Numerical Method
d1 = 1;
a2 = 1;
syms q1 q2 d3 real;

H =  Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3);
H=simplify(H);

% rotation matrix of the end effector
R = simplify(H(1:3,1:3));

% get t1he jacobian of the first joint
J1r = Rzd(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3) *[R^-1 zeros(3,1);0 0 0 1];
%J1r = simplify(J1r)
% get the jacobian elements
J1 = [ J1r(1,4), J1r(2,4) ,J1r(3,4), J1r(3,2) ,J1r(1,3), J1r(2,1)]';



 %2nd joint

J2r = Rz(q1) * Tz(d1) * Ryd(q2) * Tx(a2) * Tx(d3) *[R^-1 zeros(3,1);0 0 0 1];
%J2r = simplify(J2r)
% get the jacobian elements
J2 = [ J2r(1,4), J2r(2,4), J2r(3,4), J2r(3,2) ,J2r(1,3), J2r(2,1)]';

%3rd joint

J3p = Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Txd(d3) *[R^-1 zeros(3,1);0 0 0 1];
%J3p = simplify(J3p)
% get the jacobian elements
J3 = [ J3p(1,4), J3p(2,4), J3p(3,4) ,J3p(3,2) ,J3p(1,3) ,J3p(2,1)]';

% Full jacobian
J_Numerical = [simplify(J1), simplify(J2), simplify(J3)]