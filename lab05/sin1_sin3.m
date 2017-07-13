function sin1_sin3()
    x = linspace(0, 4 * pi);
    plot(x, sin(x) + sin(3 * x), 'm', ...
         'LineWidth', 3);
    grid on;
    yticks([-1 -0.3 0.1  1]);
    yticklabels({'Minimum','Critical','Collapse','maximum'});
    xlabel('x-axis');
    ylabel('Monthly Sales ($1000)');
    set(gca, 'XColor', 'g');
    set(gca, 'GridLineStyle', ':');
    set(gca, 'LineWidth', 2);
end