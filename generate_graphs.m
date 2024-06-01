% plot(zeros(N, 1) + const_h)
type = 2;
figure;
tiledlayout(2, 1);
nexttile;
hold on;
if type == 0
    % Ramp Function Plot
    plot(0.5:0.4/(N-1):0.9, "LineWidth", 2)
    directory_name = "Ramp";
end
if type == 1
    % Sin Function Plot
    plot(0.2 * sin(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Sin Wave";
end
if type == 2
    % Square Wave Function Plot
    plot(0.2 * square(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Square Wave";
end
if type == 3
    % Sawtooth Function Plot
    plot(0.2 * sawtooth(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Saw Tooth";
end
load("data/" + directory_name + "/glfvobd_h_preds.mat", "hs");
plot(hs)
title("GL Method")
legend("H_d", "H_{est}", "Location", "southeast")

nexttile;
hold on;
if type == 0
    % Ramp Function Plot
    plot(0.5:0.4/(N-1):0.9, "LineWidth", 2)
    directory_name = "Ramp";
end
if type == 1
    % Sin Function Plot
    plot(0.2 * sin(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Sin Wave";
end
if type == 2
    % Square Wave Function Plot
    plot(0.2 * square(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Square Wave";
end
if type == 3
    % Sawtooth Function Plot
    plot(0.2 * sawtooth(linspace(0, N * 0.001, N)) + 0.75, "LineWidth", 2);
    directory_name = "Saw Tooth";
end
load("data/" + directory_name + "/predcorr_h_preds.mat", "hs");
plot(hs)
title("PC Method")
legend("H_d", "H_{est}", "Location", "southeast")