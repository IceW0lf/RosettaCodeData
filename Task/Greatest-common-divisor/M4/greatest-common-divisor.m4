divert(-1)
define(`gcd',
  `ifelse(eval(`0 <= (' $1 `)'),`0',`gcd(eval(`-(' $1 `)'),eval(`(' $2 `)'))',
          eval(`0 <= (' $2 `)'),`0',`gcd(eval(`(' $1 `)'),eval(`-(' $2 `)'))',
          eval(`(' $1 `) == 0'),`0',`gcd(eval(`(' $2 `) % (' $1 `)'),eval(`(' $1 `)'))',
          eval(`(' $2 `)'))')
divert`'dnl
dnl
gcd(0, 0) = 0
gcd(24140, 40902) = 34
gcd(-24140, -40902) = 34
gcd(-40902, 24140) = 34
gcd(40902, -24140) = 34