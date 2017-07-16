function lab06_4()
    figure;
    [x, y] = meshgrid(linspace(-8, 8), linspace(-8, 8));
    z = sin(sqrt(x .^ 2 + y .^ 2)) ./ sqrt(x .^ 2 + y .^ 2);
    surf(x, y, z, 'EdgeColor', 'none');
    colormap(hsv);
    axis off;
    view(45, 50);
    camzoom(1.6);
    light('Position',[8 8 1]);
end