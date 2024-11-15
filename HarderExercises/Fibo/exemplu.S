.data
x: .long 2
y: .long 3
s: .space 4

.text

add:
pushl %ebp
mov %esp,%ebp

movl 8(%ebp),%eax
addl 12(%ebp),%eax

popl %ebp

ret

.global main

main:
movl $1,%eax
movl $6,%ebx

pushl y
pushl x
call add

popl %edx
popl %edx

etexit:
mov $1,%eax
mov $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
