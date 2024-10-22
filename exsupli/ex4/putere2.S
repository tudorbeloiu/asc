.data
x: .long 15
rez: .long 0
.text

.global main

main:
movl x,%eax
movl $2,%ebx

loop:
cmp %eax,%ebx
jg etexit
shl $1,%ebx
jmp loop


etexit:
movl %ebx,rez
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
