
/ solution s     / day nn / part n / signifiers a p
/ general case a / parse text file p
/ helpers
se:{+/x'y}


/ solutions
s01a:{x 1-"( )"?y}                    / map indices to 1 or -1
s011:s01a[+/]                         / sum
s012:s01a {1+(+\x)?-1}                / find -1 in progressive some
s021:se {(&/a)+2*+/a:*/+2':x,*x}      / min of prod +2× sum of 2 chunk prods
s022:se {(*/x)+/2*x@2#<x}             / prod + sum of 2 × the 2 smallest
s02p:.''"x"\'                         / coerce int
s03a:{#?x(,/a,\:/:a:1,-1)"^<>v"?y}    / unique count of nodes 
s03g:{#?x(+1-2*!2 2)"^<>v"?y}         / ngn: "use odometer"
s031:s03a[+\]                         / sum scan
s032:s03a{,/+\+x@.=2!!#x}             / sum scan alternating nodes
s04a:{f:{~x~(#x)#`k `md5 y,$z}[x;y]   / check the first #x charactars for match
 f(1+)/1}                             / repeat until f x
s041:{s04a["0x00000";x]}              / {x+~&/1 1 16>3#`md5"yzbqklnj",$x}/1 / ngn solution much faster 
s042:{s04a["0x000000";x]}             / try the ngn solution  
vc  :{2<+/~^"aeiou"?x}                / adequate number of vowels
rp  :{|/~':x}                         / repeat letters
nc  :{s:("ab";"cd";"pq";"xy")         / is nice if not on 
 ~|//~^s?/:,2':x}                     / naughty list
s051:{+/&/'(vc;rp;nc)@\:/:x}          / all true? 

/ this domain maps "enf" to behaviors
/ e ←→ toggle, ←→ is on ←→ is off
s06p:{{{(*|x 1),.'x 2 4} -5#" "\x}'x} / process todays input
(s061;s062):{
  a:"enf"!(=;{y;1};:)                 / day 1 actions
  b:"enf"!(2++;1++;-1++)              / day 2 actions
  s:{0|.[y;{x+!1+y-x}'/1_z;x@*z;0]}   / 1 step 
  t:{+//(1000 1000#0)x/y}             / total
  {x y z}[t;s]@'(a;b)}0             / totals for each day }


."\\l t.k"         /testing
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
prc:(*:;s02p;*:;*:;::   / required: processors
   s06p;  ::;::;::;::   / 1 file input processor per day
     ::;  ::;::;::;::
     ::;  ::;::;::;::
     ::;  ::;::;::;::) 
e c



