# NEON STACK — Card migration notes for V5 alpha

The old V4 card set was designed around:
- Program combat
- Noyau damage
- Energy tempo
- attack / block decisions

V5 alpha should instead rewrite cards into four families:
- Function
- Command
- Interrupt
- Hardware

## Migration principles
1. Remove direct combat stats when they are no longer necessary.
2. Convert old Program cards into Functions whenever possible.
3. Convert Energy effects into Memory effects.
4. Make recursive depth matter through termination rewards using Fibonacci.
5. Add cleanup / repair tools because broken functions persist in memory.

## Good transformation patterns
- "When this attacks, create a branch" -> "When this Function is launched / advanced..."
- "+1 power on each return" -> "improve termination effect" or "reduce future memory cost"
- "deal 1 damage" -> pressure the opponent's memory, stack, cleanup windows, or score tempo
- defensive artifacts -> Hardware that stabilizes memory or prevents corruption

## New card subthemes to introduce
- RAM expansion (permanent total memory increase)
- cache burst (temporary free memory)
- garbage collector (clean broken functions)
- hotfix / debugger (repair a broken function)
- profiler / optimizer (reduce recursion cost)
- stack sabotage (add bad frames / force overflow risk)

## Important balance note
Because the score bonus is Fibonacci-based, cards that let a player
jump directly from low depth to high depth should be rare and expensive.
