# sgs-asm-prologue-epilogue-test
Showcasing prologues and epilogues in x86 instruction set architecture Assembly language using a corresponding script written in C

This project aims at manually converting the following C program snippet into x86 Intel syntax;

    void functest(int a, int b, int c) {
  
      int test1 = 55;
    
      int test2 = 56;
  
    }
  
  
    int main(int argc, char *argv[]) {
  
      int x = 11;

      int z = 12;

      int y = 13;
    
      functest(30,31,32);
    
      return 0;
    
    }

I worked out the corresponding hex by hand, except for 11 being 0B, as practice for counting and converting hex in my head. It's like re-learning math in a new base. I'm not sure how useful that is, but it's fun.

I wrote the Assembly code without any system calls. Instead, I tried to go through the C code step by step.
This made more sense to me at the time, as I tend to think of computer programs as a linear list of instructions for the machine to execute, not unlike regular programs.

In order to use this script, download test.s and compile it using gcc with the following commands:

`gcc -c -m32 test.s -o test.o`

This assembles the script into an object file.

`gcc -m32 -o test test.o -nostdlib -static`

This links the object file and creates an executable binary in ELF format, allowing it to run on Linux architectures. I do not have a Windows version of this script. I do not know why you would want one; I only wrote this to gain familiarity with Assembly.
