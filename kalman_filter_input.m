% This script prepares measurements and torque input to use them
% in the simulink model. It simulates the model and plots the results.

t = (0:dt:T - dt)';  
measurement_data = [t measurements]; 
torque_data = [t u];

x_true = true_states(1, :)';     
v_true = true_states(2, :)';   

simOut = sim('kalman_filter.slx'); 
x_est = simOut.x_hat.Data(1, :);
v_est = simOut.x_hat.Data(2, :);


figure
plot(t, x_true, 'b', 'LineWidth', 1.5); hold on;
plot(t, measurements, 'r', 'LineWidth', 1.5);
plot(t, x_est, 'g', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Position');
legend('Ground Truth Position', 'Noisy Measurements', 'Estimated Position');
title('Position Plot');
grid on;


figure;
plot(t, v_true, 'b', 'LineWidth', 1.5); hold on;
plot(t, v_est, 'g', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Velocity');
legend('Ground Truth Velocity', 'Estimated Velocity');
title('Velocity Plot');
grid on;
