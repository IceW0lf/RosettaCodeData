find5=:3 :0
  y=. 250
  n=. i.y
  p=. n^5
  a=. (#~ 0&<),-/~p
  s=. /:~a
  l=. (i.*:y)(#~ 0&<),-/~p
  c=. 3 comb <.5%:(y^5)%4
  t=. +/"1 c{p
  x=. (t e. s)#t
  |.,&<&~./|:(y,y)#:l#~a e. x
)
