function roman = toRoman(num)
    if num < 1 || num > 20
        roman = '0';
        return
    end
    digarr = [];
    while num
        digarr(end + 1) = mod(num, 10);
        num = fix(num / 10);
    end
    roman = '';
    for i = length(digarr):-1:1
        roman = [roman romanGet(digarr(i), i)];
    end
end
    
function rc = romanGet(d, n)
    rc = '';
    % dignum     1 2
    % index     1234
    romanchs = 'IVX';
    n = n * 2;
    if d == 9
        rc(end + 1) = romanchs(n - 1);
        rc(end + 1) = romanchs(n + 1);
        return
    elseif d >= 5
        rc(end + 1) = romanchs(n);
        d = d - 5;
    end
    if d == 4
        rc(end + 1) = romanchs(n - 1);
        rc(end + 1) = romanchs(n);
    else 
        while d ~= 0
            rc(end + 1) = romanchs(n - 1);
            d = d - 1;
        end
    end
end
    