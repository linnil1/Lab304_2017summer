function lab06_5()
    % init
    dat = xlsread("06Scatter.xlsx");
    c1 = dat(dat(:, 3) == 0, [1 2]);
    c2 = dat(dat(:, 3) == 1, [1 2]);
    c3 = dat(dat(:, 3) == 2, [1 2]);
    figure('position', [0, 0, 700, 700]);

    % scatter plot
    subplot('Position', [.3 .3 .65 .65]);
    hold on;
    scatter(c1(:,1),c1(:,2), 'r^', 'filled', 'MarkerEdgeColor', 'k');
    scatter(c2(:,1),c2(:,2), 'yo', 'filled', 'MarkerEdgeColor', 'k');
    scatter(c3(:,1),c3(:,2), 'cs', 'filled', 'MarkerEdgeColor', 'k');
    hold off;
    box on;
    title('Scatter Plot');
    xlabel('PC1');
    ylabel('PC2');
    legend({'c/c', 'C/c', 'C/C'}, 'Position', [.05 .05 .15 .15]);

    % right bottom histogram
    subplot('Position', [.05 .3 .15 .65]);
    plotHistogram(c1, c2, c3, 2, @barh);
    xlim([0, 10]);
    ylim([-400 400]);
    ylabel("PC2");
    xlabel("Frequency");

    % left top histogram
    subplot('Position', [.3 .05 .65 .15]);
    plotHistogram(c1, c2, c3, 1, @bar);
    ylim([0, 10]);
    xlim([-400 400]);
    xlabel("PC1");
    ylabel("Frequency");
end

% histogram to bar
function plotHistogram(c1, c2, c3, pc, barfunc)
    cminmax = minmax([c1(:,pc)', c2(:,pc)', c3(:,pc)']);
    cmin = max([-400, cminmax(1)]);
    cmax = min([ 400, cminmax(2)]);
    edges =  linspace(cmin, cmax, 11);
    counts = [histcounts(c1(:,pc)', edges); ...
              histcounts(c2(:,pc)', edges); ...
              histcounts(c3(:,pc)', edges)];
    b = barfunc(linspace(cmin, cmax, 10), counts', 'Stacked');
    set(b,{'FaceColor'},{'r'; 'y'; 'c'})
    box on;
end