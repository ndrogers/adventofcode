/ solution s     / day nn / part n / signifiers a p
/ general case a / parse text file p
/ helpers
se:{+/x'y}

."\\l apl.k"

/ solutions
s01a:{x 1-"( )"?y}                  / map indices to 1 or -1
s011:s01a[+/]                       / sum
s012:s01a {1+(+\x)?-1}              / find -1 in progressive some
s021:se {(⌊/a)+2*+/a:*/+2':x,⊃x}    / min of prod +2× sum of 2 chunk prods
s022:se {(*/x)+/2*x@2↑<x}           / prod + sum of 2 × the 2 smallest
s02p:.''"x"\'                       / coerce int
s03a:{≢∪x(,/a,\:/:a:1,-1)"^<>v"?y}  / unique count of nodes 
s03g:{≢∪x(+1-2*!2 2)"^<>v"?y}       / ngn: "use odometer"
s031:s03a[+\]                       / sum scan
s032:s03a{,/+\+x@.=2!⍳≢x}           / sum scan alternating nodes

prc:(*:;s02p;*:)                / processors
day:{f:prc@x-1                / proce func
 f@0: "../2015/",($x),".txt"} / read
t:{(x 2)~(x 0)@'day'x 1}      / test
c:((s011;1;74)                / cases
   (s012;1;1795)
   (s021;2;1606483)
   (s022;2;3842356)
   (s031;3;2565)
   (s032;3;2639))
t@⍉c
