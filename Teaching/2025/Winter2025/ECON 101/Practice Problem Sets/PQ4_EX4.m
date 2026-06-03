% Given parameters
Y_actual = 2700; % Actual GDP (in recession)
Y_full = 3000;   % Full-employment GDP
P_initial = 100; % Initial price level
P_final = 90;    % Final price level after adjustment

% Define the price range
P = 80:120; % Price level range

% Define the AD curve (assume AD is constant for simplicity)
Y_AD = 4000 - 10 * P; % Example AD curve: Y = 4000 - 10P

% Define the initial SRAS curve (short-run aggregate supply)
Y_SRAS_initial = 2000 + 7 * P; % Example SRAS curve: Y = 2000 + 7P

% Define the final SRAS curve (after wage adjustment)
Y_SRAS_final = 1800 + 8 * P; % Example SRAS curve: Y = 1800 + 8P

% Define the LRAS curve (vertical line at full-employment GDP)
Y_LRAS = Y_full * ones(size(P)); % LRAS curve: Y = 3000

% Plot the AD-AS diagram
figure;
hold on;
plot(Y_AD, P, 'b', 'LineWidth', 2, 'DisplayName', 'AD');
plot(Y_SRAS_initial, P, 'r', 'LineWidth', 2, 'DisplayName', 'SRAS (Initial)');
plot(Y_SRAS_final, P, 'g', 'LineWidth', 2, 'DisplayName', 'SRAS (Final)');
plot(Y_LRAS, P, 'k--', 'LineWidth', 2, 'DisplayName', 'LRAS'); % LRAS curve

% Mark the recessionary gap
scatter(Y_actual, P_initial, 100, 'k', 'filled', 'DisplayName', 'Recessionary Gap (Y=2700)');
scatter(Y_full, P_final, 100, 'm', 'filled', 'DisplayName', 'Full Employment (Y=3000)');

% Add labels and title
xlabel('Output (Y)');
ylabel('Price Level (P)');
title('Long-Run Adjustment to a Recessionary Gap');
legend('show');
grid on;
hold off;

% Explanations
fprintf('1. The initial recessionary gap is shown at Y = 2700.\n');
fprintf('2. Over time, wages adjust, shifting the SRAS curve to restore full employment.\n');
fprintf('3. Government intervention (e.g., fiscal or monetary policy) can accelerate the adjustment.\n');
fprintf('4. Classical view: No intervention needed; markets self-correct.\n');
fprintf('   Keynesian view: Government intervention is necessary to stabilize the economy.\n');