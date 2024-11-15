.data
f1: .long 1
f2: .long 1
f3: .space 4
n: .space 4
rez: .space 4
msjInput: .asciz "%ld"
msjOutput: .asciz "Numarul cautat este: %ld \n"

.text

fibo:
pushl %ebp
mov %esp,%ebp

pushl %ecx
pushl %edx


movl 8(%ebp),%edx
movl f1,%eax
movl f2,%ebx

etloop:

movl %ebx,%ecx
addl %eax,%ecx
movl %ebx,%eax
movl %ecx,%ebx

decl %edx
cmp $2,%edx
jne etloop


popl %edx
popl %ecx
popl %ebp

ret

.global main

main:
pushl $n
pushl $msjInput
call scanf
popl %eax
popl %eax

movl $2,%eax
movl n,%ebx
cmp %eax,%ebx
jbe etafisare

pushl n
call fibo 
popl %ecx

movl %ebx,rez
pushl rez
pushl $msjOutput
call printf
popl %eax
popl %ebx
jmp etexit

etafisare:
pushl $1
pushl $msjOutput
call printf
popl %eax
popl %eax


etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
