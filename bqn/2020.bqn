# 2020 day 2 solution
Split ←((⊢-˜+`×¬)∘=⊔⊢)
inp1←    •BQN¨•file.Lines "../2020/1.txt"
inp2←' 'Split¨•file.Lines "../2020/2.txt"
inp3←        >•file.Lines "../2020/3.txt"
ans1←0‿0
ans2←600‿245
ans3←234‿5813773056

Day1←{
  S←{×´𝕩 ⊏˜ 𝕨↑⍒2020=𝕩+⌜⍟(𝕨-1) 𝕩} # [S]olution for the specific puzzle parameters
  P1←2⊸S                         # Sum the table of 𝕩, repeated 𝕨-1 times
  P2←3⊸S                         # Selecting 𝕨 indices of 𝕩 
  𝕨◶P1‿P2 𝕩                      # and taking the product
}
•Show 1 Day1 inp1

Day2←{
  f←𝕨⊑{(⊑𝕩)+↕1+|-´𝕩}‿{𝕩-1}  # Select the [I]ndex generator [F]unction
  I←{F •BQN¨  '-' Split ⊑𝕩} # [I]ndices used to determine if the
  C←{⊑1⊑𝕩}                  # [C]haracter appears in the
  P←{⊑⌽𝕩}                   # [P]assword either
  P1←(I∊˜·+´C=  P)¨         # a given number of times
  P2←(1= ·+´C=I⊏P)¨         # or at one of a pair of indices
  ⊑+´𝕨◶P1‿P2 𝕩
}
                                                        
Day3←{
  r←≠⊏𝕩                        # [r]ow length in table 𝕩
  Trees←{                      # Count of [Trees] found at [I]ndices
    C←⌊÷⟜⊑˜                    # [C]ount of steps before reaching the bottom
    I←{(<𝕩‿r)|(<𝕨)×¨(𝕨C𝕩)↑↕ 𝕩} # [I]ndices, clamped to the length of each row
    +´'#'=(𝕨I≠𝕩)⊑¨<𝕩           # sum the count of # found at [I]ndices of 𝕩
  }
  P1←{1‿3 Trees 𝕩}
  P2←{×´⟨1‿1,1‿3,1‿5,1‿7,2‿1⟩Trees¨<𝕩 }
  𝕨◶P1‿P2 𝕩
}


