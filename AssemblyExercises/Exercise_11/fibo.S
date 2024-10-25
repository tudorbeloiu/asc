.data
f1: .long 1
f2: .long 1
n: .long 11
rez: .long 0
.text

.global main

main:
movl $2,%ecx
movl f1,%eax
movl f2,%ebx

etloop:
cmp n,%ecx
je etrez

movl %ebx,%edx
addl %eax,%ebx
movl %edx,%eax
incl %ecx
jmp etloop


etrez:
movl %ebx,rez
jmp etexit

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
