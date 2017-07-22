function [img, allrice, area] = rice_cleaner(path)
    % image processing
    img = imread(path);
    bgimg = imopen(img, strel('disk', 15));
    nobgimg = imsubtract(img, bgimg);
    bwimg = imbinarize(nobgimg);
    se = strel('disk', 2);
    erodeimg = imerode(bwimg, se);
    [labelimg, num]= bwlabel(erodeimg, 8);
    % reg = regionprops(labelimg);

    % calculate each rice
    allrice = zeros(size(img, 1), size(img, 2), num, 'logical');
    area = [];
    for i = 1:num
        tmp  = zeros(size(img));
        tmp(labelimg == i) = true;
        ditmp = imdilate(tmp, se);
        allrice(:, :, i) = ditmp;
        area(end + 1) = sum(sum(ditmp));
    end
    % riceSelect(img, allrice);
end

function riceSelect(img, allrice)
    colorimg = repmat(img, 1, 1, 3); % gray to rgb
    imshow(img);
    xy = round(ginput(1));
    disp(xy);
    if xy
        labelxy = allrice(xy(2), xy(1), :);
        ind = find(labelxy, 1);
        [x, y] = find(allrice(:,:,ind));
        colorind = sub2ind(size(colorimg), x, y, ones(length(x), 1));
        colorimg(colorind) = 255;
        colorimg(colorind + numel(img)) = 0;
        colorimg(colorind + numel(img) * 2) = 0;
        imshow(colorimg);
    end
end
