function p = poisson(k, l)
    p = exp(-l) .* (l .^ k) ./ factorial(k);
end