clear

% Signal length
N = 20000;

% Create Alpha stable distribution with alpha = 2
alpha_stable_pd = makedist('Stable','alpha',2,'beta',0,'gam',1,'delta',0);
normal_pd = makedist('Normal');

% Generate random numbers based on alpha stable distribution
alpha_stable_noise = random(alpha_stable_pd, N, 1);
normal_noise = random(normal_pd, N, 1);

% Plot the noise
figure
plot(alpha_stable_noise)
hold on
plot(normal_noise)
title('Compare Alpha Stable and Normal noise signals')
legend('\alpha = 2','\alpha = Normal','Location','northwest')

% Compare the distributions
x = -5:.1:5;
alpha_stable_pdf = pdf(alpha_stable_pd, x);
normal_pdf = pdf(normal_pd, x);

figure
plot(x, alpha_stable_pdf,'b-');
hold on
plot(x, normal_pdf,'r-');
title('Compare Alpha Stable and Normal PDF Plots')
legend('\alpha = 2','\alpha = Normal','Location','northwest')
hold off

% Order function order
order_function_values = [0:(0.4 - 0)/(N - 1):0.4];
figure
plot(order_function_values)
title('Order function')

% Calculate Type A integration
% inputSignalBuffer = [0, alpha_stable_noise'];
inputSignalBuffer = [0, normal_noise'];
backward_view_length = 10000;
integration_result_type_A = zeros(1, N);
aRet = 1;
for stepCounter = 1:N
    buffer_start = max(stepCounter - backward_view_length + 1, 1);
    % Minus becasue it is integration
    order = -order_function_values(stepCounter);
%     x = alpha_stable_noise(stepCounter);
    x = normal_noise(stepCounter);
    [integration_result_type_A(stepCounter), aRet] = getGLFVOBD(x, order, inputSignalBuffer(buffer_start:stepCounter), aRet, stepCounter, backward_view_length);
end

figure
plot(integration_result_type_A)
title('Variable-order noise - Type A')

