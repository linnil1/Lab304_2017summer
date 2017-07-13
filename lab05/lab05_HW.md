# lab05_HW
1. Write a script to plot the figure below. The sales from January to June are 13, 5, 7, 14, 10, and 12. Set line width to 2 and marker size to 10. Set font size to 16 for the title, and to 14 for the rests.
![](https://i.imgur.com/OTn5WrF.png)
> just read documents and write
> see `salePlot.m`
> see `saleplot.jpg`
> ![](https://i.imgur.com/oR6RNC1.png)

2. Write a script to plot an in-phase and a quadrature sinusoidal signals. The two signals have a frequency of 5MHz and a phase difference of π/2. Set the title font size to 14. Use Courier New for x-label. Bold the x-label. Italicize specific words in the title and y-label. The result should look like the figure below.
![](https://i.imgur.com/ETDN336.png)
> be care for that matlab has bug when linewidth < 1
> see `sinphasePlot.m`
> see `sinphaseplot.jpg`
> ![](https://i.imgur.com/GRmfDoI.png)


3. A Taylor series is a representation of a function as an infinite sum of terms. Approximate sine function using a Taylor series of degree 13. Plot the outcome with the sine function and put annotation. The final figure should look like this:
![](https://i.imgur.com/NAdvkTd.png)
> The key : `taylor(sin(x),'Order', 14);`
> largest is `x^13`
> Can grid color became black?
> annotation `HorizontalAlignment= 'left'` someime fail
> see `taylorSin.m`
> see `taylorsin.jpg` 
> ![](https://i.imgur.com/bTA2cAX.png)

4. Write a script to plot the equation y = sin(x) + sin(3x) for x of 0 to 4π. Set line width to 3. Set the ticks on y-axis at -1, -0.3, 0.1, and 1. Label the ticks with the text shown in the figure below. Color the figure accordingly.
![](https://i.imgur.com/SkPRivl.png)
> the grid is not very significent
> see `sin1_sin3.m`
> see `sin1_sin3.jpg`
> ![](https://i.imgur.com/D6Gmq2a.png)

5. Write a function that plots a circle. The inputs of the function should include center, radius, color, and thickness of the circle to be plotted. Write a script that uses the function to plot 5 circles. The circles should be centered at the origin with varying radii. Set the line width for each circle to some thickness, and use the colors 'r', 'g', 'b', 'c', and 'm'. The result should look like the figure below.
![](https://i.imgur.com/kRSsKPe.png)
> key techique
>  `rectangle('Position', [-r+cent(1) -r+cent(2) 2*r 2*r], 'Curvature', [1 1], ...`
> see `circleDraw.m`
> see `circledraw.jpg`
> ``` matlab
> >> %           center   radius  color   thick
> >> circleDraw([0 1;3 4],[2;5],{'r';'g'},[5;1]);
> ```
> ![](https://i.imgur.com/p8e7e3f.png)
> this example show that my function can do so 
> if you give right inputs.



---
Test on ubuntu16.04 + Matlab R0217a academic use
