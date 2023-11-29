; /.// WIP to make a functional script out of the example code given in the Penetration Testing Professional course from INE

; /.// paramaters for main(int argc, char argv*[])

; /.// define EIP?

; /.// prologue for main()
PUSH EBP
MOV EBP,ESP
SUB ESP,0x20

; /.// main() function
MOV DWORD PTR SS:[ESP+0x1C],0x0B
MOV DWORD PTR SS:[ESP+0x18],0x0C
MOV DWORD PTR SS:[ESP+0x14],0x0D

; /.// parameters for calling functest(30, 31, 32)
MOV DWORD PTR SS:[ESP+0x04],0x1F
MOV DWORD PTR SS:[ESP],0x1E

; /.//define EIP?

; /.//prologue for functest()
PUSH EBP
MOV EBP,ESP
SUB ESP,0x10

; /.// void functest(int a, int b, int c)
MOV DWORD PTR SS:[ESP+0x04],0x37
MOV DWORD PTR SS:[ESP],0x38

; /.//epilogue for functest()
MOV ESP,EBP
POP EBP
RET ; probably not going to do anything since there is no call

; /.//epilogue for main()
MOV ESP,ENP
POP EBP
RET ; also not going to do anything without a call, probably?
