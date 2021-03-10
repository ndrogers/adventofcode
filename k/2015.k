se:{+/x'y}
day:{$x y}

/ solution s     / day nn / part n / signifiers a p
/ general case a / parse text file p

s01a:{x 1-"( )"?y}                   / map indices to 1 or -1
s011:s01a[+/]                        / sum
s012:s01a {1+(+\x)?-1}               / find -1 in progressive some
i01: *0: "../2015/1.txt"             / input string
                                     / s011 i01 / 74
                                     / s012 i01 / 1795
s021:se {(&/a)+2*+/a:*/+2':x,*x}     / min of prod +2× sum of 2 chunk prods
s022:se {(*/x)++/2*x@2#<x}           / prod + sum of 2 × the 2 smallest
s02p:{{.'"x"\x}'x}                   / coerce int
i02: s02p@0: "../2015/2.txt"         / input lines
                                     / s021 i02 / 1606483
                                     / s022 i02 / 3842356
s03a:{#?x(,/a,\:/:a:1,-1)"^<>v"?y}   / unique count of nodes 
s031:s03a[+\]                        / sum scan
s032:s03a{,/+\+x@.=2!!#x}            / sum scan alternating nodes
i03: *0: "../2015/3.txt"             / input string
                                     / s031 i03 / 2565
                                     / s032 i03 / 2639

