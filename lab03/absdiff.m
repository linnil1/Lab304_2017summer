function ad = absdiff(vect)
    if ~isvector(vect)
        error('This is not a vector');
    end
    if length(vect) < 2
        error('at least two elements');
    end
    ad = abs(vect(2 : end) - vect(1 : end - 1));
end
