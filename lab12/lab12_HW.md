# lab12_HW
[TOC]

## Q1
Write a `MATLAB` script to identify the contour of the rice grain in image `12SingleRice.jpg`. The program should be able to exclude the brush from the contour. Draw the contour on top of the rice grain in the image.
![](https://i.imgur.com/tGIOTTN.png)
> ## To black-white image
> this is colored image
> It should be classify by color then become black-white image
> First, use `gaussian` filter to remove small point
> second use `kmean`(a grouping function) to classify `hsv` color.
> There are about three colors ( black, gray and yellow)
> ``` matlab
> img = imread('12SingleRice.jpg');
> r = size(img, 1);
> c = size(img, 2);
> img_gau = imfilter(img, fspecial('gaussian', 5, 5));
> img_hsv = rgb2hsv(img_gau);
> ind = kmeans(reshape(img_hsv(:,:,1), r * c, 1), 3);
> ```
> ![](https://i.imgur.com/AVWjK90.png)
> well, it is great enough to become black-white image
> ## black-white image analysis
> use erosion to remove brush
> and remove small component(keep biggest one)
> ![](https://i.imgur.com/uNaBjnB.png)
> dilate back and get the contour
> use `bwmorph` `remove`
> and draw on it
> ``` matlab
> img_bw = ind == img_center_ind;
> img_ero = imerode(img_bw, strel('disk', 5));
> img_ero = imerode(img_ero, strel('disk', 5));
> img_lb = bwlabel(img_ero);
> img_max = img_lb == mode(img_lb(img_lb ~= 0));
> img_di = imdilate(img_max, strel('disk', 5));
> img_di = imdilate(img_di, strel('disk', 5));
> img_edge = bwmorph(img_di, 'remove');
> ```
> ![](https://i.imgur.com/nAsg2QS.png)
> Good
> ## Conclusion
> see `rice_contour.jpg`
> see `rice_contour.m`
> `kmean` will change its value due to there does not exist perfect solution, so the result will change everytime,
> I make it as stable as possible.

## Q2
2. Calculate the area size of the yellow fan in image `12YellowFan.png`. Demonstrate the yellow fan area in a black and white image, where black pixels represent background and white pixels represent the fan area. Describe your image processing procedure and approach. How good do you think your results are?
![](https://i.imgur.com/rBG08Uv.png)
> our target is colorful and the backgronud is simple
> I think it is very easy
> ## hsv filter
> turn rgb to hsv
> and this yellow color is 
> * H(hue) value betwen 30 ~ 45(yellow)
> * S(saturation) value bigger than 0.5(really yellow)
> * V(value) > 0.6 (not black)
> 
> ![](https://i.imgur.com/kIUg081.png)
> than we find out answer very closing to what question want
> to closing to make image perfect
> ``` matlab
> img_cond = 33/256 < img_h & img_h < 45/256 & img_s > 0.7;
> img_big = bwareaopen(img_cond, 50, 4);
> img_close = imclose(img_big, strel('disk', 5));
> ```
> see `find_fan.m`
> see `find_fan.jpg`
> ![](https://i.imgur.com/tqiibfg.png)
> combind together (yellow + red = orange)
> ![](https://i.imgur.com/Mf7AX0d.png)
> looks perfect

# Thank you for reading
This is the last chapter of matlab in summercourse of NTU BIME Lab304.


---
star me on Github
[linnil1](https://github.com/linnil1/Lab304_2017summer)

---
Test on ubuntu16.04 + Matlab R2017a academic use