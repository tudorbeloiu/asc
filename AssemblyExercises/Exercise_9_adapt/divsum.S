.data
x: .long 84
rez: .space 4
.text

.global main

main:
movl x,%eax
movl $1,%ecx
movl $1,%ebx
addl %eax,%ebx

etloop:
incl %ecx
movl x,%eax
cmp %ecx,%eax
je etsaverez

movl $0,%edx
divl %ecx

cmp $0,%edx
jne etloop

addl %ecx,%ebx
jmp etloop

etsaverez:
movl %ebx,rez

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
