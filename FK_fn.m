function FK_matrix = FK_fn(angles)

d1=1;a2=1;

q1=angles(1);q2=angles(2);d3=angles(3);

%return 4x4 homogenous forward kinematics matrix for end effector
FK_matrix =  Rz(q1) * Tz(d1) * Ry(q2) * Tx(a2) * Tx(d3);

end