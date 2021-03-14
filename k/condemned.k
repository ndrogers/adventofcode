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

/ ngn's solution using my defs from above
h:!/+`${(*|x;-2_x)}'" "\'0:"../2015/7.txt"
shift:{$[~x . y,0;z*/y#2;_z%*/y#2]} / dzaima wrote this one
h.LSHIFT:shift[<]                   / I made it work with <
h.RSHIFT:shift[>]                   / and > 
bitwise:{2/x/(16#2)\'y,z}           / I did the rest
h.AND:bitwise[&]
h.OR:bitwise[|]
h.NOT:-1-                           / now for ngn's code
{$[</"0:">*$x;.$x                   
   ~`S=@v:h x;v
   h[x]:@/(o'v)(!0;0;0 1;1 2 0)@#v]}`a

/This doesn't work.... 
/Don't ask me why, it should
(⍸):{&x~\:y}
i:{.[{|/`b`h`i`l=@.x};,x;0]}
eval:{[op;x;y] op,"[",x,(((~"NOT"~op)&(~0=#y))#";"),y,"]"}
f:{l:*pd v⍸ x;$[~`S=@v:g x
 v
 (i x)|~#x
 x
 g[x]: .((l 1);(o l 0); (o l 2))]}  

