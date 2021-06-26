."\\l 15t.k"
."\\l apl.k"
d:day 9
c:{(,x),,y}


td:("london to dublin = 464"
 "london to belfast = 518"
 "dublin to belfast = 141")

t:+(l1;l2;di):{0 2 4⊃+" "\'x}td       / loc1 loc2 dist
c:#u:{?,/0 1⊃x}(l1;l2;di)           / unique locs
i:{(+x)@&{(#x)~#∪x}'+x}@!c#c            / indices
(⍱):{x[y;z]}

2''u i

x:{}
1+1

(⍨):{x~x^'y}x[b:&~^x]}il]}}