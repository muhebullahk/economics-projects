% Define the price range
P = 40:2:60; % Price levels from 40 to 60 in steps of 2

% Define the equations
Y_SRAS1 = 3000 + 50 * P; % SRAS1 curve
Y_SRAS2 = 2800 + 50 * P; % SRAS2 curve
Y_AD = 8000 - 50 * P;    % AD curve

% Plot the curves
figure;
hold on;
plot(Y_SRAS1, P, 'b', 'LineWidth', 2, 'DisplayName', 'SRAS1');
plot(Y_SRAS2, P, 'r', 'LineWidth', 2, 'DisplayName', 'SRAS2');
plot(Y_AD, P, 'g', 'LineWidth', 2, 'DisplayName', 'AD');

% Mark the equilibrium points
scatter(5500, 50, 100, 'k', 'filled', 'DisplayName', 'Initial Equilibrium (Y=5500, P=50)');
scatter(5400, 52, 100, 'm', 'filled', 'DisplayName', 'New Equilibrium (Y=5400, P=52)');

% Add labels and title
xlabel('Output (Y)');
ylabel('Price Level (P)');
title('Aggregate Demand and Supply Curves');
legend('show');
grid on;
hold off;


