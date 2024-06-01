function [ glVfobdValue, newAvaluesBuffer] = getGLFVOBDOptimized( x, order, xBuffer, aValuesBuffer, previousOrder, h)
    % The Grunwald-Letnikov variable-, fractional-order backward difference
    % The GL-VFOBD calculation function with k0 = 0

    k = length(xBuffer);
    if  order == previousOrder
        % Order was not changed - use old avalues vector to calculate next
        % avalue
        previousAvalue = aValuesBuffer(end);
        aValue = getNextAvalue(order, previousAvalue, k);
        newAvaluesBuffer = [aValuesBuffer aValue];
    else
        % Order was changed - calculate avalues vector
        newAvaluesBuffer = getAvaluesVector(order, k);
    end

    % Calculate result
    xVector = [x xBuffer(end:-1:1)]';
    glVfobdValue = newAvaluesBuffer * xVector / (h^order); 
end