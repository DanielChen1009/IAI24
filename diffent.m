function H = diffent(seq, type, max_window_size, step_size)
    if nargin < 3
        max_window_size = idivide(length(seq), int32(4));
        step_size = idivide(length(seq), int32(64));
    elseif nargin < 4
        step_size = idivide(length(seq), int32(64));
    end

    if type ~= "walk"
        seq = cumsum(seq);
    end

    Ls = double(1:step_size:max_window_size);
    S = zeros(length(Ls));
    for i=1:length(Ls)
        l = Ls(i);
        window_starts = 1:length(seq)-l;
        window_ends = l+1:length(seq);
        xs = seq(window_starts) - seq(window_ends);
        [h, b] = histcounts(xs);
        h = h(h ~= 0);
        binsize = b(2) - b(1);
        P = h./sum(h);
        S(i) = -sum(P.*log(P))+log(binsize);
    end
    Ls = log(Ls);

    fit_start = 1;
    fit_end = length(Ls)/4;

    coeff = polyfit(Ls(fit_start:fit_end), S(fit_start:fit_end), 1);
%     hold on
%     scatter(Ls, S)
%     plot(Ls, polyval(coeff, Ls))
%     hold off
    H = coeff(1);
end