function pr = pascalrow(n)
    pr = [];
    for i = 0:n
        pr(end + 1) = nchoosek(n, i);
    end
end
    