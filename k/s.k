utils:{day:{f:prc@x-1          / proce func
  f@0: "../2015/",($x),".txt"} / read
  t:{(x 2)~(x 0)@'day'x 1}     / test
  c:((s011;1;74)               / cases
     (s012;1;1795)
     (s021;2;1606483)
     (s022;2;3842356)
     (s031;3;2565)
     (s032;3;2639)
     (s041;4;282749)    / takes too long
     (s042;4;9962624)   / takes too long
     (s051;5;258)
     (s061;6;543903)    / large data 
     (s062;6;14687245)) / large data
 `day`t`c!(day;t;c)}
