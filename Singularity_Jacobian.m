J = J_PD(1:3,1:3)
eqn = simplify(det(J)) == 0
S = solve(eqn,q2,d3,'Real',true)
S.q2
S.d3