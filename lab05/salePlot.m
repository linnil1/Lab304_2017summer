function salePlot()
    month = {'Jan', 'Feb', 'March', 'April', 'May', 'June'};
    data = [13, 5, 7, 14, 10, 12];
    plot(data,'-o', ...
        'LineWidth', 2, ...
        'MarkerSize', 10);
    xlabel('Month');
    ylabel('Monthly Sales ($1000)');
    title('Print Sales for January to June, 2014', ...
          'FontSize', 16, ...
          'FontWeight' , 'normal');
    xticklabels(month);
    set(gca,'fontsize',14);
    ylim([0 15]);
end