// WIP to make a functional script out of the example code given in the Penetration Testing Professional course from INE

// paramaters for main(int argc, char argv*[])

// define EIP?

// prologue for main()
push ebp
mov ebp,esp
sub esp,20

// main() function
mov dword ptr ss:[esp+1c],0B
mov dword ptr ss:[esp+18],0C
mov dword ptr ss:[esp+14],0D

// parameters for calling functest(30, 31, 32)
mov dword ptrs ss:[esp+4],1f
mov dword ptr ss:[esp],1e

//define EIP?

//prologue for functest()
push ebp
mov ebp,esp
sub esp,10

// void functest(int a, int b, int c)
mov dword ptr ss:[esp+number],37
mov dword ptr ss:[esp+number],38

//epilogue for functest()
mov esp,ebp
pop ebp
ret

//epilogue for main()
mov esp,ebp
pop ebp
ret
