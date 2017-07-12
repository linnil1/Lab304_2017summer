function name = typeMin(mat)
    % be care for Inf and NaN
    if all(mod(mat, 1) ~= 0)
        name = 'None';
    elseif all(0 <= mat & mat < 2^8)
        name = 'uint8';
    elseif all(0 <= mat & mat < 2^16)
        name = 'uint16';
    elseif all(0 <= mat & mat < 2^32)
        name = 'uint32';
    elseif all(0 <= mat & mat < 2^64)
        name = 'uint64';
    else
        name = 'None';
    end
end