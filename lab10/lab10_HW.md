# lab10_HW
1. Improve the GUI program you designed in Lab 9 by adding `“filter”` and `“opening”` functions. In `“09rice.png”`, there exist `“sparkles”` (small dots that are actually not grains) in the image that are falsely recognized as grains. See the number of very small grains in the histogram. Include a button in your GUI program with which the users are able to remove the sparkles. You may also let the users determine the sizes of sparkles to be removed. In addition, there exist connected grains in the image `“09rice.png”`. The connected grains are recognized as one grain by the connected labeling algorithm. See the number of very large grains in the histogram. Implement the morphological opening to separate connected grains.

2. Implement a serious of image processing algorithms to improve the quality of `“10Fingerprint.tif”`. If interested in, you may further move to perform eature extraction on fingerprints. Typical features for fingerprints include ridge ending, ifurcation, and short ridge. To extract these features, you will need to use thinning, a morphological algorithm that identifies the skeletons of foreground objects. Check MATLAB function `bwmorph`.
![](https://i.imgur.com/dsyVR63.png)

---
star me on Github
[linnil1](https://github.com/linnil1/Lab304_2017summer)

---
Test on ubuntu16.04 + Matlab R0217a academic use