// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

  @KBD     // keyboard code location
  D=M

  @BLACKEN
  D;JEQ

  @CLEAR
  0;JMP

  @LOOP
  0;JMP    // GOTO LOOP

(CLEAR)

  @16384
  D=A     // D = 16384
  @i
  M=D     // Mem[i] = 16384
  @CLEARLOOP
  0;JMP

(CLEARLOOP)
  @i
  D=M     // D=Mem[i]

  @END    // 24576
  D=A-D   // count from 16384 to 24576

  @LOOP
  D;JEQ   // if D-A==0 GOTO LOOP else ...

  @i
  M=M+1   // Mem[i] += 1

  @CLEARLOOP
  0;JMP   // GOTO CLEARLOOP
  
(BLACKEN)

  @16384
  D=A     // D = 16384
  @i
  M=D     // Mem[i] = 16384
  @BLACKENLOOP
  0;JMP

(BLACKENLOOP)
  @i
  D=M     // D=Mem[i]

  @END    // 24576
  D=A-D   // count from 16384 to 24576

  @LOOP
  D;JEQ   // if D-A==0 GOTO LOOP else ...

  @i
  M=M+1   // Mem[i] += 1

  @BLACKENLOOP
  0;JMP   // GOTO BLACKENLOOP
