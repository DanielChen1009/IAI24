n = 10000;
window_size = 500;
half_ws = window_size/2;
is_hurst_of_hurst = false;
h = zeros(n, 3);
h2 = zeros(n, 1);
tiledlayout(2, 1)
% load("mgn_0h5_0h9_v2.mat", "y")
% load("data/ffgnn_0h25_buf1000_size10000.mat", "output_noise")
load("mgn_sin_")
y = output_noise;
for i=half_ws:(n-half_ws)
    slice = y((i-half_ws+1):(i+half_ws));
    h(i,1) = hurst_estimate(slice, "aggvar", 0);
end
nexttile;
hold on
plot(h(:, 1))

if (is_hurst_of_hurst)
    t = [1:length(h(:, 1))]';
    opol = 200;
    [p,s,mu] = polyfit(t,h(:, 1),opol);
    f_y = polyval(p,t,[],mu);
    
    detrended_h = h(:, 1) - f_y;
    
    plot(detrended_h)
    y = detrended_h;
end
for i=window_size:(n-window_size)
    slice = y((i-half_ws+1):(i+half_ws));
    h2(i) = hurst_estimate(slice, "aggvar", 0);
end
time = 0:0.01:100;
plot(zeros(n, 1) + 0.25)
plot(h2)
legend("hurst", "detrended h", "original hurst val", "hurst of hurst")
% plot(0.5:0.4/(n-1):0.9)
% % plot(0.75+0.25*sin(0.25*time))
% % nexttile;
% % plot(h(:,2))
% % plot(0.75+0.25*sin(0.25*time))
% % nexttile;
% % plot(h(:,3))
% % plot(0.5+0.000008*time)
% % plot(0.75+0.25*sin(time))
nexttile;
plot(y)
hold off