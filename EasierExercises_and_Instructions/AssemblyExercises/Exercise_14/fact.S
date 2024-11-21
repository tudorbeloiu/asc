.data
x: .long 12
rez: .long 0
.text
.global main

main:
movl x,%eax
movl x,%ebx
subl $1,%ebx

cmp $0,%eax
je etzero

etloop:
cmp $1,%ebx
je etrez

movl $0,%edx
mul %ebx
decl %ebx
jmp etloop


etrez:
movl %eax,rez
jmp etexit

etzero:
movl $1,rez

etexit:
movl $1,%eax
movl $0,%ebx
int $0x80

.section .note.GNU-stack,"",@progbits
