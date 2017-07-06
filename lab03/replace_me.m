function rv = replace_me(v, a, b, c)
    if nargin == 4
        replace_v = [b c];
    elseif nargin == 3
        replace_v = [b b];
    else
        replace_v = [0 0];
    end
    rv = [];
    for x = v
        if x == a
            rv = [rv replace_v];
        else
            rv(end + 1) = x;
        end
    end
end