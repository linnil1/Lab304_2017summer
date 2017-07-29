# lab11_HW
[TOC]

## Q1
Write a (not necessary but encouraged GUI) program to denoise the image `11Saturn.jpg`. The program should reduce the noise level of the image by using a Gaussian filter. The Guassian filter is a very popular filter for denoising. Check `fspecial('gaussian')` for more details. Apply the filter to the image for several times and examine if this helps improving the image quality. You may consider to sharpen the image by applying the Laplacian filter to the denoised image.

| (a) Noisy image | (b) Denoised image | ( c ) Sharpened image |
| -------- | -------- | -------- |
| ![](https://i.imgur.com/j36fXR9.png) | ![](https://i.imgur.com/HmCsGeV.png) | ![](https://i.imgur.com/lThvRqO.png) |
> 

## Q2
Successful image enhancement is typically not achieved using a single operation. Rather a range of techniques are combined in order to achieve a final result. This example will focus on enhancing an image of bone scan. Write a (GUI) program to analyze the image `11Xray.png`. Apply the following techniques:
* (a) Apply Laplacian filter to the original image
* (b) Subtract the image from (a) from the original image to obtain a sharpened image
* \(c\) Apply both the horizontal and vertical Sobel filter to the image from (b)
* (d) Smooth image from \(c\) using a $5x5$ averaging filter
* (e) Element-by-element multiply the images from (b) and (d)
* (f) Add the image from (e) to the original image to obtain a sharpened image
* (g) Apply power-law transformation (i.e., $g_0 = (g_i)^{0.5}$ ) to adjust the image contrast

Power-law transformation (a.k.a. gamma correction) is an approach to adjust the contrast of an image. In the transformation, the gray level of the pixels were adjust by the equation $g_0 = c(g_i)^r$ , where $g_0$ is the gray level of the output image, $g_i$ is the gray level of the input image, and $c$ and $r$ are pre-determined constants. The figure below explains the input-output relationship of power-law transformation. Note that in this example, we set $c = 1$.
![](https://i.imgur.com/AoCxFUG.png)
The images of each step are shown below.
![](https://i.imgur.com/GN7gKHY.png)
> 


---
star me on Github
[linnil1](https://github.com/linnil1/Lab304_2017summer)

---
Test on ubuntu16.04 + Matlab R2017a academic use