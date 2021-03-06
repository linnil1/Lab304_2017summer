# lab06_HW
1. Geometric distribution is the discrete probability distributions number X of Bernoulli trials needed to get one success. If the probability of success on each trial is pp, then the probability that the kth trial (out of k trials) is the first success is $$ Pr(X = k) = (1 − p)^{k−1} p \;\;\; for \;  k = 1, 2, 3, ... $$ Write a function to plot the probability density unction (`geopdf`) and cumulative distribution function (`geocdf`) of the geometric distribution in one  figure. The input to the function should include pp and kk. Please title and label the output figure appropriately. Use the function to plot the geometric distribution for pp = 0.25 and kk = 25. Your figure should look like this.
![](https://i.imgur.com/gJv8BGv.png)
> red line using plot
> blue using bar
> calcuate prefix sum `cumsum`
> see `lab06_1.m`
> see `lab06_1.jpg`
> ![](https://i.imgur.com/ruqfnKZ.png)

2. Write a script to plot the sign below.
![](https://i.imgur.com/uvrlPNH.png)
> see `lab06_2.m`
> see `lab06_2.jpg`
> easy. use `fill`
> ![](https://i.imgur.com/XqKxP7t.png)

3. Load the dataset “06Gas.mat”. It contains gasoline prices in USA of each month from 1976 to 2004 (29 years). Prepare a figure that contains 3 subplots: 
* ( a ) mean annual gas price, 
* ( b ) monthly gas price in 1990, 1995, and 2000, and 
* ( c ) monthly price distribution over the 29 years. 
The figure size is 1000 by 700. The font size is 14 for the plot titles, and is 12 for the rests. The line width for subplot 2 is 2. The legend position for subplot 2 is at top left corner. The bin number in subplot 3 is 20. Use fractions in the histogram y-axis and tightly distribute the bins. The result should look like the figure below.
![](https://i.imgur.com/hiOpSOo.png)
> ( a ) errorbox
> ( b ) plot
> ( c ) histogram with ('Normalization', 'probability')
> see `lab06_3.m`
> see `lab06_3.jpg`
> ![](https://i.imgur.com/yzA9Awy.png)


4. Plot the function $$ f = sin(\sqrt{x^2 + y^2}) / \sqrt{x^2 + y^2}$$ in a 3D graph following these steps:
a) Develop a grid between -8 and 8 in both xx and yy by using meshgrid.
b) Calculate the value of ff over the grid and plot it.
c) Adjust lighting, view angle, and colormap to emphasize the shape of the graph.
The result should look like the figure below.
![](https://i.imgur.com/WM9gPj7.png)
> The easy one
> 
> ``` matlab
> >> % a)use meshgird
> >> [x, y] = meshgrid(linspace(-8, 8), linspace(-8, 8));
> >> % b)caculate function
> >> z = sin(sqrt(x .^ 2 + y .^ 2)) ./ sqrt(x .^ 2 + y .^ 2);
> >> % b)plot
> >> surf(x, y, z, 'EdgeColor', 'none');
> >> % c)colormap
> >> colormap(hsv);
> >> % c)viewangle
> >> view(45, 50);
> >> % c)light
> >> light('Position',[8 8 1]);
> ```
> see `lab06_4.m`
> see `lab06_4.jpg`
> ![](https://i.imgur.com/NkqrOUS.png)


5. Load the dataset in “06Scatter.xslx”. The dataset contains the PC1, PC2, and genotype of some specimen. The genotype 0, 1, and 2 denote the type ‘c/c’, ‘C/c’, and ‘C/C’, respectively. Prepare a figure composed of 3 subplots: 
( a ) PC1-PC2 scatter plot, 
( b ) PC1 histogram, and 
( c ) PC2 histogram. 
The bin number in the histogram is 10. Use different colors to distinguish different genotypes. Provide the legend at the bottom-left corner. The result should look like the figure below.
![](https://i.imgur.com/QosYi4P.png)
> Although question require histogram, 
> I think it should be draw by bar plot
> Because the plot size cannot be responsible, 
> we need to write specific position and size for every plots
> see `lab06_5.m`
> see `lab06_5.jpg`
> ![](https://i.imgur.com/55uo86E.png)

---
Test on ubuntu16.04 + Matlab R0217a academic use