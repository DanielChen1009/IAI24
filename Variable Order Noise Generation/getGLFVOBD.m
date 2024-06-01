function [ glVfobdValue] = getGLFVOBD(x, order, xBuffer)
%The Grunwald-Letnikov variable-, fractional-order backward difference
%   The GL-VFOBD calculation function with k0 = 0
    k = length(xBuffer);

    % Calculate vector 'a'
%     bufferStart = max(timeStep - backwardViewLength + 1, 1);
    a = getAvaluesVector(order, k);
    % Calculate result
    xVector = [x xBuffer(end:-1:1)]';
    glVfobdValue = a * xVector;
%     if(timeStep == backwardViewLength)
%         aRet = a(1);
%     else
%         aRet = a(1);
%     end
end
