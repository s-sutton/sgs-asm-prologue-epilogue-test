# sgs-asm-prologue-epilogue-test
Showcasing prologues and epilogues in x86 instruction set architecture Assembly language using a corresponding script written in C

This project aims at manually converting the following C program snippet into x86 Intel syntax;

  void functest(int a, int b, int c) {
    int test1 = 55;
    int test2 = 56;
  }
  int main() {
    int x = 11;
    int z = 12;
    int y = 13;
    functest(30,31,32);
    return 0;
  }

I worked out the corresponding hex by hand, except for 11 being 0B, as practice for counting and converting hex in my head. It's like re-learning math in a new base. I'm not sure how useful that is, but it's fun.

I wrote the Assembly code without any system calls. Instead, I tried to go through the C code step by step.
This made more sense to me at the time, as I tend to think of computer programs as a linear list of instructions for the machine to execute, not unlike regular programs. 
