function noise_filter()
    img = imread('11Saturn.jpg');

    subplot(1, 3, 1);
    imshow(img);
    title('(a) Noisy image');

    subplot(1, 3, 2);
    denoised_img = imfilter(img, fspecial('gaussian', 10, 10), 'replicate');
    imshow(denoised_img);
    title('(b) Denoised image');

    subplot(1, 3, 3);
    sharpened_img = denoised_img - imfilter(denoised_img, fspecial('laplacian', 0));
    imshow(sharpened_img);
    title('(c) Sharpened image');
end
