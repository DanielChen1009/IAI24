function [ avaluesVector ] = getAvaluesVectorFromPoint( order, maxK, prevAValue, bufferStart )
    avaluesVector = [prevAValue zeros(1, maxK)];
    
    for i = bufferStart+1:bufferStart+maxK
        shifted_ind = i - bufferStart + 1;
        avaluesVector(shifted_ind) = avaluesVector(shifted_ind-1) * (1 - ((order + 1)/(i-1)));
    end 
end

