function lab06_1()
    pr = bernoulli(0.25, 1:25);
    hold on;
    box on;
    bar(pr);
    plot(1:25, cumsum(pr), 'r', ...
         'linewidth', 2);
    xlim([0 25]);
    hold off;
    title('Lab06 Problem1');
    

end
function pr = bernoulli(p, k)
    pr = (1 - p) .^ (k - 1) .* p ;
end
