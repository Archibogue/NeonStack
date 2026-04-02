# NEON STACK — Suggested V5 alpha print counts per player

These counts are tuned for the V5 alpha rules:
- 3 active functions max
- 2 hardware active max
- overflow on 8th frame
- visible safe recursive depth 0..6

## Per player
- 6 branch bases
- 7 numbered frame "0"
- 6 numbered frame "1"
- 5 numbered frame "2"
- 4 numbered frame "3"
- 3 numbered frame "4"
- 2 numbered frame "5"
- 2 numbered frame "6"
- 4 ghost 0 frames
- 4 infinite frames
- 5 bug frames
- 3 overflow rings

## Why depth 6 matters
With overflow on the 8th frame, a normal stack can safely show:
[6][5][4][3][2][1][0]

That gives a practical maximum tracked recursion reward of F(6)=8
before special effects push a function into real danger.
