function third = rightangle(twos)
    if length(twos) ~= 2
        error('Only two columns are accepted. You give %d', length(twos));
    end
    third = sqrt(twos(:,1) .^ 2 + twos(:,2) .^ 2);
end