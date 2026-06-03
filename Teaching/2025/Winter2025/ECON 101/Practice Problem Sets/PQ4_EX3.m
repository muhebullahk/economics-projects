% Given parameters
MPC = 0.8; % Marginal Propensity to Consume
delta_G = 200; % Increase in government spending (in billions)

% 1. Calculate the spending multiplier and total increase in GDP
multiplier = 1 / (1 - MPC); % Spending multiplier formula
delta_Y = multiplier * delta_G; % Total increase in GDP

% Display results
fprintf('Spending Multiplier: %.2f\n', multiplier);
fprintf('Total Increase in GDP: %.2f billion\n', delta_Y);

% 2. Define the initial and new AD equations
% Initial AD curve: Y = 4000 - 100P
% New AD curve: Y_new = Y_initial + delta_Y
P = 0:40; % Price level range
Y_initial = 4000 - 100 * P; % Initial AD curve
Y_new = Y_initial + delta_Y; % New AD curve after fiscal policy

% 3. Plot the AD-AS diagram
figure;
hold on;
plot(Y_initial, P, 'b', 'LineWidth', 2, 'DisplayName', 'Initial AD');
plot(Y_new, P, 'r', 'LineWidth', 2, 'DisplayName', 'New AD');

% Add labels and title
xlabel('Output (Y)');
ylabel('Price Level (P)');
title('Impact of Expansionary Fiscal Policy on AD-AS Diagram');
legend('show');
grid on;
hold off;

% 4. Explain the impact on unemployment
fprintf('\nImpact on Unemployment:\n');
fprintf('As output increases, the unemployment rate will decrease.\n');
fprintf('This is because higher output typically requires more labor, reducing unemployment.\n');