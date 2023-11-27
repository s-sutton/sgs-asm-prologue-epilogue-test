// WIP to make a functional script out of the example code given in the Penetration Testing Professional course from INE

// paramaters for main(int argc, char argv*[])

// define EIP?

// prologue for main()
push ebp
mov ebp,esp
sub esp,0x20

// main() function
mov dword ptr ss:[esp+0x1C],0x0B
mov dword ptr ss:[esp+0x18],0x0C
mov dword ptr ss:[esp+0x14],0x0D

// parameters for calling functest(30, 31, 32)
mov dword ptrs ss:[esp+0x04],0x1F
mov dword ptr ss:[esp],0x1E

//define EIP?

//prologue for functest()
push ebp
mov ebp,esp
sub esp,0x10

// void functest(int a, int b, int c)
mov dword ptr ss:[esp+number],0x37
mov dword ptr ss:[esp+number],0x38

//epilogue for functest()
mov esp,ebp
pop ebp
ret

//epilogue for main()
mov esp,ebp
pop ebp
ret
