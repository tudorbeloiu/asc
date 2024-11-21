.data
x: .long 10
y: .long 17

.text
.global main

main:

movl x,%eax
movl y,%ebx
jmp etswap

etswap:
xorl %eax,%ebx
xorl %ebx,%eax
xorl %eax,%ebx


etexit:

movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
