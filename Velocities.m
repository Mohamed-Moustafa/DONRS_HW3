%% Plot velosities
syms t q1_t q2_t d3_t real;

q1_t = sin(t);
q2_t = cos(2*t);
d3_t = sin(3*t);
q_t = [q1_t q2_t d3_t]';
qdot = diff(q_t);

J_time = simplify(subs(J_PD, { q1, q2, d3}, { q1_t, q2_t, d3_t}));

xi = simplify(J_time * qdot);

time = 0:0.01:10;
xi_time = subs(xi, {t}, {time});

fig = figure(1);
set(gcf,'color','w');
plot(time, xi_time(1:3, :), 'LineWidth', 2)
grid on
xlabel('Time')
ylabel('Velocity value')
title('Linear velocity plot')
legend('v_x', 'v_y', 'v_z')
fig = figure(2);
set(gcf,'color','w');
plot(time, xi_time(4:6, :), 'LineWidth', 2)
grid on
xlabel('Time')
ylabel('Velocity value')
title('Angular velocity plot')
legend('w_x', 'w_y', 'w_z')