function hs = eval_noise(N, fileName, windowSize)
    half_ws = windowSize/2;
    h = zeros(N, 1);
    % load("mgn_0h5_0h9_v2.mat", "y")
    load(fileName, "output_noise")
    y = output_noise;
    for i=half_ws:(N-half_ws)
        slice = y((i-half_ws+1):(i+half_ws));
        h(i) = hurst_estimate(slice, "aggvar", 0);
%         h(i) = diffent(slice, "gaussian");
    end
%     time = 0:0.01:100;
    hs = h;
end