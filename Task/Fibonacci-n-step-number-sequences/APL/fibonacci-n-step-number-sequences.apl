nStep ← {⊃(1↓⊢,+/)⍣(⍺-1)⊢⍵}
nacci ← 2*0⌈¯2+⍳
↑((⍳10)nStep¨⊂)¨(nacci¨2 3 4),⊂2 1