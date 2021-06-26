."\\l 15s.k"
."\\l test.k"         /testing
(day;t;c;e):.utils 0

ex:,/(74 1795      / required: must be even length
 1606483 3842356   / day 2
    2565 2639      / day 3
  282749 9962624   / day 4
     258 0         / day 5
  543903 14687245) / day 6
year:2015               / required: name of folder containing inputs
nys : {x+!25-x} (#ex)%2 / required: days not yet solved
skip: 4 6               / required: ,-1 if no skipping
prc :(*:;s02p;*:;*:;::  / required: processors
    s06p;  ::;::;::;::  / 1 file input processor per day
      ::;  ::;::;::;::
      ::;  ::;::;::;::
      ::;  ::;::;::;::) 
e c
