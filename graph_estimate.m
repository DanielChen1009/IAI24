labels = ["0h0", "0h1", "0h2", "0h3", "0h4", "0h5", "0h6", "0h7", "0h8", "0h9", "1h0"];
avgs = [];
for i=1:length(labels)
    label = labels(i)
    load("data/Stochastic/glfvobd verif/results/" + label + "_estimation.mat", "hs", "window_size", "N");
    slice = (window_size / 2):(N - window_size/2);
    avgs = [avgs, sum(hs(slice))/length(slice)];
end
figure;
hold on;
plot(0:0.1:1, 0:0.1:1);
scatter(0:0.1:1, avgs, "filled")
legend("Expected H_{est}", "H_{est}", "Location", "northwest")
hold off;