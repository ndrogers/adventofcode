s01a:{x 1-"( )"?y}                    / map indices to 1 or -1
s011:s01a[+/]                         / sum
s012:s01a {1+(+\x)?-1}                / find -1 in progressive some
                                      / DAY 2 ::
se:{+/x'y}                            / sum each
s021:se {(&/a)+2*+/a:*/+2':x,*x}      / min of prod +2× sum of 2 chunk prods
s022:se {(*/x)+/2*x@2#<x}             / prod + sum of 2 × the 2 smallest
s02p:.''"x"\'                         / coerce int
                                      / DAY 3 ::
s03a:{#?x(,/a,\:/:a:1,-1)"^<>v"?y}    / unique count of nodes 
s03g:{#?x(+1-2*!2 2)"^<>v"?y}         / ngn: "use odometer"
s031:s03a[+\]                         / sum scan
s032:s03a{,/+\+x@.=2!!#x}             / sum scan alternating nodes
                                      / DAY 4 ::
s04a:{f:{~x~(#x)#`k `md5 y,$z}[x;y]   / check the first #x charactars for match
 f(1+)/1}                             / repeat until f x
s041:{s04a["0x00000";x]}              / {x+~&/1 1 16>3#`md5"yzbqklnj",$x}/1 / ngn solution much faster 
s042:{s04a["0x000000";x]}             / try the ngn solution  
s051:{                                / day 5 ::
  vc:{2<+/~^"aeiou"?x}                / adequate number of vowels
  rp:{|/~':x}                         / repeat letters
  nc:{s:("ab";"cd";"pq";"xy")         / is nice if not on 
    ~|//~^s?/:,2':x}                  / naughty list
  +/&/'(vc;rp;nc)@\:/:x}              / all true? 
                                      / DAY 6 ::
s06p:{{{(*|x 1),.'x 2 4} -5#" "\x}'x} / process todays input
(s061;s062):{                         / enf ←→ toggle on off
  a:"enf"!(=;{y;1};:)                 / day 1 actions
  b:"enf"!(2++;1++;-1++)              / day 2 actions
  s:{0|.[y;{x+!1+y-x}'/1_z;x@*z;0]}   / 1 step 
  t:{+//(1000 1000#0)x/y}             / total
  {x y z}[t;s]@'(a;b)}0               / totals for each day 
