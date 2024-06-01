% buffer_sizes = [2000, 5000, 10000, 20000, 50000];
% buffer_sizes = [50, 500, 5000, 50000];
buffer_sizes = [5000];
% levels = ["0h0", "0h1", "0h2", "0h3", "0h4", "0h5", "0h6", "0h7", "0h8", "0h9", "1h0"];
levels = ["0h0"];
N = 100000;
window_size = 1000;
const_h = 0.1;
lgd = cell(length(buffer_sizes) + 1, 1);
figure;
hold on
lgd{1} = "Hurst Parameter";
% plot(zeros(N, 1) + const_h)
% plot(0.5:0.4/(N-1):0.9, "LineWidth", 2)
% plot(0.2 * sin(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
% plot(0.2 * square(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
for level=levels
    for i=1:length(buffer_sizes)
        buffer_size = buffer_sizes(i)
    %     file_name = "./data/mgn_0h1_verif_buf" + buffer_size + "_size" + N + ".mat";
    %     file_name = "./data/mgn_0h5_0h9_verif_buf" + buffer_size + "_size" + N + ".mat";
    %     file_name = "./data/mgn_sin_verif_buf" + buffer_size + "_size" + N + ".mat";
    %     file_name = "./data/Ramp/mgn_ramp_0h5_0h9_glfvobd_buf5000_size20000.mat";
    %     file_name = "./data/Ramp/mgn_ramp_0h5_0h9_predcorr_buf0_size20000.mat";
%         file_name = "./data/Stochastic/predcorr/mgn_stochastic_"+ level + "_predcorr_buf5000_size20000.mat";
        file_name = "./data/Stochastic/mgn_stochastic_glfovbd_buf5000_size100000.mat";
    %     file_name = "./data/Stochastic/hurst_preds.mat";
        hs = eval_noise(N, file_name, window_size);
        plot(hs, "LineWidth", 1)
%         save("data/Stochastic/predcorr/results/" + level + "_estimation.mat", "hs", "N", "window_size", "-mat");
        save("data/Stochastic/h_est_" + window_size + ".mat", "hs", "-mat");
        lgd{i + 1} = strcat("Buffer Size: ", num2str(buffer_size));
    end
end
legend(lgd)
hold off