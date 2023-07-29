# Guess Which Hand
### About
"Guess Which Hand" is a simple guessing game played between two people where a person hides a small object, such as a coin or small toy, in one of their hands without revealing which hand it's in. The other person must then guess which hand holds the hidden object. If they guess correctly, they win, and if not, then the former player wins.

### Implementation
I started by creating an FSM to represent all possible states of the game. Then I defined the bit representations for each state and used K-maps to derive expressions for the outputs (Control logic) as well as for the next-state bits (Next-state logic). To further optimize these expressions, I converted them to a NAND-NAND circuit and finally implemented the following logic circuit which uses D flip flops (to hold the state bits) as well as NAND/NOR gates (for the combinational logic) onto a breadboard.

![image](https://github.com/ahmed23shaf/GuessWhichHand/assets/112600024/b8f1a44a-2057-4ee5-b540-022f0b9d9edb)
