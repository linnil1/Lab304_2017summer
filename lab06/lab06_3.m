function lab06_3()
    gas = load("06Gas.mat");
    figure('position', [0, 0, 1000, 700]);

    subplot(3, 1, 1);
    errorbar(gas.years, mean(gas.gasoline_prices, 2), ...
             mean(gas.gasoline_prices, 2) - min(gas.gasoline_prices, [], 2), ...
             'r');
    xlabel('Year');
    ylabel('$/Gallon');
    ylim([0.5 2]);
    set(gca, 'fontsize', 12);
    title('Gas Price', 'fontsize', 14);

    subplot(3, 1, 2);
    cond = arrayfun(@(x) find(gas.years == x, 1, 'first'), [1990 1995 2000]);
    p = plot(gas.gasoline_prices(cond, :)', ...
             'linewidth', 2); % ,'r-*','b..o','g--^')
    grid on;
    xlabel('Month');
    ylabel('$/Gallon');
    xticks(1:12);
    xticklabels(gas.months);
    colorlist =     {'r'; 'b'; 'g' };
    linestylelist = {'-'; ':'; '--'};
    markerlist =    {'*';' o'; '^' };
    set(p, {'LineStyle'}, linestylelist, ...
           {'Color'},     colorlist, ...
           {'Marker'},    markerlist);
    tx = textscan(num2str([1990 1995 2000]),'%s');
    legend(tx{1}', 'Location', 'northwest');
    set(gca, 'fontsize', 12);
    title('Monthly Prices at 1990, 1995, 2000', 'fontsize', 14);

    subplot(3, 1, 3);
    histogram(gas.gasoline_prices, 20, 'Normalization', 'probability');
    ylabel('Fraction');
    xlabel('$/Gallon');
    set(gca, 'fontsize', 12);
    title('Monthly Price Distribution', 'fontsize', 14);
end