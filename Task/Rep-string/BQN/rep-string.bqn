# Returns a list of all rep-strings
Reps←(⌊≠÷2˙)((⊣≥≠¨∘⊢)/⊢)(<≡¨≠⥊¨1↓↑)/1↓↑

# Tests
tests←⟨
   "1001110011", "1110111011", "0010010010",
   "1010101010", "1111111111", "0100101101",
   "0100100", "101", "11", "00", "1"
⟩

∾´{ 𝕩∾':'∾(•Fmt Reps 𝕩)∾@+10 }¨tests
