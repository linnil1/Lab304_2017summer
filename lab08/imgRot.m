function blank = imgRot(base, th)
    % input reassign
    th = -th;
    c = size(base,2);
    r = size(base,1);
 
    % transform matrix
    t = [cosd(th) sind(th); -sind(th) cosd(th)];

    % new size
    newsize = [r c] * abs(t);
    newr = newsize(1);
    newc = newsize(2);
    
    % rotate from center and move back the suitable place
    [y, x] = meshgrid(-newc/2:newc/2, -newr/2:newr/2);
    newxy =  round([r; c] ./ 2 + ...
        t' * [reshape(x, 1, numel(x)); reshape(y, 1, numel(y))]);
    
    % filter out out-size points
    filter_cond = newxy(1,:)>=1 & newxy(2,:)>=1 & newxy(1,:)<=r & newxy(2,:)<=c;
    newxy = newxy(:, filter_cond);
    
    % assign image on it
    blank = zeros(round(newsize + 0.5), 'uint8');
    blank(reshape(filter_cond, size(blank))) = base(sub2ind(size(base), newxy(1,:), newxy(2,:)));
end

% test reverse rotate
function testRotinv()
    th = 15;
    c = 50;
    r = 80;
    t = [cosd(th) sind(th); -sind(th) cosd(th)];
    newsize = [r c] * abs(t);
    newr = newsize(1);
    newc = newsize(2);
    [y, x] = meshgrid(-newc/2:newc/2, -newr/2:newr/2);
    newxy =  round([r; c] ./ 2 + 0.5 + ...
        t' * [reshape(x, 1, numel(x)); reshape(y, 1, numel(y))]);
    blank = zeros(round(newsize + 0.5));
    filter_cond = newxy(1,:)>=1 & newxy(2,:)>=1 & newxy(1,:)<=r & newxy(2,:)<=c;
    blank(reshape(filter_cond, size(blank))) = 255;
    imshow(blank);
end

% test rotate
function testRot()
    th = 45;
    c = 50;
    r = 80;
    t = [cosd(th) sind(th); -sind(th) cosd(th)];
    newsize = [r c] * abs(t);
    [y, x] = meshgrid(-c/2:c/2, -r/2:r/2);
    newxy =  round(reshape(newsize,2,1) ./ 2 + 0.5 + ...
        t' * [reshape(x, 1, numel(x)); reshape(y, 1, numel(y))]);
    blank = zeros(round(newsize + 0.5));
    blank(sub2ind(size(blank), newxy(1,:), newxy(2,:))) = 255;
    imshow(blank);
end