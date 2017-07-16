function lab06_2()
    axis equal;
    base = 1;
    th = linspace(0, 2 * pi)';
    hold on;
    fill(base * 10 * cos(th), base * 10 * sin(th), 'r', ...
        'edgecolor', 'none');
    fill(base * 9.8 * cos(th), base * 9.8 * sin(th), 'w', ...
        'edgecolor', 'none');
    fill(base * 9 * cos(th), base * 9 * sin(th), 'r', ...
        'edgecolor', 'none');
    w = base * 8;
    h = base * 2;
    fill([w -w -w w], [h h -h -h], 'w', ...
        'edgecolor', 'none');
    hold off;
    axis off;

end
