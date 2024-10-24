.data
x: .long 77777
rez: .long 0
.text
.global main

main:

movl x,%eax
movl $0,%ecx

etloop:
cmp $0,%eax
je etexit

movl %eax,%ebx
andl $1,%ebx
add %ebx,%ecx

shr $1,%eax
jmp etloop


etexit:
movl %ecx,rez
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
