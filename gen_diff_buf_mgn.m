clear

% Signal length
N = 20000;

% Create Alpha stable distribution with alpha = 2
alpha_stable_pd = makedist('Stable','alpha',2,'beta',0,'gam',1,'delta',0);
normal_pd = makedist('Normal');

% Generate random numbers based on alpha stable distribution
alpha_stable_noise = random(alpha_stable_pd, N, 1);
normal_noise = random(normal_pd, N, 1);

% % Plot the noise
% figure
% plot(alpha_stable_noise)
% hold on
% plot(normal_noise)
% title('Compare Alpha Stable and Normal noise signals')
% legend('\alpha = 2','\alpha = Normal','Location','northwest')

% % Compare the distributions
% x = -5:.1:5;
% alpha_stable_pdf = pdf(alpha_stable_pd, x);
% normal_pdf = pdf(normal_pd, x);
% 
% figure
% plot(x, alpha_stable_pdf,'b-');
% hold on
% plot(x, normal_pdf,'r-');
% title('Compare Alpha Stable and Normal PDF Plots')
% legend('\alpha = 2','\alpha = Normal','Location','northwest')
% hold off

% Order function order
% order_function_values = [0:(0.4 - 0)/(N - 1):0.4];
% order_function_values = 0.4 * sin(linspace(0, N * 0.001, N));
% order_function_values = zeros(N, 1)+0.4;
% order_function_values = 0.3 * square(linspace(0, N * 0.001, N));
% order_function_values = 0.4 * sawtooth(linspace(0, N * 0.001, N));
% order_function_values = [-0.4:(0.4 + 0.4)/(N - 1):0.4];
% order_function_values = [0:(0.4 - 0)/(N - 1):0.4];
% order_function_values = 0.2 * sawtooth(linspace(0, N * 0.001, N)) + 0.25;
% order_function_values = 0.2 * sin(linspace(0, N * 0.001, N)) + 0.25;
order_function_values = 0.2 * square(linspace(0, N * 0.001, N)) + 0.25;

% figure
% plot(order_function_values)
% title('Order function')

% buffer_sizes = [50, 500, 5000, 50000];
buffer_sizes = [5000];
for buffer_size=buffer_sizes
    output_noise = gen_frac_noise_lim_buf(normal_noise, order_function_values, buffer_size, N);
    save("./data/Square Wave/mgn_square_0h55_0h95_glfvobd_buf" + buffer_size + "_size" + N + ".mat", "output_noise")
end