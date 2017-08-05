function rice_contour()
    img = imread('12SingleRice.jpg');
    r = size(img, 1);
    c = size(img, 2);
    % smooth the image
    img_gau = imfilter(img, fspecial('gaussian', 5, 5));
    % use H to classify
    img_hsv = rgb2hsv(img_gau);
    img_h = img_hsv(:, :, 1);
    ind = kmeans(reshape(img_h, r * c, 1), 3);
    ind = reshape(ind, r ,c);
    % get center one
    tmp_img = ind(round(r / 3):round(r * 2 / 3), round(c / 3):round(c * 2 / 3));
    img_center_ind = mode(reshape(tmp_img, numel(tmp_img), 1)); 
    % ind = (ind - 1) ./ 2;
    % imshow(ind);

    % bw image analysis
    img_bw = ind == img_center_ind;
    % erode
    img_ero = imerode(img_bw, strel('disk', 5));
    img_ero = imerode(img_ero, strel('disk', 5));
    % only get biggest one
    img_lb = bwlabel(img_ero);
    img_max = img_lb == mode(img_lb(img_lb ~= 0));
    % dilate
    img_di = imdilate(img_max, strel('disk', 5));
    img_di = imdilate(img_di, strel('disk', 5));
    % get contour
    img_edge = bwmorph(img_di, 'remove');

    % output
    img_contour = img;
    [x, y] = find(img_edge); 
    imshow(img_contour);
    hold on;
    plot(y, x, 'ro');
    hold off;
end
