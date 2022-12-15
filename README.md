# Connect Four

### **Abstract**
---
In this game, the user plays a game of connect four against the computer.
The use is assigned the game piece "X".
The goal of the game is to connect 4 pieces vertically, horizontally, or diagonally.
The game allows the user to:
-choose whether or not they would like to play the game
-exit at any time
-play again

### **Setup Instructions**
---
**Ruby Gem -- Connect_Four_2211**

To install our ruby gem:

`gem install connect_four_2211`

Once installed, run anywhere in terminal:

`connect_four_2211`

### **Video Walkthrough**
---
[Connect 4 Walkthrough](https://drive.google.com/file/d/17K0ZKvXRKsJv0aiKSYVovyj5Xfcli2wb/view?usp=share_link)

### **Collaborators**
---
- Axel De La Guardia
- Jasmine Hamou

### **Wins & Challenges**
---
Figuring out how to iterate through the hash to figure out the diagonals took a lot of time to figure out. We attempted a few times before settling with what we have now. It took a few refactors to get to where it's now and althought there could be better ways, it works and considered a WIN! Additionally, attempting the intelligent computer was no small feat. While it was challenging to think through and could use some upgrades (see future iterations), planning it, writing it, refactoring it, and then playing it was a definite win.

Ruby Gem had it's own challenges, understanding how and what's needed to have a gem working, as well as, using the gem outside of IRB/Pry. As previously stated, planning and executing the intelligent computer was challenging. While we attempted to write DRY code, we fully acknowledge that the code would benefit from refactoring.

### **Future Iterations**
---
1. Having an exit message displayed when trying to exit during a column_full check.
1. Computer winning or blocking when the last piece is not an edge piece.
1. Computer identifying if the position underneath the block/win is open and acting accordingly.
1. Ending game as soon as player is winner and not allowing computer another turn.