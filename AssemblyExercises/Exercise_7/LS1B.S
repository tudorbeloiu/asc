.data
x: .long 481273
rez: .long 0

.text

.global main

main:
movl x,%eax
movl $0,%ecx

etloop:
cmp $0,%eax
je etrez

movl %eax,%ebx
shrl $1,%ebx
andl %ebx,%eax
incl %ecx
jmp etloop


etrez:
movl %ecx,rez

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
