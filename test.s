.global _start
.intel_syntax noprefix

/*  WIP to make a functional script out of the unfinished, partial example code given in the Penetration Testing Professional course from INE */

_functest:
/* ; /.//prologue for functest() */
PUSH EBP
MOV EBP,ESP
SUB ESP,0x07

/* ; /.// void functest(int a, int b, int c) { int test1 = 55; int test2 = 56; }
; DWORD stands for "doubleword" which is a 4 byte value, it sets the size of the space in memory that is being written to, kinda similar to an int declaration
; PTR stands for "pointer" and is telling the CPU to write the DWORD value at the immediate space that is being pointed to
; SS specifies the stack segment register, which is the portion of memory that contains the stack, which is part A of the logical address A:B for segmentation, denoting the base of the segment
; Here, the value from the stack pointer is used for part B for the logical address of the memory segment, since the stack pointer contains the value of the location of the top of the stack
; Because the stack is subtractive, going "back" in the stack means adding */
MOV DWORD PTR SS:[ESP+0x04],0x38
MOV DWORD PTR SS:[ESP],0x39

/* ; /.//epilogue for functest()
; reset the stack pointer to point to the base, which was defined at the beginning of the function, so we are now pointing back to the beginning of functest() */
MOV ESP,EBP
/* ; by popping the base pointer, we are restoring its value to the previous base, which is at the beginning of main()
; this is because we stored the value of the previous base at the beginning of the new base during the prologue, so we are now popping that stored value back into the base pointer register */
POP EBP
/* ; return essentially pops the value from the stack into the EIP and then jumps to it, which in this case would be the old EIP if defined earlier */
RET

_mainfunc:
/* ; /.// prologue for main()
;save current base pointer for later use */
PUSH EBP
/* ; modify base pointer to match the current top of the stack */
MOV EBP,ESP
/* ; expand the stack to make room for the next few variables, each variable being 4 bits in an x86 architecture
; 4 bits each for 3 variables means 12 bits total, or 0C in hex, since 10=A, 11=B, 12=C, etc. except we have to count 0 so we subtract 1, making it 0x0B */
SUB ESP,0x0B

/* ; /.// main() function { int x = 11; int z = 12; int y = 13; }
; manually writes the variables to the space behind the stack pointer
; the first variable takes up space from ESP+0x08 to ESP+0x0C, being 0x08, 0x09, 0x0A, and 0x0B - 0x0B is hex for 11, which is the value of x */
MOV DWORD PTR SS:[ESP+0x08],0x0B
/* ; the second takes up space from ESP+0x04 to 0x08, being 0x04, 0x05, 0x06, and 0x07-  0x0C is hex for 12, which is the value of z */
MOV DWORD PTR SS:[ESP+0x04],0x0C
/* ; the third takes up space from ESP+0x00 to 0x04, being 0x00, 0x01, 0x02, and 0x03 - 0x0D is hex for 13, which is the value of y */
MOV DWORD PTR SS:[ESP],0x0D

/* ; the rest is mostly the same process as above

; /.// parameters for calling functest(30, 31, 32) */
PUSH 0x20
PUSH 0x1F
PUSH 0x1E

/* ; /.// define EIP and go to functest() */
CALL _functest

/* ; /.//epilogue for main()
; reset the stack pointer to point to the base, which was defined at the beginning of the function, so now we are pointing to the beginning of main() */
MOV ESP,EBP
/* ; this time, when we pop the base pointer, it will now go back to the value it had before it was set to the beginning of main(), which should be(?) the beginning of the entire program */
POP EBP
RET

_start:
/* ; /.// paramaters for main(int argc, char argv*[]) */
PUSH 0x0
PUSH 0x0
/* ; initialized parameters to 0 because they have no value, which I think is normally the default in C?

;/.//define EIP and go to main() */
CALL _mainfunc

/* ;/.//exit the program
; the syscall reads from the accumulator to determine what system instruction to execute, here 0x60 corresponds to sys_exit */
MOV EAX,0x60
/* ; set return value to 0, meaning "ok" */
MOV EDI,0x0
syscall
