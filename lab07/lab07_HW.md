# lab07_HW
1. Design a GUI program to plot a sine and a cosine functions with adjustable amplitudes and frequencies.
(1) The amplitudes are controlled by using two `Edit Text` objects
(2) The frequencies are controlled using two `Slider` objects
(3) The frequency of the sine function ranges from $2\pi$ to $10\pi$ , and the frequency of the cosine function ranges from $7\pi$ to $10\pi$
(4) The plot is updated whenever the user moves a `Slider` or enter a new amplitude in an `Edit Text`
(5) The plot displays a legend to show the line styles of the functions
(6) The superposition of the two functions can be display when a `Check Box` “Superposition” is checked Use the superposition function to display if the two functions cancel each other when their frequencies are identical. 
The GUI program should look like this:
![](https://i.imgur.com/tl4WLEC.png)
> see `lab07_1.m`
> see `lab07_1.fig`
> see `lab07_1.png`
![](https://i.imgur.com/Jv3uzKa.png)

2. Design a GUI program that plots the solution for a first-order ordinary differential equation:
$$ {dy \over dx} + my = n $$
where $m$ and $n$ are constants that are adjustable by the user in the GUI. The range of $x$ in the plot should be adjustable by the user too. You may need to ask the user to input the initial condition. You may consider to use the MATLAB function `dsolve` for solving the differential equation.
> see `lab07_2.m`
> see `lab07_2.fig`
> see `lab07_2.png`
> ![](https://i.imgur.com/fDjBNqp.png)


> I think that GUI is for idiot.
> I need to become idiot then I can coding quickly.

---
Test on ubuntu16.04 + Matlab R0217a academic use