clear 

% robot fixed paramters forprocessding the task
d1 = 1;
a2 = 1;

%robot given angles , Here you can put any combination of angles
disp('Given Agnles');
q=[pi/1.5 pi/1.5 1] %q is vector (1x3) that holds q1 q2 d3 values

% Forward Kinematics Calculations
disp('H= Homogenous Forward kinematics Endeffector matrix');
H= FK_fn(q)


% Extract Position from Homegoneous matrix
Px =  H(1,4);
Py =  H(2,4);
Pz =  H(3,4);

%1st solution
q1 = atan2 (Py , Px);
q2 = atan2 ( (d1 - Pz) , sqrt(Px^2+Py^2) );
d3 = sqrt( (Px^2 + Py^2) + (d1 - Pz)^2 ) - a2;
fprintf('1st solution IK angles   q1=%f  , q2=%f  , d3=%f \n',q1,q2,d3);
fprintf('H1 = represents FK for angles obtained from IK')
H1 =  Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3)

% 2nd solution
q1_2 = q1 + pi;
q2_2 = -q2 +pi;
d3_2 = d3 ;
fprintf('2nd solution IK angles   q1=%f  , q2=%f  , d3=%f \n',q1_2,q2_2,d3_2);
fprintf('H3 = represents FK for angles obtained from IK')
H3 =  Rz(q1_2) * Tz(d1) * Ry(q2_2) * Tx(a2) * Tx(d3_2)

% 3rd solution
q1_3 = q1;
q2_3 = q2 + pi;
d3_3 = -(d3 + 2*a2);
fprintf('3rd solution IK angles   q1=%f  , q2=%f  , d3=%f \n',q1_3,q2_3,d3_3);
fprintf('H2 = represents FK for angles obtained from IK')
H2 =  Rz(q1_3) * Tz(d1) * Ry(q2_3) * Tx(a2) * Tx(d3_3)


% 4th solution
q1_4 = q1 + pi;
q2_4 = -q2 ;
d3_4 = -(d3 + 2*a2);
fprintf('4th solution IK angles   q1=%f  , q2=%f  , d3=%f \n ',q1_4,q2_4,d3_4);
fprintf('H4 = represents FK for angles obtained from IK')

H4 =  Rz(q1_4) * Tz(d1) * Ry(q2_4) * Tx(a2) * Tx(d3_4)