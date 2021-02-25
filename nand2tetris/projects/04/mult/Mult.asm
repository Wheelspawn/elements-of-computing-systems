// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

  @0
  D=A
  @2
  M=D    // set mem[2] (R0+R1) to 0

  @1
  D=M
  @3
  M=D    // set mem[3] (decrement by R1) to 0

(LOOP)  
  @3
  D=M
  @RESET
  D;JEQ  // if D==0 GOTO RESET
  
  @3
  M=M-1  // decrement -= 1

  @0
  D=M
  @2
  M=M+D  // R2 += R0
    
  @LOOP
  0;JMP  // GOTO LOOP

(RESET)
  @0
  D=A
  @3
  M=D    // set mem[3] to 0

(END)
  @END
  0;JMP
