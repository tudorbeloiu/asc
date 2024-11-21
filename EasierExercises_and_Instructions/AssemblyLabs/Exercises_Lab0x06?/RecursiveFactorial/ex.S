.data
n: .space 4
inp: .asciz "%ld"
opt: .asciz "Factorialul numarului este: %ld"
newLine: .asciz "\n"

.text
factorial:
pushl %ebp
movl %esp,%ebp

movl 8(%ebp),%eax

cmpl $0,%eax
jne not_zero
movl $1,%eax
jmp exitprog

not_zero:
pushl %eax
decl %eax
pushl %eax

call factorial
popl %ecx

popl %ebx
mull %ebx

exitprog:
popl %ebp
ret

.global main

main:
pushl $n
pushl $inp
call scanf
popl %eax
popl %eax

pushl n
call factorial
popl %ebx

pushl %eax
pushl $opt
call printf
popl %ecx
popl %ecx

pushl $newLine
call printf
popl %ecx

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
