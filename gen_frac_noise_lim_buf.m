function noise = gen_frac_noise_lim_buf(inputNoise, orderFuncVals, bufferSize, N)
%     % Order function order
%     order_function_values = [0:(0.4 - 0)/(N - 1):0.4];
%     figure
%     plot(order_function_values)
%     title('Order function')
    
    % Calculate Type A integration
    % inputSignalBuffer = [0, alpha_stable_noise'];
    inputSignalBuffer = [0, inputNoise'];
    backward_view_length = bufferSize;
    integration_result_type_A = zeros(1, N);
    for stepCounter = 1:N
        buffer_start = max(stepCounter - backward_view_length + 1, 1);
        % Minus becasue it is integration
        order = -orderFuncVals(stepCounter);
    %     x = alpha_stable_noise(stepCounter);
        x = inputNoise(stepCounter);
        integration_result_type_A(stepCounter) = getGLFVOBD(x, order, inputSignalBuffer(buffer_start:stepCounter));
    end
    noise = integration_result_type_A;
end