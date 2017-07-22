function rice_size()
    img = imread('09Rice.JPG');
    img = rgb2gray(img);
    bwimg = imbinarize(img);
    [label, num] = bwlabel(bwimg, 8);
    labelsum = [];
    for i = 1:num
        labelsum(end + 1) = sum(sum(label == i));
    end

    coin = max(labelsum);
    labelsum = labelsum(labelsum ~= coin & labelsum >= coin * 0.001);

    labelsum = labelsum ./ coin;
    disp('mean');
    disp(mean(labelsum));
    disp('std');
    disp(std(labelsum));
    disp('number');
    disp(length(labelsum));
    disp('all rice size in the ratio of coin');
    disp(labelsum);
end