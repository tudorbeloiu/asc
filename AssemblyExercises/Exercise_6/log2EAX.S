.data
x: .long 2
rez: .long 0

.text
.global main

main:
movl x,%eax
movl $2,%ebx
movl $0,%ecx

etloop:
cmp $1,%eax
je etexit


movl $0,%edx
divl %ebx
incl %ecx
jmp etloop


etexit:
movl %ecx,rez
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
