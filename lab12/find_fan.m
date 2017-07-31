function find_fan()
    img = imread('12YellowFan.png');
    % hsv filter
    img_hsv = rgb2hsv(img);
    img_h = img_hsv(:,:,1);
    img_s = img_hsv(:,:,2);
    img_v = img_hsv(:,:,3);
    img_cond = 30/256 < img_h & img_h < 45/256 & img_s > 0.5 & img_v > 0.6;
    
    % bw analysis
    img_big = bwareaopen(img_cond, 100, 4);
    img_close = imclose(img_big, strel('disk', 5));
    imshow(img_close);
    % combine together
%     s = size(img_close);
%     img_comb = imlincomb(0.5, uint8(cat(3,img_cond,zeros(s),zeros(s))) .* 255, 0.5, img);
%     imshow(img_comb);
end
