function circleDraw(center, radius, color, thickness)
    axis equal
    hold on
    box on;
    for i = 1:length(center)
        circle(center(i,:), radius(i), color{i}, thickness(i));
    end
    hold off
end

function h = circle(cent, r, color, thick)
    rectangle('Position', [-r+cent(1) -r+cent(2) 2*r 2*r], ...
              'Curvature', [1 1], ...   
              'EdgeColor', color, ...
              'LineWidth', thick);
end