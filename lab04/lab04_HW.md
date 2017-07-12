# lab04_HW
1. Write a function that takes a matrix as its input. The entries of the matrix are non-negative
integers of type double. The function returns the variable type (e.g., uint8, uint16,
uint32, and uint64) of the unsigned integer class to which the matrix can be accurately
converted. For example, if the largest integer in the matrix is 14, the function returns uint8.
If no such class exists, the string 'NONE' is returned.
> This question is just let you know the range of int8 ... 
> see `typeMin.m`
> ``` matlab
> >> typeMin(double([2^3 2^8-1]))
> ans =
>     'uint8'
> >> typeMin(double([2^3 2^8]))
> ans =
>     'uint16'
> >> typeMin(double([2^3 -1]))
> ans =
>     'None'
> ```

2. Write a script that generates a cell array of dimensions 31-by-3. The rows of the array correspond to the days of October, 2015. The three elements of each row must be set as follows:
   * The first element refers to the string 'October' (uppercase 'O').
   * The second element refers to a scalar of type double that equals the date (1 through 31).
   * The third element refers to the three-letter abbreviation of the day chosen from this list:
`'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', and 'Sun'`.
The eleventh element of the cell array should be: 
`'October' [11] 'Sun'.`
> By reading doc. We find cat can combine cell array (also matrix)
> see `OctoberGenerate.m`
> ``` matlab
> >> OctoberGenerate
>     'October'    [ 1]    'Thu'
>     'October'    [ 2]    'Fri'
>     'October'    [ 3]    'Sat'
>     ...
>     ```
3. Write a function that takes a string representing an integer between 1 and 20 inclusive using Roman numerals and returns the Arabic equivalent as a number of type uint8. If the input is illegal or its value is larger than 20, the function returns 0 instead. Allow only three consecutive symbols can be the same in your function. For example, IIII or VIIII are illegal.
> Just logic for if and for
> see `toRoman.m`
> ``` matlab
> toRoman(19)
> ans =
>     'XIX'
>  ```

Test on ubuntu16.04 + Matlab R0217a academic use
