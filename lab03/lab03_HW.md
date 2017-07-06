# lab03_HW
Work at ubuntu16.04 + Matlab R0217a academic use
---
1. Write a function to evaluate the Poisson distribution
![](https://i.imgur.com/cTRlUbu.png)
where `k` and `λ` are parameters as the inputs to the function. The input `k` can be a vector. Observe the output of the Poisson distribution when λ is equal to `4` and `10` for `k = 0 ... 20`. When does the maxima occur?
> First write formula into script 
> see `poisson.m`
> ``` matlab
> % Second draw 3d plot
> >> [X,Y] = meshgrid(1:20,1:20);
> >> surf(X, Y, poisson(X, Y))
> >> set(gca,'Ydir','reverse')
> >> set(gca,'Xdir','reverse')
> ```
> ![](https://i.imgur.com/150U4hi.jpg)
> Third analysis from plotting
> It is a great plot
> and observe it, you will find when n == k will be max
> ``` matlab
> >> [value index] = max(poisson(0:20, 10))
> value =
>     0.1251
> index =
>     10
> >> [value index] = max(poisson(0:20, 4))
> value =
>     0.1954
> index =
>      4
> ```
> same as the conclusion we make upon.
2. Write a function to calculate the hypotenuse of a right-angled triangle, for given the other two sides of the triangle. The input argument is a matrix of two columns [a b], each of which is a side of the triangle. The function should return a column vector that contains positive values each of which satisfies the Pythagorean Theorem, c_i = sqrt(a_i^2 + b_i^2) , for the corresponding ith row of [a b]. The function needs to check if the input matrix has exactly two columns. If it does not, the function returns warning messages.
> Nothing special
> see `rightangle.m`
> ``` matlab
> >> rightangle([3 4;5 12])
> ans =
>      5
>     13
> >> rightangle([3 4 5])
> Error using rightangle (line 3)
> Only two columns are accepted. You give 3
> ```

3. Write a function that takes a row vector as input and creates another row vector as output. The output vector contains the absolute values of the differences between neighboring elements of the input vector. For example, if the input vector is [1 2 4 7], the output of the function would be [1 2 3]. Notice that the length of the output vector is one less than that of the input. Check that the input vector is indeed a vector (not a matrix) and has at least two elements. If not, the function returns a warning message instead.

> Nothing special
> see `absdiff.m`
> ``` matlab
> >> absdiff([1 9 3 7 5])
> ans =
>      8     6     4     2
> >> absdiff([2 0; 1 7])
> Error using absdiff (line 3)
> This is not a vector
> >> absdiff([3])
> Error using absdiff (line 6)
> at least two elements
> ```

4. Write a function that takes inputs (v,a,b,c), where v is a vector, and a,b, and c are all scalars. The function replaces every element of v that is equal to a with two entries [b c]. For example, the command `x = replace_me([1 2 3],2,4,5);` makes x equal to [1 4 5 3]. If c is omitted, it replaces occurrences of a with two copies of b, (i.e., [b b]). If b is also omitted, it replaces each a with two zeros, (i.e., [0 0]).

> see `replace_me.m`
> This need for loop to achieve it
> ``` matlab
> >> replace_me([1 2 3], 2, 4, 5)
> ans =
>      1     4     5     3
> 
> >> replace_me([1 2 3], 2, 4)
> ans =
>      1     4     4     3
> 
> >> replace_me([1 2 3], 2)
> ans =
>      1     0     0     3
> ```

5. Write a function to calculate the Pascal matrix shown below. The input should be the row number, and the output should be a vector that contains the entries of the row.

> Easy
> Just use `nchoosek(n,k)` to calculate permutation
> see `pascalrow.m`
> Usage
>
> ``` matlab
> >> pascalrow(4)
> ans =
>      1     4     6     4     1
> ```