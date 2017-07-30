function imgs = enhancement_techniques()
    img = imread('11Xray.png');
    img_a = imfilter(img, fspecial('laplacian'));
    img_b = img - img_a;
    img_c = img_b + imfilter(img_b, fspecial('sobel')) + imfilter(img_b, fspecial('sobel')');
    img_d = imfilter(img_c, fspecial('average', 5));
    img_e = uint8(double(img_b) .* double(img_d) / 255);
    img_f = uint8((double(img) + double(img_e)) / 2);

    c = 1;
    g = 0.5;
    img_g = uint8((c .* (double(img_f) / 255) .^ g) .* 255);
    imgs = cat(3, img, img_a, img_b, img_c, img_d, img_e, img_f, img_g);
end