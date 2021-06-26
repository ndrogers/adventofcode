## Implementation
This project uses [ngn-k](https://codeberg.org/ngn/k/). Please follow the installation instructions found at the link provided to get `ngn-k` up and running. 

## Documentation guide
Most documentation can be found as inline comments in the code, following [John Scholes](https://en.wikipedia.org/wiki/John_M._Scholes) example from his [DFNS](http://dfns.dyalog.com/) library. These comments are meant to be read either as single inline comments, or as entire blocks or paragraphs explaning a particular section of code. One addition that has been made is of the following form:

```
/ found in 15t.k

 nys : {x+!25-x} (#ex)%2 / required: days [n]ot [y]et [s]olved
```

Brackets will be used to denote the complete word when single character or abbreviated name is introduced. In this example, the variable `nys` is commented with `[n]ot [y]et [s]olved` to denote the meaning of the abbreviation for future readers. 

## Structure
- Files named `{year}s.k` contain solutions for the year in question. To load, start a k interpreter in this directory, and use `\l 15s.k` replacing `15` with the year to import the solutions. 
- Files name `{year}t.k` contain test cases to validate the known solutions for solutions. Use `\l 15t.k` to execute the tests. A result of `1` will be printed if all test cases succeed, and `0` for a failure. 
- `apl.k` contains some nice APL style helpers which may or may not be used throughout the `{year}s.k` files. 
- `test.k` defines a series of utilities which, provided a particular naming convention, will execute tests agnostic of year, or existence of solutions for that year. 
  - Solution functions are to be named `s{2 digit day}{1 digit part number}`. I.E. `s011` for `solution for day 1, part 1`, or `s252` for `solution for day 25 part 2`. 
  - the `[c]ases` list returned from `utils` in `test.k` defines all combinations of function names, with their input file, whch prevents the need for explictly calling each years tests with each input in ever `{year}t.k` file. For instance, in  `15t.k`, only a select number of solutions are complete, and days `4` and `6` take too long to execute. Defining the necessary names, the `[e]xecute` function is given the complete list of `[c]ases` to run, with all these rules predefined. 
