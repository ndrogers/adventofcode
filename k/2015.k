/ solution s     / day nn / part n / signifiers a p
/ general case a / parse text file p
/ helpers
se:{+/x'y}

/ solutions
s01a:{x 1-"( )"?y}                  / map indices to 1 or -1
s011:s01a[+/]                       / sum
s012:s01a {1+(+\x)?-1}              / find -1 in progressive some
s021:se {(&/a)+2*+/a:*/+2':x,*x}    / min of prod +2× sum of 2 chunk prods
s022:se {(*/x)++/2*x@2#<x}          / prod + sum of 2 × the 2 smallest
s02p:{{.'"x"\x}'x}                  / coerce int
s03a:{#?x(,/a,\:/:a:1,-1)"^<>v"?y}  / unique count of nodes 
s03g:{#?x(+1-2*!2 2)"^<>v"?y}       / ngn: "use odometer"
s031:s03a[+\]                       / sum scan
s032:s03a{,/+\+x@.=2!!#x}           / sum scan alternating nodes

/ tests: uncomment to run
prs:({*x};s02p;{*x})                / parsers
day:{(prs@x-1)@0: "../2015/",($x),".txt"}
fns: (s011;s012   / day 1
 s021;s022        / day 2
 s031;s032)       / day 3
inp: day'1 1 2 2 3 3
exp: 74 1795 1606483 3842356 2565 2639
exp~fns@'inp / tests match expected
/i01 : *day 1                       
/ s011 i01 / 74
/ s012 i01 / 1795
/i02 : s02p@day 2
/ s021 i02 / 1606483
/ s022 i02 / 3842356
/i03 : *day 3
/ s031 i03 / 2565
/ s032 i03 / 2639
