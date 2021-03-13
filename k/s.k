\l 15t.k
/ temps
s:,"a"
d: day 7
p:{-5#("";"")," "\x}
pd: p'd
(x;g;y;v):(+pd)0 1 2 4

/ domain
b16   :(16#2)\
shift:{$[~x .y,0; z*/y#2;z%*/y#2]}
LSHIFT:shift[<]
RSHIFT:shift[>]
AND   :{2/&/b16'x,y}
OR    :{2/|/b16'x,y}
NOT   :{2/b16 x}

/ solution
(⍸):{&x~\:y}
i:{.[{|/`b`h`i`l=@.x};,x;0]}
eval:{[op;x;y] op,"[",x,(((~"NOT"~op)&(~0=#y))#";"),y,"]"}
f:{$[(i y)|(~#y)
 y
 (i n:l 2)&#l: *pd v⍸ y
 n
 #l                          
 (x=1)_(-x=1)_eval[l 1;o[0] n;o[0] l 0]
 y]}[1]
