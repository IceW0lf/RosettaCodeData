   NB. A is the sequence
   A=: 10 de_bruijn 4

   NB. tally A
   #A
10000

   NB. literally the first and final 130 digits
   Num_j_ {~ 130 ({. ,: ({.~ -)~) A
0000101001101111000210020102110202001210120112111202121200221022012211220222122220003100320030103110321030203120322030300131013201
9469956996699769986990799179927993799479957996799779987990899189928993899489958996899789988990999199929993999499959996999799989999

   NB. verifications.  seriously?
   4 verify_PINs A
1
   4 (verify_PINs |.) A
1
   4 verify_PINs (a.i.'.') (<: 4444)} A
0