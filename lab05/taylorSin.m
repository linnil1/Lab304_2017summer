function taylorSin()
    syms x;
    y = sin(x);
    tay = taylor(y, 'Order', 14);
    ran = [-2 * pi, 2 * pi];
    % plot
    figure('position', [0, 0, 800, 500]);
    hold on;
    ax = gca;
    ax.GridColor = 'b'; % seems not work
    ax.GridLineStyle = ':';
    ax.LineWidth = 1;
    grid on;
    box on;
    fplot(y, ran);
    fplot(tay, ran, 'r--', ...
          'LineWidth', 1);
    hold off;
    legend({'Sine', 'Taylor Polynomial'}, ...
        'FontSize', 15);
    title('Taylor polynomial of degree 13 for sine')
    xticks([-2 * pi, -pi, 0, pi, 2 * pi]);
    xticklabels({'-2\pi','-\pi','0','\pi','2\pi'});
    xlim(ran);
    ylim([-4 3]);
    xlabel('x');
    ylabel('y');
    annotation('textarrow', [0.18 0.15], [0.47 0.55], ...
        'String', '$$\sum_{n=0}^{6}\frac{(-1)^nx^{2n+1}}{(2n+1)!}$$', ...
        'interpreter', ...
        'latex', ...
        'FontSize', 15, ...
        'Color', 'r', ...
        'TextColor', 'k', ...
        'HorizontalAlignment', 'left');
 end