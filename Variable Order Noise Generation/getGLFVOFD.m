function [ glVfobdValue, aRet] = getGLFVOFD(x, order, xBuffer, prevAValue, bufferStart, forwardViewLength)
%The Grunwald-Letnikov variable-, fractional-order backward difference
%   The GL-VFOBD calculation function with k0 = 0
    k = length(xBuffer);

    % Calculate vector 'a'
    a = getAvaluesVectorFromPoint(order, k, prevAValue, bufferStart);
    
    % Calculate result
    xVector = [x xBuffer(end:-1:1)]';
    glVfobdValue = a * xVector;
    if(bufferStart ~= 1)
        aRet = a(1);
    else
        aRet = a(2);
    end
    
end
